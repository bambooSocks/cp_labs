/*
   DTU 02158 Concurrent Programming
   Mandatory Assignment 4
   Fall 2020
*/

package main

import (
	"fmt"
)

const N = 5

var finished = make(chan bool)

func odds(in <-chan int, out chan<- int) {
	p := 2
	for i := 3; i < N*5; i += 2 {
		select {
		case <-in:
			break
		default:
			out <- i
		}
	}

	fmt.Println(p)
	close(out)

	// termination procedure
	for {
		rest := <-in
		if rest == 0 {
			finished <- true
			break
		}
	}
}

func sieve(in <-chan int, out chan<- int) {
	p := <-in
	var next int
	for {
		next = <-in
		if next == 0 {
			fmt.Println(p)
			break
		}

		if next%p != 0 {
			out <- next
		}
	}
	close(out)
}

func main() {
	// Declare channels
	var ch [N]chan int

	// Initialize channels
	for i := 0; i < N; i++ {
		ch[i] = make(chan int)
	}

	fmt.Println("The first", N, "prime numbers are:")

	// Connect/start goroutines
	go odds(ch[N-1], ch[0])

	for i := 0; i < N-1; i++ {
		go sieve(ch[i], ch[i+1])
	}

	// Await termination
	<-finished

	fmt.Println("Done!")
}
