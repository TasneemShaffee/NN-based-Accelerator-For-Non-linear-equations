#ifndef __LAYERS_TEST_WEIGHTS__
#define __LAYERS_TEST_WEIGHTS__
#include "mat_mul_include.h"
/*
{ 0.7, 0.8 },      //Initial guesses
{ 0.1, 0.2 },      //Initial guesses
{ 0.3, 0.4 },      //Initial guesses
{ 0.5, 0.6 },      //Initial guesses
*/
float layer_w_mat[MAX_WEIGHT_MEM_DEPTH][NUM_PE] = {
	// initial guess start index : 0
	{ 0.7, 0.8 },      //Initial guesses
{ 0.1, 0.2 },      //Initial guesses
{ 0.3, 0.4 },      //Initial guesses
{ 0.5, 0.6 },      //Initial guesses
				   // layer 0,1 write cache start index : 4
{ 0.1, 0.1 },      //Layer 0,1 write cache
{ 0.1, 0.1 },      //Layer 0,1 write cache
{ 0.1, 0.1 },      //Layer 0,1 write cache
				   // layer 1 write cache start index : 7
{ 0.1, 0.1 },      //layer 1 write cache
{ 0.1, 0.1 },      //layer 1 write cache
{ 0.1, 0.1 },      //layer 1 write cache
{ 0.1, 0.1 },      //layer 1 write cache
				   // layer 2 write cache start index : 11
{ 0.1, 0.1 },      //Layer 2 write cache
{ 0.1, 0.1 },      //Layer 2 write cache
{ 0.1, 0.1 },      //Layer 2 write cache
{ 0.1, 0.1 },      //Layer 2 write cache
{ 0.1, 0.1 },      //Layer 2 write cache
{ 0.1, 0.1 },      //Layer 2 write cache
{ 0.1, 0.1 },      //Layer 2 write cache
				   // weight 1 WITHOUT ONES start index : 18
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 38.6817267523, 0.0 },    //W1 values
{ 0.0, 38.6817267523 },    //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 38.6817267523, 0.0 },    //W1 values
{ 0.0, 38.6817267523 },    //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 0.0, 0.0 },      //W1 values
{ 38.6817267523, 0.0 },    //W1 values
{ 0.0, 0.0 },      //W1 values
				   //  weight 2 start index : 42
{ 0.0, 0.0 },      //W2 values
{ 0.010000000001, -0.01 },         //W2 values
{ -0.01, 0.020000000001 },         //W2 values
{ 0.0, -0.002 },   //W2 values
{ 0.0, -0.002 },   //W2 values
{ 0.0, -0.002 },   //W2 values
{ 0.0, -0.002 },   //W2 values
{ 0.0, -0.002 },   //W2 values
{ 1.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ -1e-15, -1e-15 },        //W2 values
{ 0.0, 0.0 },      //W2 values
{ -0.002, -0.002 },        //W2 values
{ 0.002000000001, 0.0 },   //W2 values
{ 0.0, 0.002000000001 },   //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 1e-15, 0.0 },    //W2 values
{ 0.0, 1e-15 },    //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ -1e-15, -1e-15 },        //W2 values
{ 0.0, 0.0 },      //W2 values
{ -0.002, -0.002 },        //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.002000000001, 0.0 },   //W2 values
{ 0.0, 0.002000000001 },   //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 1e-15, 0.0 },    //W2 values
{ 0.0, 1e-15 },    //W2 values
{ 0.0, 0.0 },      //W2 values
{ -1e-15, -5.0 },  //W2 values
{ 0.0, 1.0 },      //W2 values
{ -0.002, 0.0 },   //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.002000000001, 0.0 },   //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 0.0, 0.0 },      //W2 values
{ 1e-15, 0.0 },    //W2 values
				   // weight 2 Transpose start index : 98
{ 0.010000000001, -0.01 },         //W2.T values
{ -0.01, 0.020000000001 },         //W2.T values
{ 0.0, -0.002 },   //W2.T values
{ 0.0, -0.002 },   //W2.T values
{ 0.0, -0.002 },   //W2.T values
{ 0.0, -0.002 },   //W2.T values
{ 0.0, -0.002 },   //W2.T values
{ 1.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ -0.002, -0.002 },        //W2.T values
{ 0.002000000001, 0.0 },   //W2.T values
{ 0.0, 0.002000000001 },   //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ -0.002, -0.002 },        //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.002000000001, 0.0 },   //W2.T values
{ 0.0, 0.002000000001 },   //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 1.0 },      //W2.T values
{ -0.002, 0.0 },   //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.002000000001, 0.0 },   //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 1e-15, 0.0 },    //W2.T values
{ 0.0, 1e-15 },    //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 1e-15, 0.0 },    //W2.T values
{ 0.0, 1e-15 },    //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 0.0, 0.0 },      //W2.T values
{ 1e-15, 0.0 },    //W2.T values
{ 0.0, 0.0 },      //W2.T values
				   // weight 1 Transpose start index : 154
{ 1.0, 0.0 },      //W1.T values
{ 0.0, 1.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 1.0, 0.0 },      //W1.T values
{ 0.0, 1.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 38.6817267523, 0.0 },    //W1.T values
{ 0.0, 38.6817267523 },    //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 1.0, 0.0 },      //W1.T values
{ 0.0, 1.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 38.6817267523, 0.0 },    //W1.T values
{ 0.0, 38.6817267523 },    //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 1.0, 0.0 },      //W1.T values
{ 0.0, 1.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 0.0, 0.0 },      //W1.T values
{ 38.6817267523, 0.0 },    //W1.T values
						   // best weight start index : 206
{ 0.1, 0.1 },      //Best weights
{ 0.1, 0.1 },      //Best weights
{ 0.1, 0.1 },      //Best weights
{ 0.1, 0.1 },      //Best weights
				   // velocity start index : 210
{ 0, 0 },          //velocity
{ 0, 0 },          //velocity
{ 0, 0 },          //velocity
{ 0, 0 },          //velocity
				   // mass start index : 214
{ 0, 0 },          //mass
{ 0, 0 },          //mass
{ 0, 0 },          //mass
{ 0, 0 }   //mass
};


float V_MEMORY[MAX_WEIGHT_MEM_DEPTH] = { 0, 0, 0, 0, 0, 0, 0, 0 };
float M_MEMORY[MAX_WEIGHT_MEM_DEPTH] = { 0, 0, 0, 0, 0, 0, 0, 0 };
float DELTA_MEM[MAX_WEIGHT_MEM_DEPTH][NUM_PE] = {
{ 0, 0 },
{ 0, 0 },
{ 0, 0 },
{ 0, 0 },

{ 0, 0 },
{ 0, 0 },
{ 0, 0 },
{ 0, 0 }
};
#endif
