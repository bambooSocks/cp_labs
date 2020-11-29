package ringBuffer

import (
	"fmt"
	"sync"
	"sync/atomic"
)

// RingBuffer using channels in Go
type RingBuffer struct {
	capacity      int
	size          int32
	onDroppedItem func(item interface{})
	items         chan interface{}
	stopCh        chan struct{}
	stopWG        sync.WaitGroup
	stopped       int32
	prodMutex     sync.Mutex
}

// NewRingBuffer creates and initializes a new ring buffer
func NewRingBuffer(capacity int, onDroppedItem func(item interface{})) *RingBuffer {
	return &RingBuffer{
		capacity:      capacity,
		onDroppedItem: onDroppedItem,
		items:         make(chan interface{}, capacity),
		stopCh:        make(chan struct{}),
	}
}

// StartConsumers starts up specified amount of consumers on the ring buffer using the consumer function
func (rb *RingBuffer) StartConsumers(num int, consumer func(item interface{})) {
	var startWG sync.WaitGroup
	for i := 0; i < num; i++ {
		rb.stopWG.Add(1)
		startWG.Add(1)
		go func() {
			startWG.Done()
			defer rb.stopWG.Done()
			for {
				select {
				case item, ok := <-rb.items:
					if ok {
						atomic.AddInt32(&rb.size, -1)
						consumer(item)
					}
				case <-rb.stopCh:
					return
				}
			}
		}()
	}
	startWG.Wait()
}

// Produce adds new items to the ring buffer to be processed by the consumers
func (rb *RingBuffer) Produce(item interface{}) bool {
	if atomic.LoadInt32(&rb.stopped) != 0 {
		rb.onDroppedItem(item)
		return false
	}

	rb.prodMutex.Lock()
	defer rb.prodMutex.Unlock()

	fmt.Println(rb.Size(), rb.Capacity())

	if rb.Size() >= rb.Capacity() {
		for rb.Size() >= (rb.Capacity() - 1) {
			<-rb.items
			atomic.AddInt32(&rb.size, -1)
		}
	}

	select {
	case rb.items <- item:
		atomic.AddInt32(&rb.size, 1)
		return true
	default:
		if rb.onDroppedItem != nil {
			rb.onDroppedItem(item)
		}
		return false
	}
}

// Stop disables all the producers and stops the consumers, finally it wait for the consumers to finish
func (rb *RingBuffer) Stop() {
	atomic.StoreInt32(&rb.stopped, 1)
	close(rb.stopCh)
	rb.stopWG.Wait()
	close(rb.items)
}

// Size returns the size of the ring buffer
func (rb *RingBuffer) Size() int {
	return int(atomic.LoadInt32(&rb.size))
}

// Capacity returns the maximum allowed capacity of the ring buffer
func (rb *RingBuffer) Capacity() int {
	return rb.capacity
}
