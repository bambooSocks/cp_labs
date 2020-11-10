//Naive implementation of Barrier class
//Mandatory assignment 3
//Course 02158 Concurrent Programming, DTU, Fall 2020

//Hans Henrik Lovengreen     Oct 30, 2020

class NaiveBarrier extends Barrier {
    
    int arrived = 0;
    boolean active = false;
    int threshold = 9;
   
    public NaiveBarrier(CarDisplayI cd) {
        super(cd);
    }

    @Override
    public void sync(int no) throws InterruptedException {

        synchronized(this) {

            if (!active) return;

            arrived++;

            Thread.sleep(100);

            if (arrived < threshold) {
                wait();
            } else {
                arrived = 0;
                notifyAll();
            }

        }
    }

    @Override
    public void on() {
        active = true;
    }

    @Override
    public void off() {
        synchronized(this) {
            active = false;
            arrived = 0;
            notifyAll();
        }
    }

    @Override
    // May be (ab)used for robustness testing
    public void set(int k) {
        threshold = k;
//        synchronized(this) {
//             notifyAll();
//        }
    }

}
