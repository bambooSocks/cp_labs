public class Donald {

  static class P extends Thread {

    private String name;

    public P(String n) {
      name = n;
    }

    public void run() {
      try {
  	for (int i = 0; i <10 ; i++) {
  	  System.out.println("  I'm "+name);
//	  Thread.sleep(Math.round(Math.random()*1000));
        }
      } catch (Exception e) {System.out.println(name+": "+e);}
    }
  }

  public static void main(String[] argv) {
    try {
      P p1 = new P("Huey!");
      P p2 = new P("    Dewey!");
      P p3 = new P("        Louie!");
    
      System.out.println();
      System.out.println("Hi kids, who is who?");
    
      p1.start();
      p2.start();
      p3.start();

      p1.join();
      p2.join();
      p3.join();
    
      System.out.println();
      System.out.println("Enough, thanks!");
      System.out.println();
  
    } catch (Exception e) {System.out.println("main: "+e);}
  }
 
}


