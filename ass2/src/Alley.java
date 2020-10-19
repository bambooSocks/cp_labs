//Prototype implementation of Alley class
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2020

//Hans Henrik Lovengreen     Oct 2, 2020

public class Alley {

    Semaphore up, down, alley;
    boolean dir = false;

    public Alley() {
        up = new Semaphore(1);
        down = new Semaphore(1);
        alley = new Semaphore(4);
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
        if (no != 0) {
            boolean curDir = no < 5;
            if (curDir == dir) {
                alley.P();
            } else {
                if (curDir) {
                    down.P();
                } else {
                    up.P();
                }
                dir = curDir;
            }
        }
    }

    /* Register that car no. has left the alley */
    public void leave(int no) {
        alley.V();

        if (no < 5) {
            down.V();
        } else {
            up.V();
        }
    }

}
