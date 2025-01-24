# Python script for converting VHDL code to Verilog based on `vhd2vl` tool

## Dependencies

+ Python3x
+ `vhd2vl` compiled and executable named as `vhd2vl`
    + Note this is supported in the repository compiled my ubuntu machine
    + Make sure to fork their project, compile and place it either on your path environmental variables or relative to the code

## Usage

```
python3 convert_vhdl_pre.py flopoco_module_name output_directory
```

![](assets/2018-02-23-19-48-06.png)

## FLopoco frequent commands

### for generating adder

```
./flopoco FPAdd we=exp_size wf=mantessa_size pipeline=1 useHardMult=0 name=FPAdder outputFile=FPAdder.vhdl
```

### for generating multiplier

```
./flopoco FPMult we=exp_size wf=mantessa_size pipeline=1 useHardMult=0 name=FPmul outputFile=FPmul.vhdl
```