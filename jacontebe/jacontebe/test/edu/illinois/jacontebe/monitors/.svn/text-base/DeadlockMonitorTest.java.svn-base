package edu.illinois.jacontebe.monitors;

import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;

import org.junit.Before;
import org.junit.Test;

/**
 * Test class for DeadlockMonitorTest
 * 
 * @author Ziyi Lin
 * 
 */
public class DeadlockMonitorTest {

    private class Thread1 extends Thread {
        public void run() {
            synchronized (o1) {
                try {
                    barrier.await();
                } catch (InterruptedException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (BrokenBarrierException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                synchronized (o2) {
                    System.out.println("Do something");
                }
            }
        }
    }

    private class Thread2 extends Thread {
        public void run() {
            synchronized (o2) {
                try {
                    barrier.await();
                } catch (InterruptedException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (BrokenBarrierException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                synchronized (o1) {
                    System.out.println("Do something else");
                }
            }
        }
    }

    private class Thread3 extends Thread {
        public void run() {
            try {
                barrier.await();
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (BrokenBarrierException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            // DO nothing, this thread will not deadlock with any others.
        }
    }

    public static void main(String[] args) {
        DeadlockMonitorTest test = new DeadlockMonitorTest();
        test.setup();
        test.noDeadlockTest();
    }

    private Object o1;

    private Object o2;

    private CyclicBarrier barrier;

    private DeadlockMonitor monitor;

    // Expect deadlock reports
    @Test
    public void deadlockTest() {
        Thread t1 = new Thread1();
        Thread t2 = new Thread2();
        t1.start();
        t2.start();
        try {
            t1.join();
            t2.join();
        } catch (InterruptedException e) {

        }
    }

    // When there is no deadlock, program should terminate.
    public void noDeadlockTest() {
        Thread t1 = new Thread1();
        Thread t2 = new Thread3();
        t1.start();
        t2.start();
        try {
            t1.join();
            t2.join();
        } catch (InterruptedException e) {

        }
    }

    @Before
    public void setup() {
        o1 = new Object();
        o2 = new Object();
        barrier = new CyclicBarrier(2);
        monitor = new DeadlockMonitor();
        monitor.start();
    }
}
