/*
* Testing the HLS dummy interface for generating dot-product+trainer engine
* Current high level design parameters are
* - MAX_WEIGHT_MEM_DEPTH  : the maximum synthesized weight memory depth; used for address bit width
* - NUM_PE          : the number of the processing elements to synthesize
*/

#include "mat_mul_include.h"
#include "cmath"
//#include <iostream>

//Flopoco interface
float flopoco_add(float a, float b)    // Flopoco add external core
{
  float ret;
  #pragma HLS RESOURCE variable=ret latency=0 core=FAddSub_nodsp
  #pragma HLS inline OFF
  ret = a + b;
  return ret;
}
float flopoco_mul(float a, float b)    // Flopoco multiply external core
{
  float ret;
  #pragma HLS pipeline II=1
  #pragma HLS RESOURCE variable=ret core=FMul_nodsp latency=4
  #pragma HLS inline OFF
  ret = a * b;
  return ret;
}
float flopoco_div(float a, float b)    // Flopoco division external core
{
  float ret;
  #pragma HLS pipeline II=1
  #pragma HLS RESOURCE variable=ret core=FDiv latency=12
  #pragma HLS inline OFF
  ret = a / b;
  return ret;
}
float flopoco_sqrt(float a)            // Flopoco division external core
{
  float ret;
  #pragma HLS pipeline II=1
  #pragma HLS RESOURCE variable=ret core=FRSqrt_nodsp latency=25
  #pragma HLS inline OFF
  ret = std::sqrt(a);
  return ret;
}
float LUT(const float in_float, const unsigned int idx)          // LUT HARD-CODED interface
{
  #pragma HLS inline OFF
  // Software routine for out LUT implementation
  float ret;
  switch (idx) {
  case 0: ret = in_float; break;
  case 1: ret = std::exp(in_float); break;
  //case 2: ret = std::sin(in_float); break;
  default: ret = in_float;
  }
  return ret;
}
float LUT_D(const float in_float, const unsigned int idx)        // LUT HARD-CODED derivative interface
{
  #pragma HLS inline OFF
  // Software routine for out LUT implementation
  float ret;
  switch (idx) {
  case 0: ret = 1.0; break;
  case 1: ret = std::exp(in_float); break;
  //case 2: ret = std::sin(in_float); break;
  default: ret = in_float;
  }
  return ret;
}
void adamUpdateModule(float vect_in_t, 
  float delta_in, 
  float& updatedWeights,
  float& newVelocity,
  float& newMass)
{
  #pragma HLS inline OFF
  float b2v = flopoco_mul(beta2, newVelocity);
  float b1m = flopoco_mul(beta1, newMass);
  float vect2 = flopoco_mul(delta_in, delta_in);
  float b2sub_vect2 = flopoco_mul(vect2, sub_beta2);
  float b1sub_vect = flopoco_mul(delta_in, sub_beta1);
  float currentVelocity = flopoco_add(b2sub_vect2, b2v);
  float currentMass = flopoco_add(b1sub_vect, b1m);
  newVelocity = currentVelocity;
  newMass = currentMass;
  float _t1 = flopoco_sqrt(currentVelocity);
  float _t2 = flopoco_add(_t1, adam_small_step);
  float _t3 = flopoco_div(currentMass, _t2);
  float _t4 = flopoco_mul(_t3, adam_eta);
  updatedWeights = flopoco_add(_t4, vect_in_t);
}

void manhattanUpdateModule(float vect_in_t,
  float delta_in,
  float eta_val,
  float eta_step,
  float& updatedWeights)
{
  float currentRoot = vect_in_t;
  if (delta_in == 0)
	  vect_in_t = 0;
  else if (delta_in < 0)
    vect_in_t = -eta_val;
  else
    vect_in_t = eta_val;
  updatedWeights = flopoco_add(eta_step, vect_in_t);
  updatedWeights = flopoco_add(currentRoot, updatedWeights);
}

