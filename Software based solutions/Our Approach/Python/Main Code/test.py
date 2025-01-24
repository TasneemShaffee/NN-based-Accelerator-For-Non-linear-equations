"""
Just for testing
"""

import FFNN
import numpy as np
import activation_functions as afs
from network_trainer import train_nn_manh, train_nn_gd


### the initial weights
INITIAL_GUESS = [0.0, 0.0]
###

# constant input value
IN_VECT = np.array([[1]])
NET = FFNN.FFNN([1, 2, 3, 2], manh=True, eta=0.1)
OUT_VECT = np.zeros([2, 1])


# zero at the first col since all these neurons have no bias
NET.layers[0].weight_matrix = np.array([ [0, INITIAL_GUESS[0] ],\
                                         [0, INITIAL_GUESS[1] ]]).astype('float')
NET.layers[0].with_bias = False # no bias for this layer
NET.layers[0].f_act = afs.identity
NET.layers[0].f_act_d = afs.identity_d


# Now set the 2nd hidden layer such that its weights are not changed during iterations
NET.layers[1].trainable = False
# Adjust the weights of this layer
NET.layers[1].weight_matrix = np.array([[0, 1, 0],\
                                        [0, 0, 1],\
                                        [0, 0, 1/0.0258]]).astype('float')

# each neuron has its own f_act
NET.layers[1].act_per_neuron = True
NET.layers[1].custom_f_act = [afs.identity, afs.identity, afs.diode_exp]
NET.layers[1].custom_f_act_d = [afs.identity_d, afs.identity_d, afs.diode_exp]
NET.layers[1].with_bias = False

# Now set the 3rd hidden layer such that its weights are not changed during iterations
NET.layers[2].trainable = False
# Adjust the weights of this layer
NET.layers[2].weight_matrix = np.array([[-0.001, 0.05, -0.05, 0],\
                                        [-1e-15, -0.05, 0.05, 1e-15]]).astype('float')

# All the output neurons are with identity f_act
NET.layers[2].f_act = afs.identity
NET.layers[2].f_act_d = afs.identity_d

# The neural network now is formed and a fwd pass = function evluations

# NET.probe_input(IN_VECT, debug=True)
# NET.err_bp(OUT_VECT, debug=True)
train_nn_manh(NET, IN_VECT, OUT_VECT, 5000, tol_max=13, export_file=True,
              history_size=9000, plt=True)
#train_nn_gd(NET, IN_VECT, OUT_VECT, 30000, 0.0001, export_file=True, history_size=9000)
