Java Gource
===========

This script extracts java classes changelog from git - for using in [gource](http://gource.io/) visualisation.
Instead of showing tree of files, [custom log](https://github.com/acaudwell/Gource/wiki/Custom-Log-Format) output from this script will show a tree of Java classes, using packages as folders.

The script expects that your repository contains modules with standard maven-like structure, it looks for java files located at:
* */src/main/java
* */src/test/java


Usage, from top of your git repo:

> java-gource.sh <commit1> <commit2> | gource --log-format custom -

