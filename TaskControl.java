
/*
 * Concurrent Programming Lab 1 (Swing version)
 */

import java.awt.*;

import javax.swing.JTextField;

class Task extends Thread {

    JTextField tf; // Textfield to be used by this task

    public Task(JTextField t) {
        tf = t;
    }

    void setMyText(final String s) {
        /*
         * Checks if called by GUI thread (= dispatch thread) or not. Although
         * using invokeLater is always sound, calling setText directly is more
         * efficient when called by the GUI thread.
         */
        if (EventQueue.isDispatchThread()) {
            // On GUI thread -- OK to set text directly
            tf.setText(s);
        } else {
            // not on GUI thread -- put update request on event queue
            EventQueue.invokeLater(() -> {
                tf.setText(s);
            });
        }
    }

    public void run() {
        int cols = tf.getColumns();

        boolean useCPU = true; // Set true to consume CPU-cycles

        int basespeed = 5000; // millisecs to do task
        int variation = (useCPU ? 0 : 60); // Speed variation in percent

        long delay = Math.round(((Math.random() - 0.5) * variation / 50 + 1.0) * basespeed / cols);

        String s = "";

        setMyText(s);
        while (s.length() < cols) {

            if (useCPU) {
                for (int j = 0; j < 10000000 * delay; j++) {
                }
                if (this.isInterrupted()) {
                    s = s + "|";
                    setMyText(s);
                    break;
                }
            } else {
                try {
                    Thread.sleep(delay);
                } catch (InterruptedException e) {
                    s = s + "|";
                    setMyText(s);
                    break;
                }
            }

            s = s + "#";
            setMyText(s);
        }
    }
}

public class TaskControl {

    static final int N = 20; // Number of Textfields

    static int h = 0; // Number of 'hello'-s

    public static void main(String[] argv) {
        try {

            // Create window with N JTextFields: (d.tf[0], ... , d.tf[N-1])
            TaskDisplay d = new TaskDisplay("Task Control", N);

            d.println("Type command (x to exit):");

            Thread[] t = new Thread[N];
            for (int i = 0; i < N; i++) {
                t[i] = new Task(d.tf[i]);
            }

            // Main command interpretation loop
            W:
            while (true) {

                char c = d.getKey();

                try {
                    int num = Integer.parseInt(String.valueOf(c));
                    t[num].interrupt();
                    continue W;
                } catch (Exception e) {}


                switch (c) {

                    case 'x':
                        for (int i = 0; i < N; i++) {
                            t[i].join();
                        }
                        break W;

                    case 'h':
                        d.println("Hello " + (h++));
                        break;

                    case 't':
                        int firstAvailableIndex = -1;
                        for (int i = 0; i < N; i++) {
                            if (!t[i].isAlive()) {
                                firstAvailableIndex = i;
                                break;
                            }
                        }

                        if (firstAvailableIndex == -1) {
                            d.println("Error message");
                            break;
                        } else {
                            d.println("Runs a task");
                            t[firstAvailableIndex] = new Task(d.tf[firstAvailableIndex]);
                            t[firstAvailableIndex].start();
                        }
                        break;

                    default:
                        d.println("Don't know '" + c + "'");
                }
            }

            d.println("Program terminates");

            Thread.sleep(500);
            System.exit(0);

        } catch (Exception e) {
            System.out.println("Exception in Task Control: " + e);
            e.printStackTrace();
        }
    }
}
