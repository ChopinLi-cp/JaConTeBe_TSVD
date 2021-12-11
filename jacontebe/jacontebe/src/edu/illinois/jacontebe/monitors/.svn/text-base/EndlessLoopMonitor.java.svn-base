package edu.illinois.jacontebe.monitors;

import java.util.HashMap;
import java.util.Map;

/**
 * This class checks if there is an infinite loop. It's not for general endless
 * loop detection but is only available for the situation when we know there is
 * an endless loop and would like to have it ended and reported automatically.
 * 
 * @author Ziyi Lin
 * 
 */
public class EndlessLoopMonitor extends ThreadMonitor {

    private static final String DEFAULT_WORK_THREAD_PREFIX = "Thread";
    private static final int THRESHOLD = 20;

    private Thread buggyThread;
    private Map<String, Integer> scoreBoard;

    private String threadPrefix;

    public EndlessLoopMonitor() {
        super("infinite loop monitor");
        buggyThread = null;
        scoreBoard = new HashMap<String, Integer>();
        finished = false;
        threadPrefix = DEFAULT_WORK_THREAD_PREFIX;
    }

    public EndlessLoopMonitor(String threadPrefix) {
        this();
        setThreadPrefix(threadPrefix);
    }

    protected boolean bugIsFound() {
        return buggyThread != null;
    }

    protected void insideIteratorJob(Thread t) {
        if (t.getName().startsWith(threadPrefix)) {
            StackTraceElement[] trace = t.getStackTrace();
            try {
                String key = t.getName() + "@" + trace[0].getClassName() + "#"
                        + trace[0].getMethodName();
                Integer score = scoreBoard.get(key);
                if (score == null) {
                    score = 0;
                }
                if (score > THRESHOLD) {
                    buggyThread = t;
                    return;
                }
                scoreBoard.put(key, score + 1);
            } catch (Exception e) {
                // do nothing, ignore this exception
            }

        }
    }

    @Override
    protected void outsideIteratorJob() {
        // No need to do anything
    }

    protected void report() {
        if (bugIsFound()) {
            System.out.println("A suspicious endless loop is found");
            System.out.println("One of the probable buggy threads is "
                    + buggyThread.getName());
            for (StackTraceElement s : buggyThread.getStackTrace()) {
                System.out.println("   at " + s);
            }
        } else {
            System.out.println("No endless loop is detected.");
        }
    }

    public void setThreadPrefix(String threadPrefix) {
        this.threadPrefix = threadPrefix != null ? threadPrefix
                : DEFAULT_WORK_THREAD_PREFIX;
    }
}