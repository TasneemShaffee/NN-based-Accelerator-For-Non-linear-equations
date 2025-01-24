# Global flag to avoid building and compiling multiple times
set build_done 0
set num_nonlin 1
set num_unknowns 3 
#2 +1

# define a function for building that runs one time
proc build {} {
    # read the global build flag
    global build_done
    # do the build routine
    # MAKE SURE TO INCLUDE ANY MISSING DIR IN THE FUTURE
    vlib work
    vlog "rtl/flopoco/*.v"
    vlog "rtl/computation/*.v"
    vlog "rtl/storage/*.v"
    vlog "tb/computation/*.v"
    vlog "tb/storage/*.v" 
    # set the build flag to 1
    set build_done 1
}

# define a function for simulating the alu testbench [NOT USING PYTHON COSIMULATION]
proc tb_alu {} {
    global build_done
    if {$build_done == 0} {
        build
    }
    # simulate the entity named tb_alu [which is the testbench entity name in tb_alu.v]
    vsim work.tb_alu
    add wave *
    # run the simulation
    run
}

proc tb_nonlin_layer {} {
    global build_done
    global num_unknowns
    global num_nonlin
    if {$build_done == 0} {
        build
    }
    # simulate the entity named tb_alu [which is the testbench entity name in tb_alu.v]
    vsim work.tb_nonlin_layer
    # set signal radix for debugging
    radix signal sim:/tb_nonlin_layer/acc_result_ieee float32
    radix signal sim:/tb_nonlin_layer/x_ieee float32
    #add wave *
    add wave -divider Sync_signals
    add wave -position end  sim:/tb_nonlin_layer/clk
    add wave -position end  sim:/tb_nonlin_layer/UUT/layer_core/RESET
    add wave -position end  sim:/tb_nonlin_layer/UUT/layer_core/ACC_EN
    radix signal sim:/tb_nonlin_layer/UUT/weight_buff/address_ptr unsigned
    add wave -position end  sim:/tb_nonlin_layer/UUT/weight_buff/address_ptr
    # layer 1 inputs
    add wave -divider Layer_1_input
    add wave -position end  sim:/tb_nonlin_layer/x_ieee
    set i 0
    while {$i < 4} {
        set div_name "MACC"
        append div_name "_" $i
        add wave -divider $div_name
        set cmd0 "sim:/tb_nonlin_layer/macc_debug\["
        append cmd0 $i
        append cmd0 "\]/macc_out_iee"
        radix signal $cmd0 float32
        set cmd1 "sim:/tb_nonlin_layer/macc_debug\["
        append cmd1 $i
        append cmd1 "\]/macc_weight_iee"
        radix signal $cmd1 float32
        set cmd2 "sim:/tb_nonlin_layer/macc_debug\["
        append cmd2 $i
        append cmd2 "\]/macc_out_iee"
        add wave -position end  $cmd2
        set cmd3 "sim:/tb_nonlin_layer/macc_debug\["
        append cmd3 $i
        append cmd3 "\]/macc_weight_iee"
        add wave -position end  $cmd3
        set i [expr {$i + 1}]
    }
    # layer 1 output
    add wave -divider Layer_1_output
    add wave -position end  sim:/tb_nonlin_layer/acc_result
    add wave -position end  sim:/tb_nonlin_layer/acc_result_ieee
    # run the simulation
    run 199
}

proc tb_lin_layer {} {
    global build_done
    if {$build_done == 0} {
        build
    }
    # simulate the entity named tb_alu [which is the testbench entity name in tb_alu.v]
    vsim work.tb_lin_layer
    add wave *
    # run the simulation
    run
}

