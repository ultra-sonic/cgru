#!/usr/bin/env python

import os
import sys
import time

if len(sys.argv) <= 1:
	print('\nUsage: To check resource class launch:')
	print('%s [resclass] [period = 1 sec]\n' % os.path.basename(sys.argv[0]))
	sys.exit(1)

resclass = sys.argv[1]
period = 1
if len(sys.argv) > 2:
	period = int(sys.argv[2])

print("Class = '%s', period = %d" % (resclass, period))

mod = __import__('resources.%s' % resclass, globals(), locals(), [], -1)
res = eval('mod.%s.%s()' % (resclass, resclass))

for cycle in range(0, 100):
	res.do()
	print('\n')
	res.output()
	print('\n')
	time.sleep(period)
