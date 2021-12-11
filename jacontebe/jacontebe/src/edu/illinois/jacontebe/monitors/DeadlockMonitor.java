package edu.illinois.jacontebe.monitors;

import java.lang.management.ManagementFactory;
import java.lang.management.ThreadInfo;
import java.lang.management.ThreadMXBean;

/**
 * This class checks if worker threads deadlock each other.
 * 
 * @author Ziyi Lin
 * 
 */
public class DeadlockMonitor extends ThreadMonitor {

    private boolean bugFound;
    private ThreadInfo[] deadlockThreads;

    public DeadlockMonitor() {
        super("deadlock monitor");
        bugFound = false;
    }

    @Override
    protected boolean bugIsFound() {
        return bugFound;
    }

    @Override
    protected void checkStatus() {
        ThreadMXBean mxBean = ManagementFactory.getThreadMXBean();
        long[] deadlocks = mxBean.findDeadlockedThreads();
        if (deadlocks == null) {
            check2Exit();
        } else {
            bugFound = true;
            deadlockThreads = mxBean.getThreadInfo(deadlocks);
        }
    }

    @Override
    protected void insideIteratorJob(Thread t) {
        // No need to do anything
    }

    @Override
    protected void outsideIteratorJob() {
        // No need to do anything
    }

    @Override
    protected void report() {
        if (bugIsFound()) {
            System.out.println("=============Deadlock detected:==============");
            for (ThreadInfo ti : deadlockThreads) {
                System.out.println(ti);
            }
        } else {
            System.out.println("No deadlock is detected.");
        }
    }
}