#!/bin/bash
find `pwd` -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.java"  > cscope.files
cscope -b -q -k
rm -rf cscope.files
