//Prototype implementation of Alley class
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2020

//Hans Henrik Lovengreen     Oct 2, 2020

public class Alley {

    Semaphore alleyMutex, counterMutex, downwardsMutex, isFirstMutex, dirMutex;
    boolean isDirDownward = false;
    boolean isFirst = true;
    int counter = 0;

    public Alley() {
        downwardsMutex = new Semaphore(1);
        alleyMutex = new Semaphore(1);
        counterMutex = new Semaphore(1);
        isFirstMutex = new Semaphore(1);
        dirMutex = new Semaphore(1);
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
            boolean isDownward = no < 5;
            dirMutex.P();
            boolean isOppositeDir = isDownward != isDirDownward;
            dirMutex.V();
            if(isOppositeDir) {
                isFirstMutex.P();
                boolean isFirstDownwards = isFirst && isDownward;
                if (isFirstDownwards) isFirst = false;
                isFirstMutex.V();
                if (isFirstDownwards) {
                    downwardsMutex.P();
                    alleyMutex.P();
                    downwardsMutex.V();
                } else if (no < 5) {
                    downwardsMutex.P();
                    downwardsMutex.V();
                } else {
                    alleyMutex.P();
                }
                dirMutex.P();
                isDirDownward = isDownward;
                dirMutex.V();
            } 
            counterMutex.P();
            counter++;
            counterMutex.V();
        }
    }

    /* Register that car no. has left the alley */
    public void leave(int no) throws InterruptedException {
        if (no != 0) {
            boolean isDownward = no < 5;
            counterMutex.P();
            counter--;
            if (counter == 0) {
                alleyMutex.V();
                if (isDownward) {
                    isFirstMutex.P();
                    isFirst = true;
                    isFirstMutex.V();
                }
            }
            counterMutex.V();
        }
    }

}
