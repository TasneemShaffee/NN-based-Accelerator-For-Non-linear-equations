"""
- CSE Graduation project
Implements the code responsible for training the neural network
in an object oriented fashion
"""

import numpy as np
import pylab

class Trainer(object):
    """
    A class implementing  training algorithms for our customized NN for solving
    nonlinear algebraic system of equations. The training algorithms currently supported are
    + Manhattan trainer [With adaptive step]
    + Adam trainer

    This software model will be used in our hardware implementation. All the operations being done on the
    weights are plain matrix operations

    ## Attributes
    + net : the customized neural network object of type FFNN
    + error_iter : the error at each iteration of type np.array
    + error_final : the final network accuracy for the sum of squares of type float
    + best_roots : the final obtained roots by the network [usually this will be a pointer to the network 1st layer]
    + num_iter : the total number of iterations taken by the NN
    + num_ukwns : the total number of unknowns for the system of equaitons
    + verbosity : the debug verbosity level [-1: none, 1: verbose]
    + target_out : the terget output of type np.array. Usually this is initiallized to zero
    since the roots required must zero all the system of equations
    """

    def __init__(self, net, out_vect, verbosity=-1):
        """
        constructor
        """
        self.net = net
        self.num_ukwns = self.net.layers[-3].weight_matrix.shape[0]
        self.best_roots = np.copy(net.layers[0].weight_matrix)
        self.verbosity = verbosity
        self.error_iter = []
        self.error_final = -1
        self.num_iter = 0
        self.target_out = out_vect

    def train_manh(self, in_vect, max_iter, tol_max, stop_after):
        """
        Trains the neural network object <net> for number of iterations <max_iter>
        ## args
        + in_vect : input vector to probe in [in our case this is a constant 1]
        + max_iter : number of iterations to train
        + tol_max : maximum resolution for eta or tolerance for roots
        + stop_after : the number of iterations to stop after in case no progress in the
        error function
        """
        debug = self.verbosity != -1
        for i in range(len(self.net.layers)):
            self.net.layers[i].manh = True
        if debug:
            print("Manhattan\ninitial weights are", self.net.layers[-3].weight_matrix[:, 1])
        for _ in range(tol_max):
            last_captured = 0
            if debug:
                print("initial weights are", self.net.layers[-3].weight_matrix[:, 1])
            for inner_iter in range(max_iter):
                self.num_iter += 1
                self.net.probe_input(in_vect)
                current_error = np.sum(self.net.layers[-1].out_vector**2)
                self.error_iter.append(current_error)
                if current_error < self.error_final or self.error_final == -1:
                    self.error_final = current_error
                    self.best_roots = np.copy(self.net.layers[-3].weight_matrix)
                    last_captured = inner_iter
                    #print (current_error)
                    if debug:
                        print("Error: ", current_error, '\n', self.best_roots[:, 1], inner_iter)
                        #input("press")
                if inner_iter - last_captured > stop_after:
                    # now its time to break the loop and increase the res. set the best weights as
                    # the next initial weights
                    self.net.layers[-3].weight_matrix = np.copy(self.best_roots)
                    if debug:
                        print("No progress for long iterations")
                    break

                # now back-propagate the error, adjust weights
                self.net.err_bp(self.target_out)
            # lower the eta resolution
            self.net.set_eta(self.net.eta*1e-1)
            self.net.layers[-3].weight_matrix = np.copy(self.best_roots)
            if debug:
                input("press")
        if debug:
            print("\nDetected roots: \n", self.best_roots[:, 1], '\nWith Error: ',
                    self.error_final, "\nTotal iterations : ", self.num_iter)
        print("Finished Manhattan with error: ", self.error_final)
        self.net.layers[-3].weight_matrix = np.copy(self.best_roots)
        self.net.probe_input(in_vect)

    def train_adam(self, in_vect, max_iter, eta):
        """
        Trains the neural network object <net> for number of iterations <max_iter>
        by adam trainer

        ## args
        + in_vect : input vector to probe in [in our case this is a constant 1]
        + out_vect : the desired network output [in our case this is a constant 0]
        + max_iter : number of iterations to train
        + eta : the learning rate
        """
        debug = self.verbosity != -1
        for i in range(len(self.net.layers)):
            self.net.layers[i].manh = False
        self.net.set_eta(eta)
        if debug:
            print("Adam\ninitial weights are", self.net.layers[-3].weight_matrix[:, 1])
        for _ in range(max_iter):
            self.num_iter += 1
            self.net.probe_input(in_vect)
            current_error = np.sum(self.net.layers[-1].out_vector**2)
            self.error_iter.append(current_error)
            # capture the lowest error and weights
            if current_error < self.error_final or self.error_final == -1:
                self.error_final = current_error
                self.best_roots = np.copy(self.net.layers[-3].weight_matrix)
            # now back-propagate the error, adjust weights
            self.net.err_bp(self.target_out)
        # lower the eta resolution
        if debug:
            print("\nDetected roots: ", self.best_roots[:, 1], '\nWith Error: ', self.error_final,\
                "\nTotal iterations : ", self.num_iter)
        print("Finished Adam with error: ", self.error_final)
        self.net.layers[-3].weight_matrix = np.copy(self.best_roots)
        self.net.probe_input(in_vect)

    def plot_err(self):
        """
        Attempts to plot the error for the solver after training
        """
        pylab.plot(np.log10(np.array(self.error_iter) + 1e-40))
        pylab.xlabel("Number of iterations")
        pylab.ylabel("Sum of squares Error in Log scale")
        pylab.show()
        print("The final error obtained is: ", self.error_final)
    
    def plot_err_roots(self, root_file, benchmark_name):
        """
        Attempts to show the absolute difference between the solver 
        detected roots and a benchmark detected roots
        """
        benchmark_roots = np.loadtxt(root_file)
        pylab.plot(np.abs(benchmark_roots - self.best_roots))
        pylab.xlabel("Root number")
        pylab.ylabel("Difference between our solver and "+str(benchmark_name))
        pylab.show()
