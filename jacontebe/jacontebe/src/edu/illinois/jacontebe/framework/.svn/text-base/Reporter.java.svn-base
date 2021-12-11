package edu.illinois.jacontebe.framework;

/**
 * This class reports test information.
 * 
 * @author Ziyi Lin
 * 
 */
public class Reporter {

    /**
     * Report the start of the test.
     * 
     * @param testName
     *            name of the test case
     * @param duration
     *            how much time (in seconds) is expected to finish the test. Set
     *            duration to 0 to not report the estimated finish time
     * @param bugType
     *            the type of the bug
     */
    public static void reportStart(String testName, int duration, String bugType) {
        System.out.println("********************************");
        System.out.println("Starting test: " + testName);
        System.out.println("Expected bug type: " + bugType);
        if (duration > 0) {
            System.out.println("This test should finish in " + duration
                    + " seconds.");
        }
        System.out.println("********************************");
        System.out.println();
    }

    public static void reportEnd(boolean bugReproduced) {
        String result = bugReproduced ? "Bug has been reproduced successfully."
                : "Failed to reproduce the bug.";
        System.out.println();
        System.out.println("Finished test: " + result);
    }

    public static void reportMonitorOff(String monitorType) {
        System.out
                .println(monitorType
                        + " monitor has been turned off."
                        + " There will be no "
                        + monitorType
                        + " report when the expected bug happens. And you need to terminate the program manually.");
    }
}