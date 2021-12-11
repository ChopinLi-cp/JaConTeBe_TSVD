The JaConTeBe (Java Concurrency Test Benchmark) suite provides code
and tests to reproduce concurrency bugs in several open-source Java
projects listed below.  The bugs cover various kinds of concurrency
bug types, including atomicity violations, data races, and deadlocks.
All the bugs are real world, collected from the projects' online
bug-tracking systems.

In most cases, reproducing the bug can use the unmodified project's
binary .jar files.  However, for a few cases, reproducing the bug is
difficult, because the buggy interleaving is rather infrequent, so the
project's .jar files are modified during class-loading to add more
control for interleavings (e.g., thread pauses).  JaConTeBe provides
the original project's binary .jar files and the source code for
class-loading instrumentation.

##Benchmark structure:

####The top-level JaConTeBe directories and files are organized as follows:

- dbcp: test project for Apache Commons DBCP (4 bugs)
- derby: test project for Apache Derby (5 bugs)
- groovy: test project for Groovy (6 bugs)
- jdk6: test project for JDK 6 (14 bugs)
- jdk7: test project for JDK 7 (6 bugs)
- log4j: test project for Apache Log4j (5 bugs)
- lucene: test project for Apache Lucene (2 bugs)
- pool: test project for Apache Commons Pool (5 bugs)
- jacontebe: test helper project
- lib: third party jar files common for all test projects
- scripts: shell scripts common for all test projects
- LICENSE: license file
- README: this description for the benchmark suite

####Each test project is organized as an Eclipse project:

- description: there is one HTML description file for each test and one index.html file for the entire project
- src: source code for tests
- lib: jars that tests depend on
- scripts: one Linux shell script and one Windows batch script for running each test
- scripts/all.sh: the Linux shell script for running all the tests at once
- .classpath
- .project
- .settings

####Each HTML description file lists these items:

1. Brief bug description:
   - Bug report's URL
   - Bug type
   - Buggy interleaving or thread dump for deadlocks
2. Bug reproduction:
   - Environment to reproduce the bug
   - How to run the test script
   - Available arguments for the test

####Each index.html summarizes all the bugs from the project in a table with these items:

- Bug name
- Bug type
- Bug report's URL
- Buggy project version
- Buggy project's source code URL

##How to run tests:

1. Either JDK6 or JDK7 suffices for most of the tests, but some tests
    require a specific JDK version that is specified in the description
    file for the test.

2. **For Linux**: execute the shell scripts in each project's "scripts"
    directory to compile and run the tests.  Each shell script is named
    after the bug ID and runs the test for the corresponding bug. The
    "all.sh" script can run all the tests of the project at once.

    An example of running a single test in the dbcp project:
        dbcp/scripts/270.sh
    An example of running all the tests in the dbcp project:
        dbcp/scripts/all.sh

    **For Windows**: execute the batch scripts in each project's "scripts"
    directory to compile and run the tests. Each batch script is named
    after the bug ID and runs the test for the corresponding bug.

    An example of running a single test in dbcp project:
        dbcp\scripts\270.bat

3. All test projects can be also imported in Eclipse for running (and
    debugging). Each test project depends on the jacontebe project, so
    jacontebe should be imported in Eclipse together with test projects.
    One can use "import existing projects into workspace" in Eclipse as
    all project directories include ".classpath" and ".project" files.

##How to print the thread dump when test runs into a deadlock:

**For Linux**: find the test's pid by "ps -axw" and then "kill -3 pid"

**For Windows**: Ctrl + Break
