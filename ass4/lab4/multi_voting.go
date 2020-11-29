package main

import (
	"fmt"
	"math/rand"
	"time"
)

type Votes struct{ a, b int }

func station(out chan<- Votes) {
	for i := 0; i < 10; i++ {
		time.Sleep(time.Duration(rand.Intn(2000)) * time.Millisecond)
		aVotes := rand.Intn(100)
		out <- Votes{aVotes, 100 - aVotes}
	}
	close(out)
}

func collector(in1, in2 <-chan Votes, out chan<- Votes) {
	var ch1 = in1
	var ch2 = in2
	var v Votes
	var ok bool
	for {
		select {
		case v, ok = <-ch1:
			if !ok {
				ch1 = nil
			}
		case v, ok = <-ch2:
			if !ok {
				ch2 = nil
			}
		}
		if ok {
			out <- v
		}
		if ch1 == nil && ch2 == nil {
			break
		}
	}
	close(out)
}

func main() {
	rand.Seed(time.Now().UnixNano())

	var votes [16]chan Votes

	for i := 1; i < 16; i++ {
		votes[i] = make(chan Votes)
	}

	for j := 1; j < 8; j++ {
		go collector(votes[2*j], votes[2*j+1], votes[j])
	}

	for k := 0; k < 8; k++ {
		go station(votes[8+k])
	}

	var tally Votes
	for {
		var v, ok = <-votes[1]
		if !ok {
			break
		}
		tally.a += v.a
		tally.b += v.b
		fmt.Println("Current tally:", tally)
	}

	tot := tally.a + tally.b
	if tot != 8000 {
		fmt.Println("Tally issue:", tot)
	}

	var winner string
	switch {
	case tally.a > tally.b:
		winner = "A"
	case tally.a < tally.b:
		winner = "B"
	default:
		winner = "undetermined"
	}
	fmt.Printf("All votes counted. And the winner is: %s\n", winner)
	if winner == "B" {
		fmt.Println("A: This must be FRAUD!!!")
	}
}
