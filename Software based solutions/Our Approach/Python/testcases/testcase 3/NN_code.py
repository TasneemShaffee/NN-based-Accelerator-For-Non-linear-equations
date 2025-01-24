"""
Circuit with Voltage source and Resistor->diode chain
Num unknowns : 1105
"""


import sys

sys.path.insert(0, '../../nn_python')
sys.path.insert(0, '../../ckt_simulator')
sys.path.insert(0, '../../parser')

import pylab
import time
import FFNN
import lib.ahkab as ahkab
from parser_class import Parser
import activation_functions as afs
from network_trainer import train_nn_manh, train_nn_gd
import numpy as np
from scipy.sparse import csc_matrix

### Script arguments
NETLIST_NAME = "ckt_netlist.txt"
NUM_UNKNOWNS = 1103
NUM_EXP = 1100

# initial guess is set to 7x zeros
INITIAL_GUESS = [0.0]*NUM_UNKNOWNS
#########

### Run the simulation and export the output files
CKT = ahkab.netlist_parser.parse_circuit(NETLIST_NAME)[0]
OPA = ahkab.new_op()
R = ahkab.run(CKT, OPA)['op']
#print(R)
#########

## Parser section
# create a parser to parse an eqn with NUM_UNKNOWNS unknwons
P = Parser(NUM_UNKNOWNS)
P.add_nonlin_neuron('exp', NUM_EXP)
P.parse()
########

## Neural network section
IN_VECT = np.array([[1]])
NET = FFNN.FFNN([1, NUM_UNKNOWNS, NUM_UNKNOWNS+NUM_EXP, NUM_UNKNOWNS], manh=True, eta=0.1)
OUT_VECT = np.zeros([NUM_UNKNOWNS, 1])

# first hidden layer initillization
NET.layers[0].weight_matrix = np.zeros([NUM_UNKNOWNS, 2])
NET.layers[0].with_bias = False # no bias for this layer
NET.layers[0].f_act = afs.identity
NET.layers[0].f_act_d = afs.identity_d

# second hidden layer initiallization
# Now set the 2nd hidden layer such that its weights are not changed during iterations
NET.layers[1].trainable = False
# Adjust the weights of this layer
NET.layers[1].weight_matrix = csc_matrix(np.loadtxt('out_l_0.txt'))
# each neuron has its own f_act
NET.layers[1].act_per_neuron = True
NET.layers[1].custom_f_act = [afs.identity]*NUM_UNKNOWNS + [afs.diode_exp]*NUM_EXP
NET.layers[1].custom_f_act_d = [afs.identity_d]*NUM_UNKNOWNS + [afs.diode_exp]*NUM_EXP
NET.layers[1].with_bias = False
NET.layers[1].parallel_fact = NUM_UNKNOWNS

# third hidden layer initiallization
NET.layers[2].trainable = False
# Adjust the weights of this layer
NET.layers[2].weight_matrix = csc_matrix(np.loadtxt('out_l_1.txt'))

# All the output neurons are with identity f_act
NET.layers[2].f_act = afs.identity
NET.layers[2].f_act_d = afs.identity_d
########

# Invoke the trainer [manhatten]

start = time.time()
for i in range(5):
    train_nn_manh(NET, IN_VECT, OUT_VECT, max_iter=18000, tol_max=4, export_file=False,
                plt=False, num_ukwns=NUM_UNKNOWNS, stop_after=5000, debug=False)

    # Invoke the trainer [Adam]
    train_nn_gd(NET, IN_VECT, OUT_VECT, max_iter=18000, export_file=False,
                num_ukwns=NUM_UNKNOWNS, eta=0.001)
end = time.time()
print ("Simulation consumed: ", end-start)
np.savetxt('T_2_roots.txt', NET.layers[0].weight_matrix[:,1])

ckt_res = []
for i in R.keys():
   ckt_res.append(R[i][0])
np.savetxt('ckt_res.txt', ckt_res)

pylab.plot(NET.layers[0].weight_matrix[:,1], 'r-*', label="Neural Network Roots")
pylab.plot(ckt_res, 'g-*', label="Circuit Simultor Roots")
pylab.legend(loc='upper right')
pylab.show()
