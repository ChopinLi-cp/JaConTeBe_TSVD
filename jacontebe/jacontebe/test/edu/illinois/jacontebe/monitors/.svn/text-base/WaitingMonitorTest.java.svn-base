package edu.illinois.jacontebe.monitors;


public class WaitingMonitorTest {

    public static void main(String[] args) {
        WaitingMonitor waitingMonitor = new WaitingMonitor();
        waitingMonitor.start();
        Thread t = new Thread(new Runnable() {
            public void run() {
                Object o = new Object();
                synchronized (o) {
                    try {
                        o.wait();
                    } catch (InterruptedException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }

            }
        });
        t.start();
    }

}
