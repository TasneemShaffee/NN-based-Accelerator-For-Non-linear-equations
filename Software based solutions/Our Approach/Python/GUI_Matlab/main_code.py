import sys

#sys.path.insert(0, '../nn_python')
#sys.path.insert(0, '../ckt_simulator')

import FFNN
#import lib.ahkab as ahkab
from parser_class import Connect_parser_Matlab
import activation_functions as afs
from network_trainer import train_nn_manh, train_nn_gd
import numpy as np

### Script arguments
#NETLIST_NAME = "10_eqns.txt"
#NUM_UNKNOWNS = 10
#NUM_EXP = 18

# initial guess is set to 7x zeros
#INITIAL_GUESS = [0.0]*NUM_UNKNOWNS
#########

def main_code(INITIAL_GUESS,NUM_UNKNOWNS, X, NUM_EXP, in_file, out_file_name='out', ukwn_name='x'):
    ### Run the simulation and export the output files
    # CKT = ahkab.netlist_parser.parse_circuit("../ckt_simulator/" + NETLIST_NAME)[0]
    # OPA = ahkab.new_op()
    # R = ahkab.run(CKT, OPA)['op']
    # print(R)
    #########

    ## Parser section
    # create a parser to parse an eqn with NUM_UNKNOWNS unknwons
    #P = Parser(NUM_UNKNOWNS)
    #P.add_nonlin_neuron('exp', NUM_EXP)
    #P.parse()
    Connect_parser_Matlab(NUM_UNKNOWNS, X, NUM_EXP, in_file, out_file_name='out', ukwn_name='x')
    ########
    ### ff=np.indices((1,21)).reshape(2,-1).T
    ## Neural network section
    IN_VECT = np.array([[1]])
    NET = FFNN.FFNN([1, NUM_UNKNOWNS, NUM_UNKNOWNS + NUM_EXP, NUM_UNKNOWNS], manh=True, eta=0.1)
    OUT_VECT = np.zeros([NUM_UNKNOWNS, 1])

    # first hidden layer initillization
    NET.layers[0].weight_matrix = np.zeros([NUM_UNKNOWNS, 2])
    NET.layers[0].with_bias = False  # no bias for this layer
    NET.layers[0].f_act = afs.identity
    NET.layers[0].f_act_d = afs.identity_d

    # second hidden layer initiallization
    # Now set the 2nd hidden layer such that its weights are not changed during iterations
    NET.layers[1].trainable = False
    # Adjust the weights of this layer
    NET.layers[1].weight_matrix = np.loadtxt('out_l_0.txt')
    # each neuron has its own f_act
    NET.layers[1].act_per_neuron = True
    NET.layers[1].custom_f_act = [afs.identity] * NUM_UNKNOWNS + [afs.diode_exp] * NUM_EXP
    NET.layers[1].custom_f_act_d = [afs.identity_d] * NUM_UNKNOWNS + [afs.diode_exp] * NUM_EXP
    NET.layers[1].with_bias = False

    # third hidden layer initiallization
    NET.layers[2].trainable = False
    # Adjust the weights of this layer
    NET.layers[2].weight_matrix = np.loadtxt('out_l_1.txt')

    # All the output neurons are with identity f_act
    NET.layers[2].f_act = afs.identity
    NET.layers[2].f_act_d = afs.identity_d
    ########

    # Invoke the trainer
    train_nn_manh(NET, IN_VECT, OUT_VECT, max_iter=18000, tol_max=5, export_file=False,
                  plt=True, num_ukwns=NUM_UNKNOWNS, stop_after=5000, debug=False)

    # Testing the bias case
    if NET.layers[0].with_bias:
        f = NET.layers[0].weight_matrix
        ss = np.sum(f, axis=1)
        print(ss)
    return