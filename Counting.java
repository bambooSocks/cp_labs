 
public class Counting {

    static final int N = 10000;

    static volatile int x = 0;

    static class T extends Thread {

	public void run() {
	    for (int i = 0; i < N ; i++) {
		x++;
	    }
	}
    }
    
    public static void main(String[] argv) {
	try {
	    Thread t1 = new T();
	    Thread t2 = new T();
	    System.out.println("Starting with x = 0");
	    t1.start();
	    t2.start();
	    t1.join();
	    t2.join();
	    System.out.println("Ending with   x = "+x);
	} catch (Exception e) {System.out.println("Counting: "+e);}

    }
  
}



