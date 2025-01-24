"""
- CSE Graduation project

All the required conversion functions
+ float to fixed
+ fixed to float
+ bit to float
+ bit to fixed

Dependencies
  + bitstring
  + numpy
  + matplotlib
"""
import bitstring
import numpy as np
import pylab


def bit2fix(x, msb, unsigned=0):
    """
    converts the bit string representation of a number
    into fixed point

    ## Arguments
    x: the bit string
    msb : the msb weight [+ve]

    ## Returns
    ret : the equivalent fixed point representation of the given bit string
    """
    p = msb-1
    ret = 0.0
    if x[0] == '1':
        ret = -2**(msb)
        if msb < 0:
            ret = 2**msb
        if unsigned:
            ret = 2**(msb)

    for i in x[1:]:
        if i == '1':
            ret += 2**(p)
        p = p - 1
    return ret

def bit2fp(x, we, wf):
    """
    Converts floating point string into a number
    """
    base = 2**(we-1)-1
    mantessa = x[1+we:]
    exp = x[1:1+we]
    mult = 1
    if x[0] == '1':
        mult = -1
    return mult*(1+bit2fix(mantessa, -1))*(2**(int(exp, 2)-base))

def fp2mem(x, we=8, wf=23, debug = False):
    """
    Converts a floating point number X into a memory bitstring representation
    the function is aware of the floating point mantessa size and exp size

    ## Arguments
    x : the floating point value
    we : the number of bits allocated for the exp part
    wf : the number of bits allocated for the mantessa part

    ## Returns
    converted_float   : the converted floating point number after conversion
    sign_bit, fexp, mantessa : the strings representing sign, exponent and mantessa of the floating point
                               in binary form
    """
    x = np.float32(x)
    binary_val = bitstring.BitArray(float=x, length=32).bin
    base = 2**(we-1)-1
    mantessa = binary_val[31-22:32][:wf]
    if x == 0.0:
        return 0, '0','0'*we, '0'*wf
    if np.isnan(x) or np.isinf(x):
        return 0, '0','0'*we, '0'*wf
    fexp = np.ceil(np.log2(np.abs(x))-1*(int(np.log2(np.abs(x)))-np.log2(np.abs(x)) != 0)) + base #binary_val[31-30:32-23][:we]
    #_, mantessa = fp2fix((abs(x)/2**(fexp-base)-1), -1, -wf)
    #print(fexp, base)
    fexp = bitstring.BitArray(int=int(fexp), length=32).bin[32-we:]
    sign_bit = binary_val[0]
    mult = 1
    maximum_possible_val = (1+bit2fix('1'*(wf), -1))*(2**(int('1'*(we-1)+'0', 2)-base))
    if(sign_bit == '1'):
        mult = -1
    converted_float = mult*(1+bit2fix(mantessa, -1))*(2**(int(fexp, 2)-base))
    if abs(x) > maximum_possible_val:#abs(converted_float - x) > 0.5:
        raise ValueError("we, wf are not enough for representing this number", converted_float, x)
    if debug:
        #print(mantessa)
        #print(fexp)
        print("The input value is: ", x)
        print ("The actual value of this float is: ", mult*(1+bit2fix(mantessa, -1))*(2**(int(fexp, 2)-base)))
    bitstring_var_fp = sign_bit+fexp+mantessa
    return converted_float, sign_bit, fexp, mantessa #bitstring_var_fp

def fp2fix(x, msb, lsb, unsigned=0):
    """
    converts the floating point input x into a fixed point

    ## Arguments
    x : the floating point value
    msb : the left most significant bit weight [+ve]
    lsb : the least significant bit weight [-ve]

    ## Returns
    fixedpoint_val : the fixed point representation of this number given the msb, lsb weights
    bitstring_var_fix : the fixed point bit representation
    [mostly will be used for simulation purposes]
    """
    x = np.float32(x)
    mult = 1
    fixedpoint_val = 0.0
    bitstring_var_fix = ''
    _c = '0'
    p = msb -1
    if(x <0):
        mult = -1
        fixedpoint_val += -2**(msb)
        _c = '1'
    bitstring_var_fix += _c
    
    if unsigned:
        fixedpoint_val = 0.0
        p = msb
        bitstring_var_fix = ''
        x = abs(x)

    while p >= lsb:
        _c = '0'
        if (fixedpoint_val + 2**p) <= x:
            fixedpoint_val += 2**p
            _c = '1'
        p -= 1
        bitstring_var_fix += _c
        #_c = '0'
    if fixedpoint_val < 0 and fixedpoint_val/x > 10:
        fixedpoint_val = 0
        bitstring_var_fix = '0'*(msb-lsb+1)
    return fixedpoint_val, bitstring_var_fix

def show_lut_acc(lut_arr, user_def_fun, msb, lsb):
    """
    plots the current LUT accuracy vs the actual
    accuracy

    ## Arguments 
    lut_arr : the lookup table generated array
    user_def_funct : the reference user given function to evaluate against
    msb : the fixed point left most significent bit weight [+ve]
    lsb : the fixed point least signigicent bit weight [-ve]
    """
    l = msb - lsb
    # a small accuracy for our reference
    _esplon = 0.001
    lower_bound = -2**msb
    upper_bound = bit2fix('0'+'1'*l, msb)
    x=np.arange(lower_bound, upper_bound, _esplon)
    y = user_def_fun(x)
    lut_plot_arr = np.zeros_like(x)
    lut_x = np.arange(lower_bound, upper_bound+2**(lsb), 2**(lsb))
    _err = 0.0
    for idx, i in enumerate(x):
        _, fixed_bit_val = fp2fix(i, msb, lsb)
        lut_plot_arr[idx]=(lut_arr[int(fixed_bit_val, 2)])
        __err = np.abs(lut_arr[int(fixed_bit_val, 2)]-user_def_fun(i))
        if __err > _err:
            _err = __err

    print("Your LUT contains, ", len(lut_arr), " Entries")
    print("Maximum Error: ", _err)
    pylab.plot(x, y, label="Accurate function")
    pylab.legend(loc=1)
    pylab.plot(x, lut_plot_arr, label="LUT approximation")
    pylab.legend(loc=1)
    pylab.show()

