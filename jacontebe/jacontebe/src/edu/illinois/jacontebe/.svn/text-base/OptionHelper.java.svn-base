package edu.illinois.jacontebe;

import coring.opt.OptParser;
import coring.opt.OptParserStatus;
import edu.illinois.jacontebe.argumentparsing.Options;

/**
 * This class parses the input arguments.
 * 
 * @author Ziyi Lin
 *
 */
public class OptionHelper {
    static Options options = new Options();

    /**
     * Get "loops" option's value from input arguments. If this option is not
     * specified in arguments, a specified default value shall be returned.
     * 
     * @param defaultValue
     *            value to return when option is not specified in arguments.
     * @return int value of "loops" option
     */
    public static int getLoopsValue(int defaultValue) {
        int val = options.loops.val();
        return val <= 0 ? defaultValue : val;
    }

    /**
     * Get "sleeptime" option's value from input arguments. If this option is
     * not specified in arguments, a specified default value shall be returned.
     * 
     * @param defaultValue
     *            value to return when option is not specified in arguments.
     * @return long value of "sleeptime" option
     */
    public static long getSleepTimeValue(long defaultValue) {
        long val = options.sleepTime.val();
        return val <= 0 ? defaultValue : val;
    }

    /**
     * Get "threadnum" option's value from input arguments. If this option is
     * not specified in arguments, a specified default value shall be returned.
     * 
     * @param defaultValue
     *            value to return when option is not specified in arguments.
     * @return int value of "threadnum" option
     */
    public static int getThreadNumValue(int defaultValue) {
        int val = options.threadNumber.val();
        return val <= 1 ? defaultValue : val;
    }

    /**
     * Get "monitoroff" options value from input arguments. If this option is
     * not specified in arguments, a default value (false) shall be returned.
     * 
     * @return true if monitoroff option is set, false otherwise.
     */
    public static boolean getMonitorValue() {
        return options.monitor.val();
    }

    /**
     * Parse input command line options.
     * 
     * @param args
     *            input command line arguments
     * @return true if options are parsed successfully; false otherwise.
     */
    public static boolean optionParse(String[] args) {
        OptParserStatus status = OptParser.helpOrParse(options, args);

        if (!status.isSuccessfullyParsed()) {
            if (status.isError()) {
                System.out.println(status.getExceptionMsg());
            }
            return false;
        }
        return true;
    }
}