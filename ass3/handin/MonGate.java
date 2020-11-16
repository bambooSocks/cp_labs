//Monitor implementation of Gate (skeleton)
//Mandatory assignment 3
//Course 02158 Concurrent Programming, DTU, Fall 2020

//Hans Henrik Lovengreen     Oct 30, 2020

public class MonGate extends Gate {
    boolean isopen = false;

    public synchronized void pass() throws InterruptedException {
        if (!isopen) wait();
    }

    public synchronized void open() {
        isopen = true;
        notifyAll();
    }

    public synchronized void close() {
        isopen = false;
    }

}
