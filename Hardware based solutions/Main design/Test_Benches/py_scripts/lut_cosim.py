"""
- CSE Graduation project

A python cosimulation testbench for LUT module [sample based LUT]
"""

import struct
import random
import os
import pylab
import bitstring
import numpy as np
random.seed(1)

class LookUpTable():
    """
    The high level behavioural model for  LUT
    """
    def __init__(self):
        self.history = []

    def lut(self, x):
        """
        attempts to apply LUT function
        """
        rhs = np.exp(x)#np.cos(-x)*x**2*np.sin(x)#np.exp(x)
        self.history.append(rhs)

_x = np.arange(-2, 5, 0.05)[0:100]
def generate_test(num_cases = 10000, debug=0):
    model = LookUpTable()

    with open("test_vector.txt", 'w') as sim_file :
        for i in range(num_cases):
            x_float = np.float32(_x[i])#random.uniform(0, 3))
            x = '01' + bitstring.BitArray(float=x_float, length=32).bin
            sim_file.write(x + '\n')
            model.lut(x_float)
    return model

model = generate_test(num_cases = 100)

os.system("make _script_rule_lut")

uut_results = []
with open("test_results.txt", 'r') as uut_res_file:
    content = uut_res_file.readlines()
    for line in content:
        fo = line[:-1]
        f = int(fo, 2)
        uut_results.append(struct.unpack('f', struct.pack('I', f))[0])


lhs = np.array(uut_results[1:])
rhs = np.array(model.history[:-1])
peak_err = np.max(np.abs(lhs-rhs))
if (peak_err < 0.01):
    print("All testcases passed with a maximum error of: ", peak_err)
else:
    print("Test failed, maximum error exceeded; error: ", peak_err)

pylab.plot(_x[:99], uut_results[1:], 'b-+',label = "HDL results")
pylab.legend(loc='upper right')
pylab.plot(_x[:100], model.history, 'r-*',label="High level model results")
pylab.legend(loc='upper right')
pylab.show()
os.system("rm *.txt")
