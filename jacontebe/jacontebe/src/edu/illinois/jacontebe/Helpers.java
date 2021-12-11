package edu.illinois.jacontebe;

import java.util.Timer;
import java.util.TimerTask;

import edu.illinois.jacontebe.framework.Reporter;
import edu.illinois.jacontebe.monitors.DeadlockMonitor;
import edu.illinois.jacontebe.monitors.EndlessLoopMonitor;
import edu.illinois.jacontebe.monitors.ThreadMonitor;
import edu.illinois.jacontebe.monitors.WaitingMonitor;

/**
 * This helper class is to start different monitors to terminate and report bug information
 * when program runs into deadlock or infinite loops. This monitor could be turned off when 
 * "-mo (--monitoroff)" option is set.
 * 
 * @author Ziyi Lin
 * 
 */
public class Helpers {

    public static final String TIMERNAME = "MonitorTimer";

    /**
     * Start the deadlock monitor with the default timeout value (30 seconds).
     */
    public static void startDeadlockMonitor() {
        startDeadlockMonitor(30);
    }

    /**
     * Start the deadlock monitor with a specified timeout value.
     * 
     * @param timeout
     *            The timer's waiting time in seconds. Program will be
     *            terminated when time is up. Set to 0 to disable the timer.
     */
    public static void startDeadlockMonitor(int timeout) {
        startMonitor(timeout, "deadlock", new DeadlockMonitor());
    }

    /**
     * Start the endless looping monitor with a specified timeout value. This
     * endless loop detector is not for general endless loop detection. It is
     * only for the situation when we know there is an endless looping and would
     * like to have it ended and reported automatically.
     * 
     * @param timeout
     *            The timer's waiting time in second. Program will be terminated
     *            when time is up. Set to 0 to disable the timer.
     */
    public static void startEndlessLoopMonitor(int timeout) {
        startEndlessLoopMonitor(timeout, "");
    }

    /**
     * Start the endless looping monitor with a specified timeout value and
     * prefix of worker threads' names. The endless looping detection is limited
     * within the threads whose names start with "threadPrefix".
     * 
     * @param threadPrefix
     *            prefix of worker threads' names. The default prefix is
     *            "Thread" if this parameter is set to an empty string
     *            <code>""</code>.
     * 
     * @timeout The timer's waiting time in second. Program will be terminated
     *          when time is up. Set it to 0 to disable timer.
     */
    public static void startEndlessLoopMonitor(int timeout,
            final String threadPrefix) {
        startMonitor(timeout, "endless loop", new EndlessLoopMonitor(
                threadPrefix));
    }

    /**
     * Start the forever waiting monitor with the default timeout value (30
     * seconds).
     */
    public static void startWaitingMonitor() {
        startWaitingMonitor(30);
    }

    /**
     * Start the forever waiting monitor with a specified timeout value.
     * 
     * @param timeout
     *            The timer's waiting time in second. Program will be terminated
     *            when time is up. Set to 0 to disable timer.
     */
    public static void startWaitingMonitor(int timeout) {
        startWaitingMonitor(timeout, new String[] {});
    }

    /**
     * Start the forever waiting monitor with a specified timeout value and the
     * forever waiting detection is limited within the specified threads.
     * 
     * @param timeout
     *            The timer's waiting time in second. Program will be terminated
     *            when time is up. Set to 0 to disable timer.
     * @param workerThreads
     *            The worker threads' names. Detection will be constrained
     *            within the specified threads.
     */
    public static void startWaitingMonitor(int timeout,
            final String... workerThreads) {
        startMonitor(timeout, "forever waiting", new WaitingMonitor(
                workerThreads));
    }

    private static void startMonitor(int timeout, String bugName,
            ThreadMonitor monitor) {
        if (!OptionHelper.getMonitorValue()) {
            startTimer(timeout, bugName);
            monitor.start();
        } else {
            Reporter.reportMonitorOff(bugName);
        }
    }

    private static void startTimer(int timeout, final String errorType) {
        if (timeout <= 0) {
            return;
        }
        new Timer(TIMERNAME).schedule(new TimerTask() {

            @Override
            public void run() {
                System.out.println("Program has been forced to exit from "
                        + errorType + ".");
                Runtime.getRuntime().halt(0);
            }

        }, timeout * 1000);
    }
}