package edu.illinois.jacontebe.argumentparsing;

import coring.opt.BooleanOpt;
import coring.opt.IntegerOpt;
import coring.opt.LongOpt;
import coring.opt.OptHelp;

/**
 * This class defines all legal command line options we can accept.
 * @author Ziyi Lin
 * 
 */
public class Options {

    @OptHelp("Turn off deadlock or forever waiting or endless loop monitor")
    final public BooleanOpt monitor = new BooleanOpt("monitoroff", "mo", false);

    @OptHelp("Number of threads")
    final public IntegerOpt threadNumber = new IntegerOpt("threadnum", "tn");

    @OptHelp("Number of loops")
    final public IntegerOpt loops = new IntegerOpt("loops", "l");

    @OptHelp("Time to pause during key instuctions to extend race window, so the bug is easier to reproduce")
    final public LongOpt sleepTime = new LongOpt("sleeptime", "st");
}