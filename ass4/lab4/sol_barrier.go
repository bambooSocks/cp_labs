package main

import ( "fmt"; "sync")

const N = 10
const Iter = 5

var printer sync.Mutex;

type Barrier struct {
     count int;
     sum int;
     rel bool;
     hold *sync.Cond;
     release *sync.Cond
}

func (b *Barrier) init() { 
    b.count = 0
    b.rel = false
    b.release = sync.NewCond(&sync.Mutex{})
    b.hold = sync.NewCond(b.release.L)        // Same mutex
}

func (b *Barrier) sync(contrib int) int {
    b.release.L.Lock()
    defer b.release.L.Unlock()
    
    if b.rel { b.hold.Wait() }

    b.count++
    b.sum += contrib
    if b.count==N { 
        b.rel = true; b.release.Broadcast(); printBar()
    } else { 
        b.release.Wait()      // NO Spurious wakeups in Go!!
    }
    b.count--

    mySum := b.sum

    if b.count == 0 { b.rel = false;  b.sum = 0;  b.hold.Broadcast() }
    return mySum
}


func printBar() {
    printer.Lock()
    defer printer.Unlock()
    for k := 0; k<N; k++ { fmt.Print("--") }
    fmt.Println()
}

func printNo(no int) { 
    printer.Lock()
    defer printer.Unlock()
    for k := 0; k<no; k++ { fmt.Print("  ") }
    fmt.Printf("%2d\n",no)
}

func main() {

    var bar Barrier
    var wg  sync.WaitGroup

    bar.init()

    worker := func (no int) {
        for j:=0; j<Iter; j++ { 
            printNo(no)
            sum := bar.sync(no)
 	    if sum != 45 { fmt.Printf("Wrong sum in %d: %d\n", no, sum )}
        }
        wg.Done()
    }


    wg.Add(N)
    for i := 0; i < N; i++ { go worker(i) }

    wg.Wait()
}

