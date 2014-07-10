function varargout = SelectReference(varargin)
% SELECTREFERENCE MATLAB code for SelectReference.fig
%      SELECTREFERENCE, by itself, creates a new SELECTREFERENCE or raises the existing
%      singleton*.
%
%      H = SELECTREFERENCE returns the handle to a new SELECTREFERENCE or the handle to
%      the existing singleton*.
%
%      SELECTREFERENCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECTREFERENCE.M with the given input arguments.
%
%      SELECTREFERENCE('Property','Value',...) creates a new SELECTREFERENCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SelectReference_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SelectReference_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SelectReference

% Last Modified by GUIDE v2.5 07-Mar-2014 15:11:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SelectReference_OpeningFcn, ...
                   'gui_OutputFcn',  @SelectReference_OutputFcn, ...
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



% --- Executes just before SelectReference is made visible.
function SelectReference_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SelectReference (see VARARGIN)

% Choose default command line output for SelectReference
handles.output = hObject;


handles.IM_defs = varargin{1};
handles.im_number = 1;
handles.im_number_end = size(handles.IM_defs,3);

% image slider
sliderMin = 1;
sliderMax = size(handles.IM_defs,3); % this is variable
sliderStep = [1, 1] / (sliderMax - sliderMin); % major and minor steps of 1

set(handles.slider2, 'Min', sliderMin);
set(handles.slider2, 'Max', sliderMax);
set(handles.slider2, 'SliderStep', sliderStep);
set(handles.slider2, 'Value', sliderMin); % set to beginning of sequence
set(handles.edit1,'String',handles.im_number);

show_figures_PDGUI(hObject, eventdata, handles)

%%%%% Set

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SelectReference wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SelectReference_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.im_number = round(get(handles.slider2,'Value'));
set(handles.edit1,'String',handles.im_number);

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

%%%%% Set

guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%set(handles.pushbutton1,'String',handles.im_number);
handles.output=handles.im_number;
out=handles.im_number
save('SelectedRefIm.mat','out');
pause(2)
close




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.im_number = str2double(get(hObject,'String'));
set(handles.slider2, 'Value', handles.im_number);

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

%%%%% Set

guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double



% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Creates and updates figure
function show_figures_PDGUI(hObject, eventdata, handles)
%set(handles.radiobutton1_center, 'Value', 0);
%set(handles.radiobutton2_nodes, 'Value', 1);
%set(handles.radiobutton3_Blurr, 'Value', 1);
%set(handles.radiobutton4_disp, 'Value', 0);

handles.im_fig = imagesc(handles.IM_defs(:,:,handles.im_number)); colormap hot; caxis([0, max(max(max(handles.IM_defs))).*0.3]);
axis ij; axis([-10 , 266, -10 , 266]); handles.ah = axis; 
%set(gcf,'WindowButtonDownFcn',{@axes1_ButtonDownFcn handles})

guidata(hObject, handles);
