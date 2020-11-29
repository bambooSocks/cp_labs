/*
   DTU 02158 Concurrent Programming
   Mandatory Assignment 4
   Fall 2020
*/

package main

import (
	"fmt"
	"ringBuffer"
)

func main() {

	q := ringBuffer.NewRingBuffer(3, nil)

	q.Produce("A")
	q.Produce("B")
	q.Produce("C")
	q.Produce("D")
	q.Produce("E")

	q.StartConsumers(2, func(item interface{}) { fmt.Println(item) })

	q.Stop()

}
