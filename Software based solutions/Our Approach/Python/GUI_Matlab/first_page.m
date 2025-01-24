function varargout = first_page(varargin)
% FIRST_PAGE MATLAB code for first_page.fig
%      FIRST_PAGE, by itself, creates a new FIRST_PAGE or raises the existing
%      singleton*.jfj
%
%      H = FIRST_PAGE returns the handle to a new FIRST_PAGE or the handle to
%      the existing singleton*.
%
%      FIRST_PAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRST_PAGE.M with the given input arguments.
%
%      FIRST_PAGE('Property','Value',...) creates a new FIRST_PAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before first_page_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to first_page_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help first_page

% Last Modified by GUIDE v2.5 04-Jul-2018 13:51:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @first_page_OpeningFcn, ...
                   'gui_OutputFcn',  @first_page_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before first_page is made visible.
function first_page_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to first_page (see VARARGIN)

% Choose default command line output for first_page
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes first_page wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = first_page_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Enter_equations.
function Enter_equations_Callback(hObject, eventdata, handles)
% hObject    handle to Enter_equations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[equ_file,equ_path] = uigetfile({'*.txt';'*.m'},'File Selector');
file=strcat(equ_path, equ_file);
 setappdata(0,'equations',file);
[filepath,name,ext] = fileparts(equ_file)
 if strcmp(ext,'.txt')==1
  set(handles.text5 , 'String' , 'Your file is successfully uploaded.');
 else 
  set(handles.text5 , 'String' , 'Please load correct file with extension .txt');
end

% --- Executes on button press in Initial_guess.
function Initial_guess_Callback(hObject, eventdata, handles)
% hObject    handle to Initial_guess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[guess_file,guess_path] = uigetfile({'*.txt';'*.m'},'File Selector');
 file=strcat(guess_path, guess_file);
 setappdata(0,'initial',file);
[filepath,name,ext] = fileparts(guess_file)
 if strcmp(ext,'.txt')==1
set(handles.input , 'String' , 'Your file is successfully uploaded.');
 else 
  set(handles.input , 'String' , 'Please load correct file with extension .txt');
end
% --- Executes on button press in Train.
function Train_Callback(hObject, eventdata, handles)
% hObject    handle to Train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 set(handles.text7 , 'String' , 'Please wait during the training of NN');
 t=pwd;
 path0=strcat(t,'\IN1.mem');
 path1=strcat(t,'\R11.mem');
 path3=strcat(t,'\R12.mem');
 path4=strcat(t,'\R13.mem');
 path5=strcat(t,'\R14.mem');
 path6=strcat(t,'\R21.mem');
 path7=strcat(t,'\R22.mem');
 filename=getappdata(0,'initial');
 in_file=getappdata(0,'equations');
 InvokeParser(2,'exp',1,in_file ,'out')
 initial_guess=importdata(filename);
 layer0= importdata(path0)
 layer1=importdata(path1)
 layer2=importdata(path3)
 layer3=importdata(path4)
 layer4=importdata(path5)
 layer5=importdata(path6)
 layer6=importdata(path7)
%filProgramFPGA('Xilinx','output_files/aximaster_deca.sof',1)
% --- Executes on button press in Solve.
function Solve_Callback(hObject, eventdata, handles)
% hObject    handle to Solve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 set(handles.text7 , 'String' , 'Please wait during the training of NN');
 t=pwd;
 path0=strcat(t,'\out_l_0.txt');
 path1=strcat(t,'\out_l_1.txt');
 filename=getappdata(0,'initial')
 in_file=getappdata(0,'equations');
 %InvokeParser(2,'exp',1,in_file ,'out')
 initial_guess=importdata(filename);
 y=Invoke_main_code(initial_guess,2,'exp',1,in_file ,'out');
 set(handles.text7 , 'String' , 'Training is done');
 %layer0= importdata(path0)
 %layer1=importdata(path1)
