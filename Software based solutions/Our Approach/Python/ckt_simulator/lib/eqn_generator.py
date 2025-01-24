"""
- CSE Graduation project
This module contains all the functions required to print
matrix for our graduation project
"""

import numpy as np
import scipy
from . import diode

def show_mna(mna, symbolic_eqns, T, print_res=True, uknown_char='x', char_array_length=20, round_size=4,
             out_file='eqns.txt'):
    """
    Attempts to either print and save the resulted output
    string that represents the system of equations of the circuit

    ## Args
        - mna : tha A matrix in the MNA algorithm, which is always a square matrix
        - symbolic_eqns : a vector of strings for all the symbolic nonlinear relations
        - T : constants added to the mna
        should be supported for both diodes and mosq transistor model
        - print_res : will print the result in the output terminal, if False it should
        save the result into an output file 'functions.txt'
        - uknown_char : for the equations in MATLAB format the name of the variable
        - char_array_length : the length of each string item in the unkown char array e.g. v(12345)
        - round_size : the number of points to consider in the strings
    """
    # the total number of the unknowns, keep in mind these might include volts
    num_unknowns = mna.shape[0]
    ukwn = np.chararray((1, num_unknowns), itemsize=char_array_length)
    ukwn[:] = '*'+uknown_char+'('
    braces = np.chararray((1, num_unknowns))
    braces[:] = ')'
    #mna = mna.round(round_size).astype('str')
    
    if (type(mna)==scipy.sparse.coo_matrix):
        print("Using sparse algorithm")
        _ret = ['']*num_unknowns
        sparse_rows, sparse_cols = mna.nonzero()
        # keep in mind, if a row does not exisit, all the coeff = 0
        # this will never happen in our case
        mna = mna.tocsr()
        for ii in range(sparse_rows.shape[0]):
            i = sparse_rows[ii]
            j = sparse_cols[ii]
            if _ret[i] != '':
                _ret[i] += '+ '
            _ret[i] += mna[i,j].astype('str') + '*x('+str(j+1)+')'
        _ret = np.array(_ret).reshape(num_unknowns,1)
    else:
        mna = mna.astype('str')
        _ret = mna + ukwn.astype('str')+(np.arange(num_unknowns)+1).astype('str')+braces.astype('str')
    ret = ['']*num_unknowns
    T = T.round(round_size).astype('str')
    out_file_str = ['']*len(symbolic_eqns)
    for i in range(num_unknowns):
        eqn = ""
        for expr in _ret[i, :]:
            if expr.find('0.0*') == -1:
                eqn = eqn + " + " +expr
        _t_term = ""
        if T[i, 0] != '0.0':
            _t_term = " + "+ T[i, 0]
        ret[i] = "F("+str(i + 1)+") = "+ eqn[3:] + _t_term + symbolic_eqns[i] + ';'
        c = symbolic_eqns[i].count(uknown_char+'(')
        c1 = eqn[3:].count(uknown_char+'(')
        non_lin_term = symbolic_eqns[i].replace(uknown_char+'(', uknown_char)
        non_lin_term = non_lin_term.replace(')', '', c)
        non_lin_term1 = eqn[3:].replace(uknown_char+'(', uknown_char)
        non_lin_term1 = non_lin_term1.replace(')', '', c1)
        out_file_str[i] = non_lin_term1 + _t_term + non_lin_term+'\n'

    if print_res:
        print("Equations of the circuit are : ")
        for i in ret:
            print(i)
        print ("------")
    print("Exporting equations to file: ", out_file)
    f = open(out_file,'w')
    for i in out_file_str:
        f.write(i)
    f.close()
    f = open('Eqn_matlab.txt','w')
    for i in ret:
        f.write(i+'\n')
    f.close()

def show_sym(elem, ukwn='x'):
    """
    Returns the symbolic I(v) equation for a specific non-linear device

    ## args
     - elem : the nonlinear element object
     - tx_symb : python array of strings of size mna_size that holds the symbolic nonlinear
     equations
    
    ## returns
     - eqn : the symbolic equation
    
    ## Supported nonlinear device
     - diode : I(v) = IS * (exp(v)/0.025852) - 1)
    """
    # get the number of output ports of an element
    out_ports = elem.get_output_ports()
    if(type(elem) == diode.diode):
        v_sym = ""
        eqn = " + " + str(elem.model.IS) +  '*(exp((_v_)/0.025852) - 1)'
        for index in range(len(out_ports)):
            dports = elem.get_drive_ports(index)
            for port in dports:
                if port[0]:
                    v_sym += '+ '+ukwn+'('+str(port[0])+')'
                if port[1]:
                    v_sym += '- '+ukwn+'(' +str(port[1])+')'
        eqn = eqn.replace('_v_', v_sym[2:])
        return eqn
    return ""