#include <iostream>
using namespace std;

#include"layers_test_weights.h"
#include"mat_mul_include.h"


int main(int argc, char** argv)
{
  const unsigned int pe_ratio[MAX_WEIGHT_MEM_DEPTH] = { 3, 4, 7, 4 };
  float net_memory[MAX_WEIGHT_MEM_DEPTH];
  float root_mem[MAX_WEIGHT_MEM_DEPTH] =  { 0.7, 0.8, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6 };

  float best_w_mem[MAX_WEIGHT_MEM_DEPTH] = { 0.7, 0.8, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6 };
  const unsigned int i_offst_vect_idx[4] = { 0, 4, 7, 11 };
  const unsigned int i_offst_w_idx[4] = { 18, 42, 98, 154 }; //{5};
  const unsigned int i_offst_result_idx[4] = { 4, 7, 11, 0 }; //{2};
  const uint8 lut_idx[MAX_WEIGHT_MEM_DEPTH] = { 0,0,0,0,0,0,0,0,1,1,1,1,1, 0};
  const unsigned int iter_mem[3] = { 300, 300, 1 };
  const unsigned int max_rows[4] = {8, 13, 8, 13};                // maximum row size is of 4 elements
  bool train_mode = 0;              // dummy boolean not supported atm
  unsigned int layer_idx = 0;                // current layer index
  float currentError;
  bool rootMemIdx = false;


  top_module(layer_w_mat, root_mem, best_w_mem,
    V_MEMORY, M_MEMORY, max_rows,
    pe_ratio, i_offst_vect_idx,
    i_offst_w_idx, i_offst_result_idx,
    net_memory, lut_idx,
    iter_mem, 1e-33, currentError, rootMemIdx);


  float* resArr = (rootMemIdx == 0) ? root_mem : best_w_mem;
  std::cout << "\nWeights after adam update:" << std::endl;
  for (int j = 0; j<8; j++)
    std::cout << "{" << resArr[j] << "}" << std::endl;
  std::cout << "With error: " << currentError << std::endl;
  std::cin >> rootMemIdx;
  return 0;
}
