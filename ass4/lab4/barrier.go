package main

import ( "fmt"; "sync")

const N = 10
const Iter = 5

var printer sync.Mutex;

type Barrier struct { count int; release *sync.Cond }

func (b *Barrier) init() { 
    b.count = 0
    b.release = sync.NewCond(&sync.Mutex{})
}

func (b *Barrier) sync(contrib int) int {
    b.release.L.Lock()
    defer b.release.L.Unlock()
    b.count++
    if b.count==N { 
        b.count = 0; b.release.Broadcast(); printBar()
    } else { 
        b.release.Wait()      // NO Spurious wakeups in Go!!
    }
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
            bar.sync()
        }
        wg.Done()
    }


    wg.Add(N)
    for i := 0; i < N; i++ { go worker(i) }

    wg.Wait()
}

