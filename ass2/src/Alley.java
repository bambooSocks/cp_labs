import java.io.Console;
import java.util.ArrayList;
import java.util.List;

//Prototype implementation of Alley class
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2020

//Hans Henrik Lovengreen     Oct 2, 2020

public class Alley {

    Semaphore counterMutex;
    Semaphore[] carSem;
    Boolean[] carSemValueBelow0;
    int upwardCars = 0;
    int downwardCars = 0;

    public Alley() {
        carSem = new Semaphore[8];
        carSemValueBelow0 = new Boolean[8];
        for(int i = 0; i<carSem.length; i++) {
            carSem[i] = new Semaphore(0);
            carSemValueBelow0[i] = false;
        }
        counterMutex = new Semaphore(1);
    }

    /* Determine whether pos is right before alley is entered */
    public boolean atEntry(Pos pos) {
        return pos.equals(new Pos(10, 0)) || pos.equals(new Pos(1, 1)) || pos.equals(new Pos(2, 1)) ;
    }

    /* Determine whether pos is right after alley is left */
    public boolean atExit(Pos pos) {
        return pos.equals(new Pos(9, 1)) || pos.equals(new Pos(0, 0));
    }

    /* Block until car no. may enter alley */
    public void enter(int no) throws InterruptedException {
        int carIndex = no-1;
        boolean isDirDownward = no < 5;
        counterMutex.P();
        // If there are cars from the opposite direction then wait
        while((isDirDownward && upwardCars != 0) || (!isDirDownward && downwardCars != 0)) {
            carSemValueBelow0[carIndex] = true;
            counterMutex.V();  
            carSem[carIndex].P();
            counterMutex.P();
        }
        // Increment corresponding counters
        if(isDirDownward) {
            downwardCars++;
        } else if(!isDirDownward) {
            upwardCars++;
        }
        counterMutex.V();  

    }

    public void leave(int no) throws InterruptedException {
        boolean isDirDownward = no < 5;
        counterMutex.P();
        // update the counter
        if (isDirDownward) {
            downwardCars --;
        } else {
            upwardCars --;
        }
        // if the alley is available then wake up waiting cars
        if((downwardCars == 0 && isDirDownward) || (!isDirDownward && upwardCars == 0)) {
            for(int i = 0; i<carSem.length; i++) {
                if(carSemValueBelow0[i]) {
                    carSemValueBelow0[i] = false;
                    carSem[i].V();
                }
            }
        }
        counterMutex.V();
    }

}