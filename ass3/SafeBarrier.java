//Implementation of a basic Barrier class (skeleton)
//Mandatory assignment 3
//Course 02158 Concurrent Programming, DTU, Fall 2020

//Hans Henrik Lovengreen     Oct 30, 2020

class SafeBarrier extends Barrier {
    
    public SafeBarrier(CarDisplayI cd) {
        super(cd);
    }

    @Override
    public void sync(int no) throws InterruptedException {
    }

    @Override
    public void on() {
    }

    @Override
    public void off() {
    }

/*    
    @Override
    // May be (ab)used for robustness testing
    public void set(int k) {
    }
*/
    
}
