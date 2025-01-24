"""
- CSE Graduation project
Implements the code responsible for training the neural network
"""
import numpy as np
import pylab

np.set_printoptions(precision=7, suppress=True)
def train_nn_manh(net, in_vect, out_vect, max_iter, tol_max=9, stop_after=1000,
                  export_file=False, history_size=100, plt=False, num_ukwns=2, debug=False):
    """
    Trains the neural network object <net> for number of iterations <max_iter>

    ## args
    + net : the neural network object
    + in_vect : input vector to probe in [in our case this is a constant 1]
    + out_vect : the desired network output [in our case this is a constant 0]
    + max_iter : number of iterations to train
    + tol_max : maximum resolution for eta or tolerance for roots
    + stop_after : the number of iterations to stop after in case no progress in the
    error function
    """
    # the initial value for the error
    err_g = -1
    total_iter = 0
    for i in range(len(net.layers)):
        net.layers[i].manh = True
    print ("Manhattan\ninitial weights are", net.layers[0].weight_matrix[:, 1])
    y_axis = []
    weight_history = np.zeros([history_size, num_ukwns])
    best_weights = 0
    for _ in range(tol_max):
        last_captured = 0       
        if debug:
            print ("initial weights are", net.layers[0].weight_matrix[:, 1])
        for inner_iter in range(max_iter):
            ######
            # Only for visualization
            if export_file and total_iter<history_size:
                weight_history[total_iter] = net.layers[0].weight_matrix[:, 1]
            ######
            total_iter += 1
            net.probe_input(in_vect)
            current_error = np.sum(net.layers[-1].out_vector**2)
            w_now = net.layers[0].weight_matrix
            #print current_error, w_now[:, 1]
            # capture the lowest error and weights
            if current_error < err_g or err_g == -1:
                err_g = current_error
                best_weights = np.copy(w_now)
                last_captured = inner_iter
                #print (current_error)
                if debug:
                    print ("Error: ",current_error,'\n', best_weights[:,1], inner_iter) #_+1) #w_now[:, 1], _+1) # was commented
                    #input("press")
            if plt:
                y_axis+=[current_error]
            if inner_iter - last_captured > stop_after:
                # now its time to break the loop and increase the res. set the best weights as
                # the next initial weights
                net.layers[0].weight_matrix = np.copy(best_weights)
                if debug:
                    print("No progress for long iterations")
                break

            # now back-propagate the error, adjust weights
            net.err_bp(out_vect)
        # lower the eta resolution
        net.set_eta(net.eta*1e-1)
        net.layers[0].weight_matrix = np.copy(best_weights)
        if debug:
            input("press")
            #print("dummy_debug")
    print ("\nDetected roots: \n", best_weights[:, 1].reshape(-1,1), '\nWith Error: ', err_g,\
    "\nTotal iterations : ", total_iter)
    net.layers[0].weight_matrix = np.copy(best_weights)
    if export_file:
        np.savetxt('weights.txt', weight_history)
    if plt:
        pylab.plot(y_axis[5000:])
        pylab.show()

def train_nn_gd(net, in_vect, out_vect, max_iter, eta=0.1, export_file=False, history_size=100, num_ukwns=2):
    """
    Trains the neural network object <net> for number of iterations <max_iter>

    ## args
    + net : the neural network object
    + in_vect : input vector to probe in [in our case this is a constant 1]
    + out_vect : the desired network output [in our case this is a constant 0]
    + max_iter : number of iterations to train
    """
    # the initial value for the error
    for i in range(len(net.layers)):
        net.layers[i].manh = False
    err_g = -1
    total_iter = 0
    net.set_eta(eta)
    weight_history = np.zeros([history_size, num_ukwns])
    print ("Adam\ninitial weights are", net.layers[0].weight_matrix[:, 1])
    for inner_iter in range(max_iter):
        ######
        # Only for visualization
        if export_file and total_iter<history_size:
            weight_history[total_iter] = net.layers[0].weight_matrix[:, 1]
        ######
        total_iter += 1
        net.probe_input(in_vect)
        current_error = np.sum(net.layers[-1].out_vector**2)
        w_now = net.layers[0].weight_matrix

        # capture the lowest error and weights
        if current_error < err_g or err_g ==     -1:
            err_g = current_error
            best_weights = np.copy(w_now)
        # now back-propagate the error, adjust weights
        net.err_bp(out_vect)
    # lower the eta resolution
    print ("\nDetected roots: ", best_weights[:, 1], '\nWith Error: ', err_g,\
    "\nTotal iterations : ", total_iter )
    net.layers[0].weight_matrix = np.copy(best_weights)
    if export_file:
        np.savetxt('weights_gd.txt', weight_history)
