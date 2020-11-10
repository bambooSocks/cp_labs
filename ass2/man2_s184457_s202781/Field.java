//Prototype implementation of Field class
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2020

//Hans Henrik Lovengreen     Oct 2, 2020

import java.util.HashMap;
import java.util.Map;

public class Field {

    Semaphore accessMap;
    Map<Pos, Semaphore> positionSemaphore;

    public Field() {
        positionSemaphore = new HashMap<>();
        accessMap = new Semaphore(1);
    }

    /* Block until car no. may safely enter tile at pos */
    public void enter(int no, Pos pos) throws InterruptedException {
        accessMap.P();
        positionSemaphore.putIfAbsent(pos, new Semaphore(1));
        accessMap.V();
        positionSemaphore.get(pos).P();
    }

    /* Release tile at position pos */
    public void leave(Pos pos) throws InterruptedException {
        positionSemaphore.get(pos).V();
    }

}
