function [ output_args ] = InvokeParser(NUM_UNKNOWNS,X,NUM_EXP,in_file ,out_file)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% commandStr='python /Users/dell/D:/semester 10/Graduation_project/Adding_Training_block/EmulatorGP2018/code/parser/main_code.py';
% [status, commandOut] = system(commandStr);
% if status==0
%      fprintf('done \n');
%  end
%system('C:\Users\dell\Anaconda3\python.exe parser_class.py')
% if count(py.sys.path,'') == 0
%     insert(py.sys.path,int32(0),'');
% end
%path('C:\WINDOWS\system32','D:\semester 10\Graduation_project\GUI\New_Size_Page_one')
[own_path, ~, ~] = fileparts('parser_class.py');

module_path = fullfile(own_path, '..');


%file_path=fullfile(own_path2, '..');
python_path = py.sys.path;
if count(python_path, module_path) == 0
    insert(python_path, int32(0), module_path)
end


 parser = py.importlib.import_module('parser_class');
 output_args=parser.Connect_parser_Matlab(NUM_UNKNOWNS,X,NUM_EXP,in_file,out_file);
end

