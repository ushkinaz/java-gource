java-gource
===========

Extracting java classes changelog from git - for using in gource visualisation.

This simple script prepares log file for [gource](https://code.google.com/p/gource/) vizualization.
Instead of showing tree of files, this log will show a tree of Java classes, using packages as folders.

The script expects that your repository contains modules with standard maven-like structure, it looks for java files located at
*/src/main/java
*/src/test/java
