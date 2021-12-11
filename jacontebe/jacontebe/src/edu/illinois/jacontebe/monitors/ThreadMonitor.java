package edu.illinois.jacontebe.monitors;

import java.util.HashSet;
import java.util.Set;

import edu.illinois.jacontebe.Helpers;

/**
 * This class defines the process of monitoring the status of worker threads.
 * 
 * @author Ziyi Lin
 * 
 */
public abstract class ThreadMonitor extends Thread {

    protected boolean finished;
    protected String NAME; // the name of monitor thread itself
    protected Set<String> nonWorkerThreads;
    protected Set<String> workerThreads;
    protected int nonWorkerNum;

    protected ThreadMonitor(String name) {
        super(name);
        NAME = name;
        workerThreads = null;
        initNonWorkerSet();
    }

    abstract protected boolean bugIsFound();

    /**
     * check if all worker threads finish, so this monitor thread could also
     * terminate.
     */
    protected void check2Exit() {
        boolean ready2Exit = false;
        Set<Thread> threadSet = getCurrentThreads();
        nonWorkerNum = 0;
        for (Thread t : threadSet) {
            if (t.getName().equals("DestroyJavaVM")) {
                ready2Exit = true;
            }
            // Count non-worker threads.
            if ((t.getThreadGroup() != null && t.getThreadGroup().getName()
                    .equals("system"))
                    || notWorkerThread(t.getName())) {
                nonWorkerNum++;
                continue;
            }
            insideIteratorJob(t);
        }
        if (ready2Exit && nonWorkerNum == threadSet.size()) {
            finished = true;
        }
    }

    protected void checkStatus() {
        check2Exit();
        outsideIteratorJob();
    }

    protected Set<Thread> getCurrentThreads() {
        return Thread.getAllStackTraces().keySet();
    }

    private void initNonWorkerSet() {
        nonWorkerThreads = new HashSet<String>();
        nonWorkerThreads.add(NAME);
        nonWorkerThreads.add(Helpers.TIMERNAME);
        nonWorkerThreads.add("DestroyJavaVM");
        nonWorkerThreads.add("ReaderThread"); // This is junit test thread.
    }

    private boolean notWorkerThread(String threadName) {
        if (workerThreads == null || workerThreads.size() == 0) {
            return nonWorkerThreads.contains(threadName);
        } else {
            return !workerThreads.contains(threadName);
        }
    }

    abstract protected void insideIteratorJob(Thread t);

    abstract protected void outsideIteratorJob();

    abstract protected void report();

    public void run() {
        while (!finished) {
            checkStatus();
            if (bugIsFound()) {
                break;
            }
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
            }
        }
        report();
        // halt() can guarantee the program to exit, while exit() can't.
        Runtime.getRuntime().halt(0);
    }
}