void mat_vect(float ROW[MAX_WEIGHT_MEM_DEPTH][NUM_PE],		// Input memory
  float ROOT_MEM[MAX_WEIGHT_MEM_DEPTH],
  float BEST_W_MEM[MAX_WEIGHT_MEM_DEPTH],
  float V_MEMORY[MAX_WEIGHT_MEM_DEPTH],				        // Adam velocity memory
  float M_MEMORY[MAX_WEIGHT_MEM_DEPTH],						// Adam mass memory
  const  unsigned int max_rows[4],                                    // maximum row size
  const unsigned int   pe_ratio[4],							// matrix_col:pe ratio
  const unsigned int i_offst_vect_idx[4],							// input current layer vector read offset
  const unsigned int i_offst_w_idx[4],							// input current layer weight read offset
  const unsigned int i_offst_result_idx[4],						// input current layer result offset
  float net_memory[MAX_WEIGHT_MEM_DEPTH],                   // net value separate memory
  const  bool train_mode,                                   // current training mode 0:MANHATTAN, 1:ADAM
  const uint8 lut_idx[MAX_WEIGHT_MEM_DEPTH],         // The number of vect_in belonging to each lut
  const  uint8  current_layer,                      // current layer index
  const float eta_val,
  const float eta_step,
  float& lastKnownError,
  bool& switchBestWeights) {

  // Inner storage variables
  float vect_acc[NUM_PE];               // Accumulator registers: should accumulate the adder values
  float vect_in_cache[NUM_PE];			// Input vector cache registers
  float current_velocity[NUM_PE];
  float current_mass[NUM_PE];
  unsigned int vect_idx = NUM_PE;       // Inner loop input vector index
  float vect_in;                        // Input vector cache register tip

  // Main loop HLS properties
  #pragma HLS ARRAY_PARTITION variable=ROW complete dim=2				// Flatten ROW array
  #pragma HLS ARRAY_PARTITION variable=vect_acc complete dim=1			// Flatten accumulator vector
  #pragma HLS ARRAY_PARTITION variable=vect_in_cache complete dim=1		// Flatten in vector cache memory
  #pragma HLS RESOURCE variable=ROW core=RAM_2P_BRAM					// ROW is a dual port BRAM input
  #pragma HLS RESOURCE variable=V_MEMORY core=RAM_2P_BRAM
  #pragma HLS RESOURCE variable=M_MEMORY core=RAM_2P_BRAM

  // current pass configuration loading; should cost 1 cycle
  unsigned int offst_vect_idx = i_offst_vect_idx[current_layer];		// input vector starting index
  unsigned int offst_w_idx = i_offst_w_idx[current_layer];				// input weight starting index
  unsigned int outer_loop_max = pe_ratio[current_layer];				// maximum loop size
  const unsigned int offst_vect_idx_base = offst_vect_idx;				// outer loop vector idx base
  unsigned int offst_result_idx = i_offst_result_idx[current_layer];	// input write cache starting index
  bool net_filled = false;												// net values written done flag
  static float err_val = 0;												// initial value for error
  static float best_err = -1;											// previous error register
  static bool firstTime = true;
  static bool saveBestWeights = false;
  bool cacheFilled = false;
  unsigned int init_guess_idx = 0;
  unsigned int updated_weights_idx = 0;
  bool justRefilled = false;
  bool cacheTurn = false;
  const unsigned int currentMaxRows = max_rows[current_layer];
  const unsigned int prevMaxRows = (current_layer == 1 ? max_rows[0] : 0);

  switch (current_layer) {
  case 2: {
    //lastKnownError = err_val;
    //best_err = err_val;
    err_val=0;
  }break;
  default:;
  }
  /* pe_ratio_loop: the UNROLLED outer most loop; in case we have
  * a 1:1 ratio between number of processing units and matrix column, this should be
  * entered only once
  */
  pe_ratio_loop:for (unsigned int w_mat_idx = 0; w_mat_idx<outer_loop_max; w_mat_idx++, offst_vect_idx = offst_vect_idx_base, vect_idx = NUM_PE, offst_result_idx++, net_filled = true,   init_guess_idx++) {
	  // Unrolled reset loop
	  pe_reset_loop:for (unsigned int pe = 0; pe<NUM_PE; pe++) {
	    #pragma HLS UNROLL factor=NUM_PE
	    vect_acc[pe] = 0;
	    if(current_layer == 1)
	      vect_acc[pe] = ROW[offst_w_idx][pe];
	  }
    
    // pe_ratio settings mux
    switch (current_layer) {
    case 1: offst_w_idx++; break;
    default:;
    }

    /* macc_loop: Inner product loop, this is completely unrolled with a factor = NUM_PE
    * this loop is pipelined one input entering at each cycle once the state is in it
    */
macc_loop:for (int i = 0; i < currentMaxRows; offst_w_idx++, vect_idx = ((i >= prevMaxRows)&&(current_layer == 1))||(current_layer!=1) ? vect_idx + 1: vect_idx , i++) {
      // Loop HLS properties
      #pragma HLS PIPELINE II=1
      
      /* Dynamic inner product number of cycles is exceeded
      * and time to re-fill the in-vector cache
      */
      // Boolean decisions are taken here
      bool adamEnable = train_mode && !net_filled && !firstTime;			// adam trainer enable signal
      bool manhattanEnable = !train_mode && !net_filled && !firstTime;		// Manhattan trainer enable signal
      bool refillSignal = ((vect_idx == NUM_PE)&&(current_layer!=1)) ||		// Vector cache refill signal
		  (((i>=prevMaxRows)&&(vect_idx == NUM_PE))&&(current_layer==1));
      bool dumpUpdatedWeights = !net_filled && !firstTime;

      if (refillSignal) {
        vect_in_refill_loop:for (unsigned int pe = 0; pe<NUM_PE; pe++) {
          #pragma HLS UNROLL factor=NUM_PE 
          vect_in_cache[pe] = ROW[offst_vect_idx][pe];
        }
        offst_vect_idx++;
        vect_idx = 0;
      }
      switch (current_layer) {
      case 0: {
        float vect_in_t;
        float delta_in;
        vect_in_t = ROOT_MEM[i];
        if (adamEnable) // adam starts here
        {
          delta_in = vect_in_cache[vect_idx];
          float newVelocity = V_MEMORY[i];
          float newMass = M_MEMORY[i];
          adamUpdateModule(vect_in_t, delta_in, vect_in, newVelocity, newMass);
          V_MEMORY[i] = newVelocity;
          M_MEMORY[i] = newMass;
          if (dumpUpdatedWeights)
            ROOT_MEM[i] = vect_in;
          if (saveBestWeights)
            BEST_W_MEM[i] = vect_in;
        }
        else if (manhattanEnable)
        {
          delta_in = vect_in_cache[vect_idx];
          manhattanUpdateModule(vect_in_t, delta_in,eta_val, eta_step, vect_in);
          if (dumpUpdatedWeights)
            ROOT_MEM[i] = vect_in;
          if (saveBestWeights)
            BEST_W_MEM[i] = vect_in;
        }
        else
          vect_in = vect_in_t;
      }break;
      case 1: {
        float vect_in_t;
        if (i < prevMaxRows)
          vect_in_t = ROOT_MEM[i];
        else
          vect_in_t = vect_in_cache[vect_idx];
        vect_in = LUT(vect_in_t, lut_idx[i]);
        if (!net_filled)
          net_memory[i] = LUT_D(vect_in_t, lut_idx[i]);
        }break;
      case 2: {
          vect_in = -vect_in_cache[vect_idx];
          if (!net_filled){
            float temp_err = vect_in;
            float temp2_err = flopoco_mul(temp_err, temp_err);
            err_val = flopoco_add(temp2_err, err_val); //<= consider pipelining this adder and check for timing
          }
        }break;
      case 3: {
          vect_in = flopoco_mul(vect_in_cache[vect_idx], net_memory[i]);
        }break;
      default: {
        vect_in = vect_in_cache[vect_idx];
      }
      }
      // The actual multiply-accumulate loop
    pe_loop:for (unsigned int pe = 0; pe<NUM_PE; pe++) {
      #pragma HLS UNROLL factor=NUM_PE
      float temp = vect_acc[pe];
      float temp2 = flopoco_mul(ROW[offst_w_idx][pe], vect_in);
      vect_acc[pe] = flopoco_add(temp, temp2);
    }
  }

    pe_write_loop:for (unsigned int pe = 0; pe<NUM_PE; pe++) {
      #pragma HLS UNROLL factor=NUM_PE
      ROW[offst_result_idx][pe] = vect_acc[pe];
    }
  }
  if (current_layer == 2)
  {
    if ((err_val < best_err || best_err == -1))
    {
      saveBestWeights = true;
      best_err = err_val;
      switchBestWeights = true;
      lastKnownError = best_err;
      //std::cout << "Best root: " << ROOT_MEM[7] << " With error: " << best_err << std::endl;
    }
    else
      saveBestWeights = false;
  }

  firstTime = false;
}

