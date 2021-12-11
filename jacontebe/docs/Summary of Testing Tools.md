##Concurrency Bug Testing tools

####1. Load/Stress testing Tools 
- ExecutorService http://docs.oracle.com/javase/7/docs/api/java/util/concurrent/Execu 
- TestNG - http://testng.org/doc/documentation-main.html#annotations 
- JUnit - http://www.junit.org/apidocs/junit/extensions/ActiveTestSuite.html
    -  JUnitPerf - http://testng.org/doc/documentation-main.html#annotations 
-  GroboUtils - http://groboutils.sourceforge.net/testing-junit/using_mtt.html – Custom Threading

####2. Specific interleavings testing Tools 
- MultithreadedTC - http://code.google.com/p/multithreadedtc/ 
    - Enhanced version for Junit 4 - http://code.google.com/p/multithreadedtc-junit4/ 
- IMUnit - http://mir.cs.illinois.edu/imunit/ 
- ThreadWeaver - http://code.google.com/p/thread-weaver/ 
- Awaitility - http://code.google.com/p/awaitility/

####3. All interleavings testing Tools 
- JavaPathFinder (JPF) - http://babelfish.arc.nasa.gov/trac/jpf 
    - JavaRaceFinder - http://www.cise.ufl.edu/research/JavaRacefinder/Java_Rac eFinder/JRF_Home.html

####4. Instrumentation Tools 
- AspectJ - www.eclipse.org/aspectj/ 
    - RacerAJ - http://www.bodden.de/tools/raceraj/ 
- CalFuzzer - http://srl.cs.berkeley.edu/~ksen/calfuzzer/ 
- (commercial) Flashlight / Jsure - http://www.surelogic.com/concurrency-tools.html

####5. Deterministic Tools
####Basic (find deadlocks etc.)

- ESC/Java *
- FindBugs 
- JLint *
- PMD

*: tool checks for this specific example

Allow the coordination of unit test’s threads to produce a specific scheduling. However, developer has to test for all possible interleavings and scheduling of threads to unearth existing bugs and hence they are a deterministic way of approaching the problem.

- MultiThreadedTC
- Concurrency Analyzer