proc tb_fwd_eng {} {
    global build_done
    global num_unknowns
    global num_nonlin
    if {$build_done == 0} {
        build
    }
    # simulate the entity named tb_alu [which is the testbench entity name in tb_alu.v]
    vsim work.tb_fwd_engine
    # set signal radix for debugging
    radix signal sim:/tb_fwd_engine/acc_result_ieee float32
    radix signal sim:/tb_fwd_engine/x_ieee float32
    radix signal sim:/tb_fwd_engine/l1_x_ieee float32
    add wave -divider Sync_signals
    add wave -position end  sim:/tb_fwd_engine/clk
    # add wave -position end  sim:/tb_nonlin_layer/UUT/layer_core/RESET
    # add wave -position end  sim:/tb_nonlin_layer/UUT/layer_core/ACC_EN
    # radix signal sim:/tb_nonlin_layer/UUT/weight_buff/address_ptr unsigned
    # add wave -position end  sim:/tb_nonlin_layer/UUT/weight_buff/address_ptr
    # Nonlinear layer
    add wave -divider Nonlinear_layer_Inputs
    radix signal sim:/tb_fwd_engine/UUT/nonlinear_layer/weight_buff/address_ptr unsigned
    add wave -position end sim:/tb_fwd_engine/UUT/nonlinear_layer/weight_buff/address_ptr
    add wave -position end  sim:/tb_fwd_engine/x_ieee
    add wave -position end  sim:/tb_fwd_engine/UUT/nonlinear_layer/acc_en
    add wave -position end sim:/tb_fwd_engine/UUT/nonlinear_layer/weight_buff/address_ptr
    add wave -position end sim:/tb_fwd_engine/UUT/nonlinear_layer/RESET
    set i 0
    while {$i < 4} {
        set div_name "L1_MACC"
        append div_name "_" $i
        add wave -divider $div_name
        set cmd0 "sim:/tb_fwd_engine/l1_macc_debug\["
        append cmd0 $i
        append cmd0 "\]/l1_macc_out_iee"
        radix signal $cmd0 float32
        set cmd1 "sim:/tb_fwd_engine/l1_macc_debug\["
        append cmd1 $i
        append cmd1 "\]/l1_macc_weight_iee"
        radix signal $cmd1 float32
        set cmd2 "sim:/tb_fwd_engine/l1_macc_debug\["
        append cmd2 $i
        append cmd2 "\]/l1_macc_out_iee"
        add wave -position end  $cmd2
        set cmd3 "sim:/tb_fwd_engine/l1_macc_debug\["
        append cmd3 $i
        append cmd3 "\]/l1_macc_weight_iee"
        add wave -position end  $cmd3
        set i [expr {$i + 1}]
    }

    add wave -divider Linear_layer_Inputs
    add wave -position end sim:/tb_fwd_engine/UUT/linear_layer/acc_en
    add wave -position end sim:/tb_fwd_engine/l1_x_ieee
    add wave -position end sim:/tb_fwd_engine/UUT/linear_layer/weight_buff/address_ptr
    add wave -position end sim:/tb_fwd_engine/UUT/linear_layer/RESET
    set i 0
    while {$i < 2} {
        set div_name "L2_MACC"
        append div_name "_" $i
        add wave -divider $div_name
        set cmd0 "sim:/tb_fwd_engine/l2_macc_debug\["
        append cmd0 $i
        append cmd0 "\]/l2_macc_out_iee"
        radix signal $cmd0 float32
        set cmd1 "sim:/tb_fwd_engine/l2_macc_debug\["
        append cmd1 $i
        append cmd1 "\]/l2_macc_weight_iee"
        radix signal $cmd1 float32
        set cmd2 "sim:/tb_fwd_engine/l2_macc_debug\["
        append cmd2 $i
        append cmd2 "\]/l2_macc_out_iee"
        add wave -position end  $cmd2
        set cmd3 "sim:/tb_fwd_engine/l2_macc_debug\["
        append cmd3 $i
        append cmd3 "\]/l2_macc_weight_iee"
        add wave -position end  $cmd3
        set i [expr {$i + 1}]
    }
    #forward engine output
    add wave -divider Forward_Pass_Output
    radix signal sim:/tb_fwd_engine/UUT/linear_layer/intermediate_logic/counter unsigned
    add wave -position end sim:/tb_fwd_engine/UUT/linear_layer/intermediate_logic/counter
    add wave -position end  sim:/tb_fwd_engine/acc_result
    add wave -position end  sim:/tb_fwd_engine/acc_result_ieee
    add wave -divider Error_Acc
    radix signal sim:/tb_fwd_engine/err_ieee float32
    add wave -position 38  sim:/tb_fwd_engine/err_ieee
    add wave -position end  sim:/tb_fwd_engine/UUT/linear_layer/intermediate_logic/inter_en
    # run the simulation
    run 239
}

proc tb_fwd_bwd {} {
    global build_done
    global num_unknowns
    global num_nonlin
    if {$build_done == 0} {
        build
    }
    vsim work.tb_fwd_bwd
    add wave *
}

proc training_FSM_New {} {
    global build_done
    if {$build_done == 0} {
        build
    }
    # simulate the entity named tb_alu [which is the testbench entity name in tb_alu.v]
    vsim work.training_control_tb
    # add all the signals to the wave viewer
    # MAKE SURE TO EXPLICITY ADD EACH OF THESE WAVES IN THE ORDER YOU WANT IN CASE NOT ALL THE SIGNALS
    # ARE NEEDED TO BE SHOWN
    add wave *
    # run the simulation
    run
}
proc training_FSM {} {
    global build_done
    if {$build_done == 0} {
        build
    }
    # simulate the entity named tb_alu [which is the testbench entity name in tb_alu.v]
    vsim work.test_FSM
    # add all the signals to the wave viewer
    # MAKE SURE TO EXPLICITY ADD EACH OF THESE WAVES IN THE ORDER YOU WANT IN CASE NOT ALL THE SIGNALS
    # ARE NEEDED TO BE SHOWN
    add wave *
    # run the simulation
    run
}
proc inter {} {
    global build_done
    if {$build_done == 0} {
        build
    }
    # simulate the entity named tb_alu [which is the testbench entity name in tb_alu.v]
    vsim work.tb_intermediate
    # add all the signals to the wave viewer
    # MAKE SURE TO EXPLICITY ADD EACH OF THESE WAVES IN THE ORDER YOU WANT IN CASE NOT ALL THE SIGNALS
    # ARE NEEDED TO BE SHOWN
    add wave *
    # run the simulation
    run
}

proc tb_layer {} {
    global build_done
    if {$build_done == 0} {
        build
    }
    # simulate the entity named tb_alu [which is the testbench entity name in tb_alu.v]
    vsim work.tb_layer_py
    # add all the signals to the wave viewer
    # MAKE SURE TO EXPLICITY ADD EACH OF THESE WAVES IN THE ORDER YOU WANT IN CASE NOT ALL THE SIGNALS
    # ARE NEEDED TO BE SHOWN
    add wave *
    # run the simulation
    run
}
proc Rom_Weights {} {
    global build_done
    if {$build_done == 0} {
        build
    }
    # simulate the entity named tb_alu [which is the testbench entity name in tb_alu.v]
    vsim work.CLK_GEN
    # add all the signals to the wave viewer
    # MAKE SURE TO EXPLICITY ADD EACH OF THESE WAVES IN THE ORDER YOU WANT IN CASE NOT ALL THE SIGNALS
    # ARE NEEDED TO BE SHOWN
    add wave *
    # run the simulation
    run
}