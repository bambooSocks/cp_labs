//Implementation of a basic Barrier class (skeleton)
//Mandatory assignment 3
//Course 02158 Concurrent Programming, DTU, Fall 2020

//Hans Henrik Lovengreen     Oct 30, 2020

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

class SafeBarrier extends Barrier {

    boolean active = false;
    int arrived = 0;
    int threshold = 9;
    int moved = 0;
    Lock lock = new ReentrantLock();
    Condition isOverThreshold = lock.newCondition();
    Condition isLastCarArrived = lock.newCondition();

    public SafeBarrier(CarDisplayI cd) {
        super(cd);
    }

    @Override
    public void sync(int no) throws InterruptedException {
        lock.lock();
        try {
            if (!active) return;

            arrived++;

            // check for last car to arrive
            if (arrived >= threshold) {
                isOverThreshold.signalAll();
            } else {
                // if not the last wait
                while (active && arrived < threshold) {
                    isOverThreshold.await();
                }
            }

            // wait for all the cars to wake up and reset arrived
            moved++;
            if (moved >= arrived) {
                arrived = 0;
                moved = 0;
                isLastCarArrived.signalAll();
            } else {
                isLastCarArrived.await();
            }

        } finally {
            lock.unlock();
        }
    }

    @Override
    public void on() {
        active = true;
    }

    @Override
    public void off() {
        lock.lock();
        try {
            active = false;
            arrived = 0;
            isOverThreshold.signalAll();
        } finally {
            lock.unlock();
        }
    }

    @Override
    // May be (ab)used for robustness testing
    public void set(int k) {
        lock.lock();
        try {
            threshold = k;
            isOverThreshold.signalAll();
        } finally {
            lock.unlock();
        }
    }
    
}
