package main

import ( "fmt";  "time"; "math/rand" )

type Votes struct { a, b int }

func station(out chan<- Votes) {
    for i := 0; i < 10; i++ { 
        time.Sleep(time.Duration(rand.Intn(2000)) * time.Millisecond)
        aVotes := rand.Intn(100) 
        out<- Votes{aVotes, 100 - aVotes} 
    }
    close(out)
}

type Collector struct { in1, in2 chan Votes }

func collector(in1, in2 <-chan Votes, out chan<-  Votes) {
    var ch1 = in1
    var ch2 = in2
    var v Votes
    var ok bool
    for {
        select {
            case v, ok = <-ch1:
                if !ok { ch1 = nil }
            case v, ok = <-ch2:
                if !ok { ch2 = nil }
        }
        if ok { out <- v }
        if ch1==nil && ch2==nil { break }
    }
    close(out)
}

func main() {
    rand.Seed(time.Now().UnixNano())
    var votes = make(chan Votes)
    var collectors [7]Collector

    for i := 0; i < 7; i++ {
        collectors[i] = Collector{make(chan Votes), make(chan Votes)}
    }

    // build the collector structure
    
    go collector(collectors[0].in1, collectors[0].in2, votes)
    go collector(collectors[1].in1, collectors[1].in2, collectors[0].in1)
    go collector(collectors[2].in1, collectors[2].in2, collectors[0].in2)
    go collector(collectors[3].in1, collectors[3].in2, collectors[1].in1)
    go collector(collectors[4].in1, collectors[4].in2, collectors[1].in2)
    go collector(collectors[5].in1, collectors[5].in2, collectors[2].in1)
    go collector(collectors[6].in1, collectors[6].in2, collectors[2].in2)

    go station(collectors[3].in1)
    go station(collectors[3].in2)
    go station(collectors[4].in1)
    go station(collectors[4].in2)
    go station(collectors[5].in1)
    go station(collectors[5].in2)
    go station(collectors[6].in1)
    go station(collectors[6].in2)

    var tally Votes
    for {
        var v, ok = <-votes
        if !ok { break }
        tally.a += v.a;  tally.b += v.b
        fmt.Println("Current tally:", tally) 
    }
    
    tot := tally.a + tally.b

    if tot != 1000 { fmt.Println("Tally issue:", tot) }

    var winner string
    switch {
        case tally.a > tally.b: winner = "A"
        case tally.a < tally.b: winner = "B"
        default:                winner = "undetermined"
    }
    fmt.Printf("All votes counted. And the winner is: %s\n", winner)
    if winner == "B" { fmt.Println("A: This must be FRAUD!!!") }
}
