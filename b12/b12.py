//filename: b7.c
from __future__ import division
import math,os
from multiprocessing import Process,Queue
#probability for categorical attribute
def info(title):
    print title
    print ’module name:’, __name__
    if hasattr(os, ’getppid’): # only available on Unix
    print ’parent process:’, os.getppid()
    print ’process id:’, os.getpid()
