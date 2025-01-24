function [ output_args ] = Invoke_main_code( Intial_guess,NUM_UNKNOWNS,X,NUM_EXP,in_file ,out_file)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% [own_path, ~, ~] = fileparts('main_code.py');
% 
% module_path = fullfile(own_path, '..');
% 
% 
% %file_path=fullfile(own_path2, '..');
% python_path = py.sys.path;
% if count(python_path, module_path) == 0
%     insert(python_path, int32(0), module_path)
% end


 NN = py.importlib.import_module('main_code');
 output_args=NN.main_code(NUM_UNKNOWNS,X,NUM_EXP,in_file,out_file);

end

