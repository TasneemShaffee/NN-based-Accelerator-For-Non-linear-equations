# Emulator Graduation Project makefile.
# +	Make sure you include the verilog compiler path in the makefile variables
# +	Currently it supports iverilog opensource simulator. Testing the vlog/vsim and isim simulators is not implemented yet

# verilog compiler path here
compiler = iverilog
# wave viewer path here
wave_viewer = gtkwave
# python3 dir here
pythondir = python3
# computation testbench directory
tb_comp = tb/computation
tb_store = tb/storage

# the help rule
help :
	@echo ""
	@echo "make             - shows help"
	@echo "make alu         - runs the simple ALU.v testbench"
	@echo "make alu_py      - runs the generated python ALU.v testbench for 10K random cases"
	@echo "make alu_wave    - runs the ALU.v python generated testbench followed by the wave viewer"
	@echo "make lut_py      - runs the look up table generated testbench for 10K random cases"
	@echo "make lut_wave    - runs the look up table generated testbench followed by the wave viewer"
	@echo "make layer_py    - runs layer generated testbench over different random vectors and matrices"
	@echo "make layer_wave  - runs layer generated testbench followed by wave viewer"
	@echo ""

alu:
	$(compiler) tb/computation/tb_alu.v -o a.out
	vvp a.out
	rm a.out
	#rm *.dump

alu_py:
	$(pythondir) $(tb_comp)/py_scripts/python_cosim.py

lut:
	$(compiler) $(tb_store)/tb_lut.v
	vvp a.out
	rm a.out

lut_py:
	$(pythondir) $(tb_store)/py_scripts/lut_cosim.py

layer_py:
	$(pythondir) $(tb_comp)/py_scripts/layer_cosim.py

inter:
	$(compiler) $(tb_comp)/tb_intermediate.v
	vvp a.out
	rm a.out

nonlin_layer:
	$(compiler) $(tb_comp)/tb_nonlin_layer.v
	vvp a.out
	rm a.out
	gtkwave tb/computation/py_scripts/testing.dump $(tb_comp)/py_scripts/nonlin_layer_config.gtkw

lin_layer:
	$(compiler) $(tb_comp)/tb_lin_layer.v
	vvp a.out
	rm a.out
	gtkwave tb/computation/py_scripts/testing.dump $(tb_comp)/py_scripts/lin_layer_config.gtkw

fwd_eng:
	$(compiler) $(tb_comp)/tb_fwd_engine.v
	vvp a.out
	rm a.out
	gtkwave $(tb_comp)/py_scripts/testing.dump $(tb_comp)/py_scripts/fwd_eng_config.gtkw

fwd_bwd:
	$(compiler) $(tb_comp)/tb_fwd_bwd.v
	vvp a.out
	rm a.out
	gtkwave $(tb_comp)/py_scripts/testing.dump $(tb_comp)/py_scripts/fwd_bwd_config.gtkw

_script_rule:
	$(compiler) $(tb_comp)/tb_alu_py.v -o a.out
	vvp a.out
	rm a.out
	#rm *.dump

_script_rule_lut:
	$(compiler) $(tb_store)/tb_lut_py.v -o a.out
	vvp a.out
	rm a.out
	#rm *.dump

_script_rule_layer:
	$(compiler) $(tb_comp)/tb_layer_py.v -o a.out
	vvp a.out
	rm a.out
	#gtkwave tb/computation/py_scripts/testing.dump
	#rm *.dump

alu_wave: alu_py
	gtkwave $(tb_comp)/py_scripts/testing.dump $(tb_comp)/py_scripts/alu_config.gtkw

lut_wave: lut_py
	gtkwave $(tb_comp)/py_scripts/testing.dump $(tb_store)/py_scripts/lut_config.gtkw

layer_wave:	layer_py
	gtkwave $(tb_comp)/py_scripts/testing.dump $(tb_comp)/py_scripts/layer_config.gtkw
