"""
Defines all the activation functions and their derivatives

Dependencies
- Numpy

Currently supports
 - logistic sigmoid
"""

import numpy as np

def sigmoid(vect):
    """
    A vector sigmoid function 1/(1-exp(-vect)) that
    calculates sigmoid(vect)
    args:
        vect : a vector of floats
    returns:
        ret : array of 1/(1+exp(-vect))
    """
    return 1/(1+np.exp(-vect))

def sigmoid_d(vect):
    """
    A vector derivative sigmoid function sigmoid(vect)*(1-sigmoid(vect))
    args:
        vect : a vector of floats
    returns:
        ret : vector of d/dx sigmoid(vect)
    """
    s = sigmoid(vect)
    return s*(1-s)

def identity(vect):
    """
    Identity function representation
    """
    return vect
def identity_d(vect):
    """
    IDentity function derivative
    """
    return np.ones_like(vect)

def diode_exp(vect):
    """
    Calculates exp(x)
    """
    return np.exp(vect)
def diode_exp_d(vect):
    """
    calculates the derivative of the exp
    """
    return np.exp(vect)

def cos_sim(vect):
    """
    Calculates the cos of a vector
    """
    return np.cos(vect)

def cos_d(vect):
    """
    calculates the derivative of the cos
    """
    return -1*np.sin(vect)

def sin_sim(vect):
    """
    Calculates the cos of a vector
    """
    return np.sin(vect)

def sin_d(vect):
    """
    calculates the derivative of the cos
    """
    return np.cos(vect)

def sqrt_sim(vect):
    """
    Calculates the square root of a vector
    """
    return np.sqrt(vect)

def sqrt_d(vect):
    """
    calculates the derivative of sqrt
    """
    return 0.5/np.sqrt(vect)


def sqr_sim(vect):
    """
    Raises a vector to the power of two, element wise
    """
    return vect**2

def cube_sim(vect):
    """
    Raises a vector to the power of three, element wise
    """
    return vect**3

def four_sim(vect):
    """
    Raises a vector to the power of three, element wise
    """
    return vect**4

def five_sim(vect):
    """
    Raises a vector to the power of three, element wise
    """
    return vect**5

def sqr_d_sim(vect):
    """
    Raises a vector to the power of two, element wise
    """
    return 2*vect

def cube_d_sim(vect):
    """
    Raises a vector to the power of three, element wise
    """
    return 3*vect**2

def four_d_sim(vect):
    """
    Raises a vector to the power of three, element wise
    """
    return 4*vect**3

def five_d_sim(vect):
    """
    Raises a vector to the power of three, element wise
    """
    return 5*vect**4

def log_sim(vect):
    """
    Calculates the element wise natural logarithm 
    of a vector
    """
    return np.log(vect + 1)

def log_d_sim(vect):
    """
    Performs the derivative of the ln(x+1) activation
    """
    return 1/(vect+1)
