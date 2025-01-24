"""
- CSE Graduation project

An HDL LUT generator given the user high level function

## Dependencies
+ flopoco  : for generating the fp2fix module
+ vhdl2vl  : for generating the equivalent verilog files
+ convert_vhdl_pre.py : for fixing vhdl2vl issues
+ numpy
+ bitstring
+ utils_convert_fpga

## Approach : Function sampling
"""
import bitstring
import numpy as np
from utils_convert_fpga import *

def user_def_fun(x):
    """
    User desired nonlinear function shall be inserted here. Should be in
    the form of `ret = f(x)`; where f is your desired numpy nonlinear function
    ## Arguments
    x : a scaler floating point value

    ## Returns
    ret : the function evaluation result as a bit string
    """
    ### your function here
    lhs = np.exp(x)
    ###
    return lhs


def gen_lut_mem_file(msb=5, lsb=-8, out_we=8, out_wf=23, out_file='lut_rom.txt', extra_bits=1):
    """
    Generates the LUT binary memory file for verilog module. The msb, lsb arguments
    control the size and accuracy of the LUT based approximator

    ## Arguments
    msb : fixed point left most significent bit weight [+ve]
    lsb : fixed point least significent bit weight [-ve]
    out_we : the LUT output floating point exponent bit size
    out_wf : the LUT output floating point mantessa bit size

    ## Returns
    lut_concent_bit : list of strings each representing the binary for the equivalent fixed point
    address
    """
    l = msb - lsb + 1
    last_entry = 2**(l)
    lut_concent_bit = ['']*last_entry #np.zeros(last_entry)
    _min = 0.0
    _max = 0.0
    for v in range(last_entry):
        memory_bitstring = bitstring.BitArray(uint=v, length=l).bin
        memory_fixed_val = bit2fix(memory_bitstring, msb)
        lut_fp_val = user_def_fun(memory_fixed_val)
        if memory_fixed_val < _min: _min = memory_fixed_val
        if memory_fixed_val > _max: _max = memory_fixed_val
        _, s, e, m = fp2mem(lut_fp_val, out_we, out_wf)
        extr = ''
        if extra_bits:
            if _ == 0.0 : extr='00' 
            else : extr = '01'
        lut_concent_bit[int(memory_bitstring, 2)] = extr+s+e+m

    print("Finshed filling LUT\n\nREPORT:")
    #np.savetxt(out_file, lut_concent_bit)
    with open(out_file, 'w') as file:
        file.write("\n".join(lut_concent_bit))
    print("\t+Generated output rom file at: ", out_file)
    print("\t+Number of address bits used: ", l)
    print("\t+Word size in bits: ", 1+out_we+out_wf)
    print("\t+Approximating function from x=", _min, " To x=", _max)


#--------------------------------------------------------------
# Memory file name
OUT_FILE_NAME = 'EXP_ROM.txt'

# MSB weight for fixed point convert [+ve]
FIXED_POINT_MSB = 4
# LSB weight for fixed point convert [-ve]
FIXED_POINT_LSB = -5
# Floating point LUT output we
FP_LUT_OUT_WE = 8
# Floating point LUT output wf
FP_LUT_OUT_WF = 23
# Using the two extra bits
EXTRA_BITS_FLAG = 1
#--------------------------------------------------------------
gen_lut_mem_file(FIXED_POINT_MSB, FIXED_POINT_LSB, FP_LUT_OUT_WE, FP_LUT_OUT_WF, OUT_FILE_NAME, EXTRA_BITS_FLAG)
