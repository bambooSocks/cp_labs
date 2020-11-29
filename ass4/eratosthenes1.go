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

func odds(out chan<- int) {
	p := 2
	for i := 3; i < N*5; i += 2 {
		out <- i
	}
	fmt.Println(p)
	close(out)
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
	go odds(ch[0])

	for i := 0; i < N-1; i++ {
		go sieve(ch[i], ch[i+1])
	}

	// Await termination
	for {
		rest := <-ch[N-1]
		if rest == 0 {
			break
		}
	}

	fmt.Println("Done!")
}
