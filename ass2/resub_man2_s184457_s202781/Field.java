//Prototype implementation of Field class
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2020

//Hans Henrik Lovengreen     Oct 2, 2020

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class Field {

    Map<Pos, Semaphore> positionSemaphore;

    public Field() {
        positionSemaphore = Collections.synchronizedMap(new HashMap<>());
    }

    /* Block until car no. may safely enter tile at pos */
    public void enter(int no, Pos pos) throws InterruptedException {
        positionSemaphore.putIfAbsent(pos, new Semaphore(1));
        positionSemaphore.get(pos).P(); 
    }

    /* Release tile at position pos */
    public void leave(Pos pos) throws InterruptedException {
        positionSemaphore.get(pos).V();
    }

}
