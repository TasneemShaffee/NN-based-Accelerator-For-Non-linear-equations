"""
- CSE Graduation project
Neural network layer class

Dependencies
-  Numpy
-  activation_functions.py
"""
import numpy as np
import activation_functions as actf


class Layer(object):
    """
    Implements a FULLY CONNECTED layer object, the neural network is defined
    as a chain of layers. Each layer supports inserting multiple inputs at the same time
    for batch training. In case the argument batch_size is left, the layer assumes only one set
    of inputs otherwise the layer assumes multiple inputs [for batch training]
    ### args
    - num_neurons : an int scaler value representing number of neurons,
      num row of the weight matrix
    - num_inputs : an int scaler value representing the number of the inputs [or] neurons,
      num col of the weight matrix at the previous layer
    - f_act : the activation function of all the neurons at the layer
    - f_act_d : the derivative of the activation funct.
    - out_neuron : flag specifing wheather this is an output neuron
      [useful for calculating delta]
    - eta : learning rate
    - batch_size : the batch size, specifies the number of cols at the input vector
    - trainable : the layer weights should be updated during the backward pass or not
    - act_per_neuron : a flag to ensure each neuron has its own activation function

    ### attributes
    - f_act
    - f_act_d
    - num_neurons
    - manh
    - weight_matrix
    - input_vector
    - out_vector
    - delta_vector
    - eta
    - batch_size
    - custom_f_act : an array of functions to appy. Function at index i maps to the ith neuron
    - custom_f_act_d : an array of function to apply at the backward pass
    - with_bias : allows a nonzero bias
    """
    def __init__(self, num_neurons, num_inputs, f_act=actf.sigmoid,
                 f_act_d=actf.sigmoid_d, eta=0.16, batch_size=1, trainable=True,
                 act_per_neuron=False, manh=False, with_bias=True):
        """
        Creates a neural network layer
        """
        self.f_act = f_act
        self.f_act_d = f_act_d
        self.eta = eta
        self.batch_size = batch_size
        self.num_neurons = num_neurons
        self.manh = manh # manhattan training algorithm
        self.with_bias = with_bias

        #create a randomly intiallized weight and net matrices
        self.weight_matrix = np.random.ranf([num_neurons, num_inputs+1]) #+1 for bias input at col 0
        self.net = np.zeros([num_neurons, 1])

        # create delta matrix, one delta per neuron
        self.delta_vector = np.zeros([num_neurons, 1])

        # create the input, output vectors
        # consider multiple inputs for batch training by specifying `batch_size` number of cols
        self.input_vector = np.zeros([num_inputs+1, batch_size]) #+1 for bias input of one at row 0

        # since multiple inputs within a batch corresponds to multiple outputs
        # let the output vector num cols = batch_size
        self.out_vector = np.zeros([num_neurons, batch_size])
        # weights are updated during backward pass or not
        self.trainable = trainable

        self.act_per_neuron = act_per_neuron
        self.custom_f_act =  []
        self.custom_f_act_d = []

        self.mass = 0
        self.velocity = 0

        self.parallel_fact = -1

    def fwd_pass(self, in_vect):
        """
        Forward pass the input
        ### args
        -    in_vect : a float vector for the inputs to probe on the layer an Nx1 vector
        """
        # set all the zero rows to one -> for bias input embedded within weight matrix
        if self.with_bias:
            x_b=1
        else:
            x_b=0
        self.input_vector[0, :] = x_b
        # set all the input(s) starting from row 1 for all the cols [for batch]
        self.input_vector[1:, :] = in_vect#.T

        # mac output
        # now handles dotting weights with multiple inputs
        if type(self.weight_matrix) is not np.ndarray:
            self.net = self.weight_matrix*self.input_vector
            #self.net = self.net.todense()
        else:
            self.net = np.dot(self.weight_matrix, self.input_vector)
        if not self.act_per_neuron:
            # apply f_act
            # now handles SIMD f_act on multiple Net vectors
            self.out_vector = self.f_act(self.net)

        # else handle the case where each neuron has its own f_act
        else:
            if self.parallel_fact != -1:
                self.out_vector[:self.parallel_fact] = self.custom_f_act[0](self.net[:self.parallel_fact])
                self.out_vector[self.parallel_fact:] = self.custom_f_act[-1](self.net[self.parallel_fact:])
                return
            for i in range(self.num_neurons):
                self.out_vector[i,:] = self.custom_f_act[i](self.net[i,:])

    def calc_delta_out(self, target_vect):
        """
        Calculate the delta terms of the output layer
        ### args
        - target_vect : desired output, taken from the data-set label
        """
        net_d = np.zeros([self.num_neurons, self.batch_size])
        if not self.act_per_neuron:
            net_d = self.f_act_d(self.net)
        else:
            for i in self.num_neurons:
                net_d[i,:] = self.custom_f_act_d[i](self.net[i,:])
        self.delta_vector = (target_vect - self.out_vector)*net_d#*self.input_vector.T

    def calc_delta_hidden(self, succ_layer):
        """
        Calculate the delta terms of the hidden layers
        ### args
        - past_layer : the succ. layer object
        """
        net_d = np.zeros([self.num_neurons, self.batch_size])
        if not self.act_per_neuron:
            net_d = self.f_act_d(self.net)
        else:
            if self.parallel_fact != -1:
                net_d[:self.parallel_fact] = self.custom_f_act_d[0](self.net[:self.parallel_fact])
                net_d[self.parallel_fact:] = self.custom_f_act_d[-1](self.net[self.parallel_fact:])
            else:    
                for i in range(self.num_neurons):
                    net_d[i,:] = self.custom_f_act_d[i](self.net[i,:])
        if type(succ_layer.weight_matrix) is not np.ndarray:
            self.delta_vector = (succ_layer.weight_matrix[:, 1:].T*succ_layer.delta_vector)*net_d
        else:
            self.delta_vector = np.dot(succ_layer.weight_matrix[:, 1:].T,
                                   succ_layer.delta_vector)*net_d
        #print(self.delta_vector)

    def update_weights(self):
        """
        updates all the weights of the neural network
        """
        # if this layer is not trainable ignore updating weight matrix
        if not self.trainable:
            return
        # broadcast
        # Sum the inputs in case of batch training
        print("delta",self.delta_vector)
        if self.manh:
           print("delta   ",np.sign(np.dot(self.delta_vector, self.input_vector.T)))
           print("eta  ",self.eta)
           print("old weights ", self.weight_matrix)
           print("result eta * delta ",self.eta*np.sign(np.dot(self.delta_vector, self.input_vector.T)))
           self.weight_matrix += 1.0/self.batch_size*self.eta*np.sign(np.dot(self.delta_vector, self.input_vector.T))\
           +self.eta*1e-1 #*np.random.ranf()
           print("new weights ",self.weight_matrix)
        else:
            beta1 = 0.9
            beta2 = 0.999
            print("delta ",self.delta_vector)

            dx = np.dot(self.delta_vector, self.input_vector.T)
            print("dx ", dx)
            self.velocity = beta2*self.velocity + (1-beta2)*(dx**2)
            print("velocity ",self.velocity)
            self.mass = beta1*self.mass + (1-beta1)*dx
            print("mass ", self.mass)
            # commented old GD
            #self.weight_matrix += 1.0/self.batch_size*self.eta*np.dot(self.delta_vector, self.input_vector.T)
            # now update via adam update rule
            print("old weights ",self.weight_matrix)
            print("eta",self.eta)
            print("division",(np.sqrt(self.velocity)+1e-8))
            print("square root ",np.sqrt(self.velocity))
            self.weight_matrix += 1.0/self.batch_size*self.eta*self.mass/(np.sqrt(self.velocity)+1e-8)
            print("new weights ", self.weight_matrix)