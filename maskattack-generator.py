#!/usr/bin/env python
import sys

# Function for identifying character type
def checkChar(char):

	if char.isdigit():
		return "?d"

	if char.isupper():
		return "?u"

	if char.islower():
		return "?l"

	return "?s";

# get argument from command line
ifile = sys.argv[1]

# try to open file and create results array
results = []
f = open(ifile, 'r')
lines = f.readlines()

# create mask array and store result
for line in lines:
	mask = []
	tidyline = line.replace('\r\n','')
	for c in tidyline:
		mask.append(checkChar(c))
	results.append("".join(mask))


# join array and print mask to use for password
for out in set(results):
	print out