//void memoryMuxModule(float*& roots, float*& best_weights, bool& switchBestWeights)
//{
//  if (switchBestWeights)
//  {
//    float* temp = best_weights;
//    best_weights = roots;
//    roots = temp;
//    switchBestWeights = false;
//  }
//}

void top_module(float WEIGHT_MEM[MAX_WEIGHT_MEM_DEPTH][NUM_PE],         // Coeff memory [generated by the software]
  float ROOT_MEM[MAX_WEIGHT_MEM_DEPTH],                                 // Solution memory
  float BEST_W_MEM[MAX_WEIGHT_MEM_DEPTH],
  float V_MEMORY[MAX_WEIGHT_MEM_DEPTH],				                          // Adam velocity memory
  float M_MEMORY[MAX_WEIGHT_MEM_DEPTH],						                      // Adam mass memory
  const  unsigned int max_rows[4],                                      // row size for each iteration [generated by the software]
  const unsigned int   pe_ratio[4],									                    // matrix size to num_pe ratio for each iteration [generated by the software]
  const unsigned int i_offst_vect_idx[4],						                          // input offset index [generated by the software]
  const unsigned int i_offst_w_idx[4],							                          // weight offset index [generated by the software] 
  const unsigned int i_offst_result_idx[4],						                        // intermediate results offset index [generated by the software]
  float net_memory[MAX_WEIGHT_MEM_DEPTH],                   
  const uint8 lut_idx[MAX_WEIGHT_MEM_DEPTH],
  const unsigned int iter_mem[3],
  const float requiredError, 
  float& currentError,
  bool& rootMemIdx
  )         
{
  unsigned int manhIter = iter_mem[0];
  unsigned int adamIter = iter_mem[1];
  unsigned int maxOuterIter = iter_mem[2];
  bool switchBestWeights = false;
  bool idx;
  for (unsigned int t = 0; t < maxOuterIter; t++)
  {
    // manhattan [with eta=1e-1 -> manhIter; eta=1e-2 -> manhIter;]
    
    idx = switchBestWeights;
    for (unsigned int manhi = 0; manhi < manhIter; manhi++)
    {
      // manhattan 1
      for (unsigned int i = 0; i < 4; i++)
      {
        if (idx)
          mat_vect(WEIGHT_MEM, BEST_W_MEM, ROOT_MEM,
            V_MEMORY, M_MEMORY,
            max_rows, pe_ratio,         
            i_offst_vect_idx, i_offst_w_idx,    
            i_offst_result_idx, net_memory,
            0, lut_idx,
            i, 0.1,
            0.01, currentError, switchBestWeights);
        else
          mat_vect(WEIGHT_MEM, ROOT_MEM, BEST_W_MEM,
            V_MEMORY, M_MEMORY,
            max_rows, pe_ratio,
            i_offst_vect_idx, i_offst_w_idx,
            i_offst_result_idx, net_memory,
            0, lut_idx,
            i, 0.1,
            0.01, currentError, switchBestWeights);
      }
    }
    
    idx = switchBestWeights;
    for (unsigned int manhi = 0; manhi < manhIter; manhi++)
    {
      // manhattan 2
      for (unsigned int i = 0; i < 4; i++)
      {
        if (idx)
          mat_vect(WEIGHT_MEM, BEST_W_MEM, ROOT_MEM,
            V_MEMORY, M_MEMORY,
            max_rows, pe_ratio,
            i_offst_vect_idx, i_offst_w_idx,
            i_offst_result_idx, net_memory,
            0, lut_idx,
            i, 0.01,
            0.001, currentError, switchBestWeights);
        else
          mat_vect(WEIGHT_MEM, ROOT_MEM, BEST_W_MEM,
            V_MEMORY, M_MEMORY,
            max_rows, pe_ratio,
            i_offst_vect_idx, i_offst_w_idx,
            i_offst_result_idx, net_memory,
            0, lut_idx,
            i, 0.01,
            0.001, currentError, switchBestWeights);
      }
    }

    if (currentError < requiredError) {
      rootMemIdx = !idx;
      return;
    }

    //memoryMuxModule(roots, best_weights, switchBestWeights);
    // adam
    idx = switchBestWeights;
    for (unsigned int adami = 0; adami < adamIter; adami++)
    {
      for (unsigned int i = 0; i < 4; i++)
      {
        if (idx)
          mat_vect(WEIGHT_MEM, BEST_W_MEM, ROOT_MEM,
            V_MEMORY, M_MEMORY,
            max_rows, pe_ratio,
            i_offst_vect_idx, i_offst_w_idx,
            i_offst_result_idx, net_memory,
            1, lut_idx,
            i, 0.01,
            0.001, currentError, switchBestWeights);
        else
          mat_vect(WEIGHT_MEM, ROOT_MEM, BEST_W_MEM,
            V_MEMORY, M_MEMORY,
            max_rows, pe_ratio,
            i_offst_vect_idx, i_offst_w_idx,
            i_offst_result_idx, net_memory,
            1, lut_idx,
            i, 0.01,
            0.001, currentError, switchBestWeights);
      }
    }
    
    if (currentError < requiredError) {
      rootMemIdx = !idx;
      return;
    }
  }
  rootMemIdx = !idx;
}
