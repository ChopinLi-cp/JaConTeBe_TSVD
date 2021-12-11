package edu.illinois.jacontebe.monitors;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * This class checks if worker threads are all in the state of waiting.
 * 
 * @author Ziyi Lin
 * 
 */
public class WaitingMonitor extends ThreadMonitor {

    private static final int THRESHOLD = 50;
    private int scoreBoard;
    private Map<Thread, Integer> waitingThreadsMap;
    private int waitingThreads;
    private double finalScore = 0.9 * scoreBoard;

    public WaitingMonitor() {
        super("waiting monitor");
        scoreBoard = 0;
        waitingThreadsMap = new HashMap<Thread, Integer>();
        waitingThreads = 0;
    }

    public WaitingMonitor(String[] workerThreads) {
        this();
        List<String> list = Arrays.asList(workerThreads);
        this.workerThreads = new HashSet<String>(list);
    }

    @Override
    protected boolean bugIsFound() {
        if (scoreBoard > THRESHOLD) {
            for (int e : waitingThreadsMap.values()) {
                if (e > finalScore) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    protected void insideIteratorJob(Thread t) {
        if (t.getState().equals(Thread.State.WAITING)
                || t.getState().equals(Thread.State.TIMED_WAITING)
                || t.getState().equals(Thread.State.BLOCKED)) {
            Integer lastvalue = waitingThreadsMap.get(t);
            if (lastvalue == null) {
                lastvalue = 0;
            }
            waitingThreadsMap.put(t, ++lastvalue);
            waitingThreads++;
        }

    }

    @Override
    protected void outsideIteratorJob() {
        // If all worker threads are waiting, it implies they may wait
        // forever because no one will notify the others to wake up. So
        // we add one score towards reporting suspicious forever waiting.
        if (waitingThreads == (getCurrentThreads().size() - nonWorkerNum)) {
            scoreBoard++;
            if (scoreBoard % 20 == 0) {
                System.out.println("detecting forever waiting threads...");
            }
        } else {
            scoreBoard = 0;
        }
        waitingThreads = 0;
    }

    @Override
    protected void report() {
        if (bugIsFound()) {
            System.out
                    .println("========================================================================");
            System.out
                    .println("Detected suspicious forever waiting bug, all worker threads are waiting:");
            for (Entry<Thread, Integer> e : waitingThreadsMap.entrySet()) {

                if (e.getValue() > finalScore) {
                    String status = "";
                    switch (e.getKey().getState()) {
                    case BLOCKED:
                        status = "blocked from obtaining a lock";
                        break;
                    case TIMED_WAITING:
                    case WAITING:
                    default:
                        status = "waiting";
                        break;
                    }
                    System.out.println();
                    System.out.println(e.getKey() + " is " + status + ":");
                    for (StackTraceElement st : e.getKey().getStackTrace()) {
                        System.out.format("   at %s \n", st);
                    }
                }
            }
        } else {
            System.out
                    .println("Suspicious forever waiting thread is not detected.");
        }
    }
}