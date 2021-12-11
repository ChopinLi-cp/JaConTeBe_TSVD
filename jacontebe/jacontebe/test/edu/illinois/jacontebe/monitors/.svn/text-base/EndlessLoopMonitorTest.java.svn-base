package edu.illinois.jacontebe.monitors;


public class EndlessLoopMonitorTest {

    // test program exits when there is no endless loop.
    public static void main(String[] args) {
        new EndlessLoopMonitor().start();
        Thread t = new Thread() {
            public void run() {
                while (true) {

                }
                // System.out.println("Do nothing");
            }
        };
        t.start();
    }
}
