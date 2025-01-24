"""
- CSE Graduation project
Parser class implementation
Dependencies
+ sympy
+ numpy

A wrapper around sympy used at the pre-processing step to generate the text file of the
weight coefficients
"""
#parser_class.py
import sympy
import numpy as np
def Connect_parser_Matlab(NUM_UNKNOWNS,X,NUM_EXP,in_file,out_file_name='out',ukwn_name = 'x'):
 error=0
 try: 
  P = Parser(NUM_UNKNOWNS,ukwn_name,in_file,out_file_name)
  P.add_nonlin_neuron(X, NUM_EXP)
  P.parse()
 except:
  error=1
 return error
class Parser(object):
    """
    The parser class implementation used at the pre-processing step
    to generate the text/data files of the floats to be loaded into the memory

    ## Arguments
    + `num_unknowns` : the number of unknowns. Mainly used to initialize matrix dimensions
    + `ukwn_name` : the unknown name e.g. 'x', 'v', ...
    + `in_file` : the dir of the input file of the symbolic equations
    + `out_file_name` : the prefix of the output file(s) where each file name
    will be appended to '_l_i' where i is the layer number

    ## Attributes
    + `in_file` : input file name that contain the system of equations at a symbolic form.
    By default it is assumed to be the file called 'eqns.txt' at the same dir. of execution
    + `num_unknowns` : the total number of unknowns
    + `ukwn_name` : the unknown name, used in case the user specified more than 1 char unknown. E.g. `ab` instead of `a`
    + `out_file` : the output file prefix. By default it is assumed to be 'out'
    + `nonlin_functs` : a list of lists e.g. [['exp', 30, RESERVED], ['sin', 10, RESERVED]] indicates that in the 2nd hidden layer
    we have synthesized 30 neurons with exp(x) activation function,
    followed by 10 neurons of sin(x) activation function
    + `w_mat_layer` : Layer 1,2 weight matrices of type numpy.array
    + `current_nonlin_neuron` : points to the index of the current nonlinear neuron
	in_file='eqns.txt', out_file_name='out'
    """
    def __init__(self, num_unknowns, ukwn_name = 'x', in_file='eqns.txt', out_file_name='out'):
        """
        constructor
        """
        self.in_file = in_file
        self.ukwn_name = ukwn_name
        self.current_eqn = 0
        self.out_file_name = out_file_name
        self.nonlin_functs = []
        self.num_unknowns = num_unknowns
        self.current_nonlin_neuron = num_unknowns
        # Keep in mind, we only consider networks with two hidden layers
        # this is the case for the type of equations arising in circuits
        self.w_mat_layer =[np.array([1,1]), np.array([1,1])]

    def add_nonlin_neuron(self, nonlin_func_name, synthesized_amount):
        """
        Adds a nonlinear neuron with an amount of `synthesized_amount`
        
        ## Arguments
        + `nonlin_func_name` : nonlinear function symbolic name, e.g. 'exp', 'sin', ....
        + `synthesized_amount` : the synthesized number of this function on the hardware.
        Note we **may** need to keep a reference for this value for future checking in case the
        synthesized hardware modules implementing it are less than the needed for evaluating
        some big nonlinear function(s)
        """
        # [name, amount, matrix_start_index]
        self.nonlin_functs.append([nonlin_func_name, synthesized_amount, self.current_nonlin_neuron, 0])
        self.current_nonlin_neuron += synthesized_amount

    def _update_weight_matrix(self, equation):
        """
        Updates the weight matrices based on the symbolic expression
        scanned coefficients

        ## Arguments
        + `equation`: a string representing one of the equations of the nonlinear system
        """
        eqn = sympy.sympify(equation)
        coeff_dict = eqn.as_coefficients_dict()

        # bias term
        self.w_mat_layer[1][self.current_eqn, 0] = coeff_dict[1]

        for i in coeff_dict:
            coeff_num = (str(i)[1:])
            if len(coeff_num) == 0:
                # this is the bias, we already considered this
                continue
            
            if not coeff_num.isdigit():
                # retrieve the full string
                coeff_num = str(i)
                mul_val = coeff_dict[i]
                # this term is the nonlinear function expression e.g. (ln(3x1+4x2), exp(5x2+3x3))
                for idx, i in enumerate(self.nonlin_functs):
                    if coeff_num.find(i[0]) != -1:
                        # set the muleplied constat for this expression
                        self.w_mat_layer[1][self.current_eqn, self.nonlin_functs[idx][2] + self.nonlin_functs[idx][3] +1] = mul_val
                        coeff_dict1 = sympy.sympify(coeff_num[coeff_num.find('('):])
                        coeff_dict1 = coeff_dict1.as_coefficients_dict()
                        for i in coeff_dict1:
                            coeff_num1 = (str(i)[1:])
                            if not coeff_num.isdigit():
                                TypeError("Invalid equation, make sure the eqn does not contain any nested\
                                nonlinear equations. E.g. sin(x+cos(y))\n Such case is not handled")
                            self.w_mat_layer[0][self.nonlin_functs[idx][2] + self.nonlin_functs[idx][3], int(coeff_num1)] = coeff_dict1[i]
                        self.nonlin_functs[idx][3] += 1
                continue
 

            coeff_num = int(coeff_num)
            # Note: coeff_num is not zero indexed since it follows matlab array notation
            self.w_mat_layer[1][self.current_eqn, coeff_num] = coeff_dict[i]
            # set the binary weight at the initial layer
            #self.w_mat_layer[0][self.current_eqn, self.current_eqn+1] = 1
            self.w_mat_layer[0][coeff_num-1, coeff_num] = 1

    def parse(self):
        """
        Run the parsing pre-processing step
        and outputs the weight matrices of both hidden layers in two separate files
        """
        self.w_mat_layer[0] = np.zeros([self.current_nonlin_neuron, self.num_unknowns+1])
        self.w_mat_layer[1] = np.zeros([self.num_unknowns, self.current_nonlin_neuron+1])
        self.current_eqn = 0
        with open(self.in_file) as f:
            for line in f:
                self._update_weight_matrix(line[:-1])
                self.current_eqn += 1
		#print(self.out_file_name+'_l_0.txt')
        np.savetxt(self.out_file_name+'_l_0.txt',self.w_mat_layer[0])
        np.savetxt(self.out_file_name+'_l_1.txt',self.w_mat_layer[1])

#Connect_parser_Matlab(2,"exp",1,"D:/semester 10/Graduation_project/GUI/New_Size_Page_one/eqns.txt","D:\\semester 10\\Graduation_project\\GUI\\New_Size_Page_one\\out")