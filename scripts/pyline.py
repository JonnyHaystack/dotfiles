#!/usr/bin/python

import sys

i = 0
for line in sys.stdin:
    line = line[:-1]
    exec sys.argv[1]
    i += 1
