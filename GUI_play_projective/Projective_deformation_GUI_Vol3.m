function varargout = Projective_deformation_GUI_Vol3(varargin)
%PROJECTIVE_DEFORMATION_GUI_VOL3 M-file for Projective_deformation_GUI_Vol3.fig
%      PROJECTIVE_DEFORMATION_GUI_VOL3, by itself, creates a new PROJECTIVE_DEFORMATION_GUI_VOL3 or raises the existing
%      singleton*.
%
%      Input:
%      Projective_deformation_GUI_Vol3(x_roi_undef, y_roi_undef,IM_defs, [], Filename)
%      Filename: string
%
%
%      H = PROJECTIVE_DEFORMATION_GUI_VOL3 returns the handle to a new PROJECTIVE_DEFORMATION_GUI_VOL3 or the handle to
%      the existing singleton*.
%
%      PROJECTIVE_DEFORMATION_GUI_VOL3('Property','Value',...) creates a new PROJECTIVE_DEFORMATION_GUI_VOL3 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Projective_deformation_GUI_Vol3_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PROJECTIVE_DEFORMATION_GUI_VOL3('CALLBACK') and PROJECTIVE_DEFORMATION_GUI_VOL3('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PROJECTIVE_DEFORMATION_GUI_VOL3.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Projective_deformation_GUI_Vol3

% Last Modified by GUIDE v2.5 11-Mar-2014 12:08:56

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Projective_deformation_GUI_Vol3_OpeningFcn, ...
                   'gui_OutputFcn',  @Projective_deformation_GUI_Vol3_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Projective_deformation_GUI_Vol3 is made visible.
function Projective_deformation_GUI_Vol3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Projective_deformation_GUI_Vol3
%%% Input
handles.output = hObject;



handles.x_roi_undef = varargin{1};
handles.y_roi_undef = varargin{2};
handles.IM_defs = varargin{3};
handles.filename = varargin{5};
handles.im_number = 1;
handles.im_number_end = size(handles.IM_defs,3);

%%% IM slider
sliderMin = 1;
sliderMax = size(handles.IM_defs,3); % this is variable
sliderStep = [1, 1] / (sliderMax - sliderMin); % major and minor steps of 1

set(handles.slider9_im, 'Min', sliderMin);
set(handles.slider9_im, 'Max', sliderMax);
set(handles.slider9_im, 'SliderStep', sliderStep);
set(handles.slider9_im, 'Value', sliderMin); % set to beginning of sequence

%%%%% Nodes
min_x = min(handles.x_roi_undef);
max_x = max(handles.x_roi_undef);
min_y = min(handles.y_roi_undef);
max_y = max(handles.y_roi_undef);
[X_undef, Y_undef] = meshgrid(1:size(handles.IM_defs,2),1:size(handles.IM_defs,1));
handles.xi_Xundef = (X_undef - min_x) / (max_x - min_x);
handles.xi_Yundef = (Y_undef - min_y) / (max_y - min_y);
% handles.nodal_parameters = [min_x, max_x, min_x, max_x, min_y, min_y, max_y, max_y];

if isempty(varargin{4}) ~= 1
    handles.nodal_parameters = varargin{4};
else
    handles.nodal_parameters = [min_x * ones(handles.im_number_end,1), max_x * ones(handles.im_number_end,1),...
        min_x * ones(handles.im_number_end,1), max_x * ones(handles.im_number_end,1),...
        min_y * ones(handles.im_number_end,1), min_y * ones(handles.im_number_end,1),...
        max_y * ones(handles.im_number_end,1), max_y * ones(handles.im_number_end,1)];
end
handles.initial_nodal_parameters = handles.nodal_parameters;
handles.save_nodal_parameters = handles.nodal_parameters([1:15],:);
handles.save_nodal_parameters_click = 0;
handles.save_nodal_parameters_click_2 = 0;
%handles.save_nodal_parameters = handles.nodal_parameters([1:15],:);

%%% Node 1 x slider
sliderMin_1x = -10;
sliderMax_1x = size(handles.IM_defs,2) + 50; % this is variable
sliderStep_1x = [1, 1] / (sliderMax_1x - sliderMin_1x); % major and minor steps of 1

set(handles.slider1_1x, 'Min', sliderMin_1x);
set(handles.slider1_1x, 'Max', sliderMax_1x);
set(handles.slider1_1x, 'SliderStep', sliderStep_1x);
set(handles.slider1_1x, 'Value', min_x); % set to beginning of sequence

%%% Node 1 y slider
sliderMin_1y = -10;
sliderMax_1y = size(handles.IM_defs,1) + 50; % this is variable
sliderStep_1y = [1, 1] / (sliderMax_1y - sliderMin_1y); % major and minor steps of 1

set(handles.slider2_1y, 'Min', sliderMin_1y);
set(handles.slider2_1y, 'Max', sliderMax_1y);
set(handles.slider2_1y, 'SliderStep', sliderStep_1y);
set(handles.slider2_1y, 'Value', min_y); % set to beginning of sequence

%%% Node 2 x slider
sliderMin_2x = -10;
sliderMax_2x = size(handles.IM_defs,2) + 50; % this is variable
sliderStep_2x = [1, 1] / (sliderMax_2x - sliderMin_2x); % major and minor steps of 1

set(handles.slider3_2x, 'Min', sliderMin_2x);
set(handles.slider3_2x, 'Max', sliderMax_2x);
set(handles.slider3_2x, 'SliderStep', sliderStep_2x);
set(handles.slider3_2x, 'Value', max_x); % set to beginning of sequence

%%% Node 2 y slider
sliderMin_2y = -10;
sliderMax_2y = size(handles.IM_defs,1) + 50; % this is variable
sliderStep_2y = [1, 1] / (sliderMax_2y - sliderMin_2y); % major and minor steps of 1

set(handles.slider4_2y, 'Min', sliderMin_2y);
set(handles.slider4_2y, 'Max', sliderMax_2y);
set(handles.slider4_2y, 'SliderStep', sliderStep_2y);
set(handles.slider4_2y, 'Value', min_y); % set to beginning of sequence

%%% Node 3 x slider
sliderMin_3x = -10;
sliderMax_3x = size(handles.IM_defs,2) + 50; % this is variable
sliderStep_3x = [1, 1] / (sliderMax_3x - sliderMin_3x); % major and minor steps of 1

set(handles.slider5_3x, 'Min', sliderMin_3x);
set(handles.slider5_3x, 'Max', sliderMax_3x);
set(handles.slider5_3x, 'SliderStep', sliderStep_3x);
set(handles.slider5_3x, 'Value', min_x); % set to beginning of sequence

%%% Node 3 y slider
sliderMin_3y = -10;
sliderMax_3y = size(handles.IM_defs,1) + 50; % this is variable
sliderStep_3y = [1, 1] / (sliderMax_3y - sliderMin_3y); % major and minor steps of 1

set(handles.slider6_3y, 'Min', sliderMin_3y);
set(handles.slider6_3y, 'Max', sliderMax_3y);
set(handles.slider6_3y, 'SliderStep', sliderStep_3y);
set(handles.slider6_3y, 'Value', max_y); % set to beginning of sequence

%%% Node 4 x slider
sliderMin_4x = -10;
sliderMax_4x = size(handles.IM_defs,2) + 50; % this is variable
sliderStep_4x = [1, 1] / (sliderMax_4x - sliderMin_4x); % major and minor steps of 1

set(handles.slider7_4x, 'Min', sliderMin_4x);
set(handles.slider7_4x, 'Max', sliderMax_4x);
set(handles.slider7_4x, 'SliderStep', sliderStep_4x);
set(handles.slider7_4x, 'Value', max_x); % set to beginning of sequence

%%% Node 3 y slider
sliderMin_4y = -10;
sliderMax_4y = size(handles.IM_defs,1) + 50; % this is variable
sliderStep_4y = [1, 1] / (sliderMax_4y - sliderMin_4y); % major and minor steps of 1

set(handles.slider8_4y, 'Min', sliderMin_4y);
set(handles.slider8_4y, 'Max', sliderMax_4y);
set(handles.slider8_4y, 'SliderStep', sliderStep_4y);
set(handles.slider8_4y, 'Value', max_y); % set to beginning of sequence

%%%% Radio Button
set(handles.radiobutton1_center, 'Value', 1);
set(handles.radiobutton2_nodes, 'Value', 1);
set(handles.radiobutton3_Blurr, 'Value', 0);
set(handles.radiobutton4_disp, 'Value', 0);

handles.radiobutton1_center = 1;
handles.radiobutton2_nodes = 1;
handles.radiobutton3_Blurr = 0;
handles.radiobutton4_disp = 0;

%%%
handles.badbreathhold = zeros(handles.im_number_end,1);
handles.badimage = zeros(handles.im_number_end,1);

handles.node_pattern = 1;
set(handles.edit12,'String',handles.node_pattern);

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)

set(handles.im_number_edit,'String',handles.im_number);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Projective_deformation_GUI_Vol3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Projective_deformation_GUI_Vol3_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_1x_Callback(hObject, eventdata, handles)
% hObject    handle to slider1_1x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,1) = get(handles.slider1_1x,'Value');

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.nodal_1_x,'String',handles.nodal_parameters(handles.im_number,1));

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider1_1x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1_1x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider2_1y_Callback(hObject, eventdata, handles)
% hObject    handle to slider2_1y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,5) = get(handles.slider2_1y,'Value'); %%%

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.nodal_1_y,'String',handles.nodal_parameters(handles.im_number,5)); %%%

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider2_1y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2_1y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider3_2x_Callback(hObject, eventdata, handles)
% hObject    handle to slider3_2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,2) = get(handles.slider3_2x,'Value'); %%%

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.nodal_2_x,'String',handles.nodal_parameters(handles.im_number,2)); %%%

guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function slider3_2x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3_2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_2y_Callback(hObject, eventdata, handles)
% hObject    handle to slider4_2y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,6) = get(handles.slider4_2y,'Value'); %%%

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.nodal_2_y,'String',handles.nodal_parameters(handles.im_number,6)); %%%

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider4_2y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4_2y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_3x_Callback(hObject, eventdata, handles)
% hObject    handle to slider5_3x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,3) = get(handles.slider5_3x,'Value'); %%%

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.nodal_3_x,'String',handles.nodal_parameters(handles.im_number,3)); %%%

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider5_3x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5_3x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_3y_Callback(hObject, eventdata, handles)
% hObject    handle to slider6_3y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,7) = get(handles.slider6_3y,'Value'); %%%

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.nodal_3_y,'String',handles.nodal_parameters(handles.im_number,7)); %%%

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider6_3y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6_3y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_4x_Callback(hObject, eventdata, handles)
% hObject    handle to slider7_4x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,4) = get(handles.slider7_4x,'Value'); %%%

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.nodal_4_x,'String',handles.nodal_parameters(handles.im_number,4)); %%%

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider7_4x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7_4x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_4y_Callback(hObject, eventdata, handles)
% hObject    handle to slider8_4y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,8) = get(handles.slider8_4y,'Value'); %%%

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.nodal_4_y,'String',handles.nodal_parameters(handles.im_number,8)); %%%

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider8_4y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8_4y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in radiobutton1_center.
function radiobutton1_center_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1_center (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1_center

% When it is on:1 or off:0
handles.radiobutton1_center=get(hObject,'Value');
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)

guidata(hObject,handles)  


% --- Executes on button press in radiobutton2_nodes.
function radiobutton2_nodes_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2_nodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2_nodes

% When it is on:1 or off:0
handles.radiobutton2_nodes=get(hObject,'Value');
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)

guidata(hObject,handles)  


% --- Executes on button press in radiobutton3_Blurr.
function radiobutton3_Blurr_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3_Blurr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3_Blurr

% When it is on:1 or off:0
handles.radiobutton3_Blurr=get(hObject,'Value');
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)

guidata(hObject,handles) 

% --- Executes on button press in radiobutton4_disp.
function radiobutton4_disp_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4_disp
% When it is on:1 or off:0
handles.radiobutton4_disp=get(hObject,'Value');
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)

guidata(hObject,handles) 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% IM Slider & EDIT

function im_number_edit_Callback(hObject, eventdata, handles)
% hObject    handle to im_number_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of im_number_edit as text
%        str2double(get(hObject,'String')) returns contents of im_number_edit as a double
handles.im_number = str2double(get(hObject,'String'));
set(handles.slider9_im, 'Value', handles.im_number);

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)


%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)


guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function im_number_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to im_number_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider9_im_Callback(hObject, eventdata, handles)
% hObject    handle to slider9_im (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.im_number = round(get(handles.slider9_im,'Value'));
set(handles.im_number_edit,'String',handles.im_number);

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider9_im_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9_im (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% IM Slider & Edlit

function nodal_1_x_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_1_x as text
%        str2double(get(hObject,'String')) returns contents of nodal_1_x as a double
handles.nodal_parameters(handles.im_number,1) = str2double(get(hObject,'String'));

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.slider1_1x, 'Value', handles.nodal_parameters(handles.im_number,1));
set(handles.slider2_1y, 'Value', handles.nodal_parameters(handles.im_number,5));
set(handles.slider3_2x, 'Value', handles.nodal_parameters(handles.im_number,2));
set(handles.slider4_2y, 'Value', handles.nodal_parameters(handles.im_number,6));
set(handles.slider5_3x, 'Value', handles.nodal_parameters(handles.im_number,3));
set(handles.slider6_3y, 'Value', handles.nodal_parameters(handles.im_number,7));
set(handles.slider7_4x, 'Value', handles.nodal_parameters(handles.im_number,4));
set(handles.slider8_4y, 'Value', handles.nodal_parameters(handles.im_number,8));


guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function nodal_1_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nodal_1_y_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_1_y as text
%        str2double(get(hObject,'String')) returns contents of nodal_1_y as a double
handles.nodal_parameters(handles.im_number,5) = str2double(get(hObject,'String'));

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.slider1_1x, 'Value', handles.nodal_parameters(handles.im_number,1));
set(handles.slider2_1y, 'Value', handles.nodal_parameters(handles.im_number,5));
set(handles.slider3_2x, 'Value', handles.nodal_parameters(handles.im_number,2));
set(handles.slider4_2y, 'Value', handles.nodal_parameters(handles.im_number,6));
set(handles.slider5_3x, 'Value', handles.nodal_parameters(handles.im_number,3));
set(handles.slider6_3y, 'Value', handles.nodal_parameters(handles.im_number,7));
set(handles.slider7_4x, 'Value', handles.nodal_parameters(handles.im_number,4));
set(handles.slider8_4y, 'Value', handles.nodal_parameters(handles.im_number,8));

guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function nodal_1_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nodal_2_x_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_2_x as text
%        str2double(get(hObject,'String')) returns contents of nodal_2_x as a double
handles.nodal_parameters(handles.im_number,2) = str2double(get(hObject,'String'));

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.slider1_1x, 'Value', handles.nodal_parameters(handles.im_number,1));
set(handles.slider2_1y, 'Value', handles.nodal_parameters(handles.im_number,5));
set(handles.slider3_2x, 'Value', handles.nodal_parameters(handles.im_number,2));
set(handles.slider4_2y, 'Value', handles.nodal_parameters(handles.im_number,6));
set(handles.slider5_3x, 'Value', handles.nodal_parameters(handles.im_number,3));
set(handles.slider6_3y, 'Value', handles.nodal_parameters(handles.im_number,7));
set(handles.slider7_4x, 'Value', handles.nodal_parameters(handles.im_number,4));
set(handles.slider8_4y, 'Value', handles.nodal_parameters(handles.im_number,8));

guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function nodal_2_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nodal_2_y_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_2_y as text
%        str2double(get(hObject,'String')) returns contents of nodal_2_y as a double
handles.nodal_parameters(handles.im_number,6) = str2double(get(hObject,'String'));

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)


set(handles.slider1_1x, 'Value', handles.nodal_parameters(handles.im_number,1));
set(handles.slider2_1y, 'Value', handles.nodal_parameters(handles.im_number,5));
set(handles.slider3_2x, 'Value', handles.nodal_parameters(handles.im_number,2));
set(handles.slider4_2y, 'Value', handles.nodal_parameters(handles.im_number,6));
set(handles.slider5_3x, 'Value', handles.nodal_parameters(handles.im_number,3));
set(handles.slider6_3y, 'Value', handles.nodal_parameters(handles.im_number,7));
set(handles.slider7_4x, 'Value', handles.nodal_parameters(handles.im_number,4));
set(handles.slider8_4y, 'Value', handles.nodal_parameters(handles.im_number,8));

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function nodal_2_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function nodal_3_x_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_3_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_3_x as text
%        str2double(get(hObject,'String')) returns contents of nodal_3_x as a double
handles.nodal_parameters(handles.im_number,3) = str2double(get(hObject,'String'));

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.slider1_1x, 'Value', handles.nodal_parameters(handles.im_number,1));
set(handles.slider2_1y, 'Value', handles.nodal_parameters(handles.im_number,5));
set(handles.slider3_2x, 'Value', handles.nodal_parameters(handles.im_number,2));
set(handles.slider4_2y, 'Value', handles.nodal_parameters(handles.im_number,6));
set(handles.slider5_3x, 'Value', handles.nodal_parameters(handles.im_number,3));
set(handles.slider6_3y, 'Value', handles.nodal_parameters(handles.im_number,7));
set(handles.slider7_4x, 'Value', handles.nodal_parameters(handles.im_number,4));
set(handles.slider8_4y, 'Value', handles.nodal_parameters(handles.im_number,8));

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function nodal_3_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_3_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nodal_3_y_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_3_y as text
%        str2double(get(hObject,'String')) returns contents of nodal_3_y as a double
handles.nodal_parameters(handles.im_number,7) = str2double(get(hObject,'String'));

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.slider1_1x, 'Value', handles.nodal_parameters(handles.im_number,1));
set(handles.slider2_1y, 'Value', handles.nodal_parameters(handles.im_number,5));
set(handles.slider3_2x, 'Value', handles.nodal_parameters(handles.im_number,2));
set(handles.slider4_2y, 'Value', handles.nodal_parameters(handles.im_number,6));
set(handles.slider5_3x, 'Value', handles.nodal_parameters(handles.im_number,3));
set(handles.slider6_3y, 'Value', handles.nodal_parameters(handles.im_number,7));
set(handles.slider7_4x, 'Value', handles.nodal_parameters(handles.im_number,4));
set(handles.slider8_4y, 'Value', handles.nodal_parameters(handles.im_number,8));

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function nodal_3_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nodal_4_x_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_4_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_4_x as text
%        str2double(get(hObject,'String')) returns contents of nodal_4_x as a double
handles.nodal_parameters(handles.im_number,4) = str2double(get(hObject,'String'));

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.slider1_1x, 'Value', handles.nodal_parameters(handles.im_number,1));
set(handles.slider2_1y, 'Value', handles.nodal_parameters(handles.im_number,5));
set(handles.slider3_2x, 'Value', handles.nodal_parameters(handles.im_number,2));
set(handles.slider4_2y, 'Value', handles.nodal_parameters(handles.im_number,6));
set(handles.slider5_3x, 'Value', handles.nodal_parameters(handles.im_number,3));
set(handles.slider6_3y, 'Value', handles.nodal_parameters(handles.im_number,7));
set(handles.slider7_4x, 'Value', handles.nodal_parameters(handles.im_number,4));
set(handles.slider8_4y, 'Value', handles.nodal_parameters(handles.im_number,8));

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function nodal_4_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_4_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nodal_4_y_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_4_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_4_y as text
%        str2double(get(hObject,'String')) returns contents of nodal_4_y as a double
handles.nodal_parameters(handles.im_number,8) = str2double(get(hObject,'String'));

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.slider1_1x, 'Value', handles.nodal_parameters(handles.im_number,1));
set(handles.slider2_1y, 'Value', handles.nodal_parameters(handles.im_number,5));
set(handles.slider3_2x, 'Value', handles.nodal_parameters(handles.im_number,2));
set(handles.slider4_2y, 'Value', handles.nodal_parameters(handles.im_number,6));
set(handles.slider5_3x, 'Value', handles.nodal_parameters(handles.im_number,3));
set(handles.slider6_3y, 'Value', handles.nodal_parameters(handles.im_number,7));
set(handles.slider7_4x, 'Value', handles.nodal_parameters(handles.im_number,4));
set(handles.slider8_4y, 'Value', handles.nodal_parameters(handles.im_number,8));

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function nodal_4_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_4_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton1_set.
function pushbutton1_set_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
Ig8 = handles.nodal_parameters;
breathhold = handles.badbreathhold;
imageq = handles.badimage;

IM_def_corr = [];
Area_Change_def = [];
for i1 = 1:handles.im_number_end
    fv = Ig8(i1,:);
    
    nordal_para_x = fv([1:4]);
    nordal_para_y = fv([5:8]);

    [X_def_febl] = Linear_interp(handles.xi_Xundef, handles.xi_Yundef,nordal_para_x);
    [Y_def_febl] = Linear_interp(handles.xi_Xundef, handles.xi_Yundef,nordal_para_y);

    X_def = X_def_febl;
    Y_def = Y_def_febl;
    
    dX_def_dX = different(X_def,[1:size(X_def,2)],2);
    dX_def_dY = different(X_def,[1:size(X_def,1)],1);
    dY_def_dY = different(Y_def,[1:size(X_def,1)],1);
    dY_def_dX = different(Y_def,[1:size(X_def,2)],2);

    Area_Change = dX_def_dX .* dY_def_dY - dX_def_dY .* dY_def_dX;
    
    %%%%%% This is correct %%%%%% %%% 03/07/2012
    IM_def_in_undef_febl = interp2(handles.IM_defs(:,:,i1), X_def_febl,Y_def_febl);
    IM_def_in_undef_febl = IM_def_in_undef_febl .* Area_Change;
    IM_def_in_undef_febl(find(isnan(IM_def_in_undef_febl) == 1)) = 0;
    IM_def_corr = cat(3,IM_def_corr,IM_def_in_undef_febl);
    Area_Change_def = cat(3,Area_Change_def,Area_Change);

end

save(handles.filename, 'Ig8', 'IM_def_corr', 'breathhold', 'imageq', 'Area_Change_def', '-append');


guidata(hObject, handles);



% --- Executes on button press in pushbutton2_set.
function pushbutton2_set_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


handles.nodal_parameters(handles.im_number,1) = handles.initial_nodal_parameters(handles.im_number,1); %%%
handles.nodal_parameters(handles.im_number,2) = handles.initial_nodal_parameters(handles.im_number,2); %%%
handles.nodal_parameters(handles.im_number,3) = handles.initial_nodal_parameters(handles.im_number,3); %%%
handles.nodal_parameters(handles.im_number,4) = handles.initial_nodal_parameters(handles.im_number,4); %%%
handles.nodal_parameters(handles.im_number,5) = handles.initial_nodal_parameters(handles.im_number,5); %%%
handles.nodal_parameters(handles.im_number,6) = handles.initial_nodal_parameters(handles.im_number,6); %%%
handles.nodal_parameters(handles.im_number,7) = handles.initial_nodal_parameters(handles.im_number,7); %%%
handles.nodal_parameters(handles.im_number,8) = handles.initial_nodal_parameters(handles.im_number,8); %%%

handles.im_fig = imagesc(handles.IM_defs(:,:,handles.im_number)); colormap hot; caxis([0, max(max(max(handles.IM_defs))).*0.3]);
axis ij; axis([-10 , 266, -10 , 266]); handles.ah = axis; 
hold on; plot(handles.initial_nodal_parameters(handles.im_number,[1:4]), handles.initial_nodal_parameters(handles.im_number,[5:8]),'wo',...
                        'MarkerEdgeColor','c',...
                        'MarkerFaceColor','c',...
                        'MarkerSize',6);
                    
                                        set(gcf,'WindowButtonDownFcn',{@axes1_ButtonDownFcn handles})
                    
% [x_roi_def, y_roi_def] = roi_undef_to_roi_def_8(handles.x_roi_undef, handles.y_roi_undef,...
%     handles.xi_Xundef, handles.xi_Yundef,...
%     handles.initial_nodal_parameters(handles.im_number,:));
% hold on; plot(x_roi_def, y_roi_def, 'g--', 'LineWidth',2);


[x_roi_def_p3, y_roi_def_p3] = roi_undef_to_roi_def_8(handles.x_roi_undef, handles.y_roi_undef,...
    handles.xi_Xundef, handles.xi_Yundef,...
    [handles.initial_nodal_parameters(handles.im_number,1),...
    handles.initial_nodal_parameters(handles.im_number,2),...
    handles.initial_nodal_parameters(handles.im_number,3),...
    handles.initial_nodal_parameters(handles.im_number,4),...
    handles.initial_nodal_parameters(handles.im_number,5),...
    handles.initial_nodal_parameters(handles.im_number,6),...
    handles.initial_nodal_parameters(handles.im_number,7),...
    handles.initial_nodal_parameters(handles.im_number,8)]);

hold on; plot(x_roi_def_p3, y_roi_def_p3, 'g--', 'LineWidth',1);

% [x_roi_def_m3, y_roi_def_m3] = roi_undef_to_roi_def_8(handles.x_roi_undef, handles.y_roi_undef,...
%     handles.xi_Xundef, handles.xi_Yundef,...
%     [handles.initial_nodal_parameters(handles.im_number,1) + 3,...
%     handles.initial_nodal_parameters(handles.im_number,2) - 3,...
%     handles.initial_nodal_parameters(handles.im_number,3) + 3,...
%     handles.initial_nodal_parameters(handles.im_number,4) - 3,...
%     handles.initial_nodal_parameters(handles.im_number,5) + 3,...
%     handles.initial_nodal_parameters(handles.im_number,6) + 3,...
%     handles.initial_nodal_parameters(handles.im_number,7) - 3,...
%     handles.initial_nodal_parameters(handles.im_number,8) - 3]);
% 
% hold on; plot(x_roi_def_m3, y_roi_def_m3, 'y:', 'LineWidth',1);




%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

guidata(hObject, handles);


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

pt = get(gca, 'CurrentPoint');

 new_x = pt(1);
 new_y = pt(4);

old_1_x = handles.nodal_parameters(handles.im_number,1);
old_1_y = handles.nodal_parameters(handles.im_number,5);
old_2_x = handles.nodal_parameters(handles.im_number,2);
old_2_y = handles.nodal_parameters(handles.im_number,6);
old_3_x = handles.nodal_parameters(handles.im_number,3);
old_3_y = handles.nodal_parameters(handles.im_number,7);
old_4_x = handles.nodal_parameters(handles.im_number,4);
old_4_y = handles.nodal_parameters(handles.im_number,8);

dist_1 = (old_1_x - new_x)*(old_1_x - new_x) + (old_1_y - new_y) * (old_1_y - new_y);
dist_2 = (old_2_x - new_x)*(old_2_x - new_x) + (old_2_y - new_y) * (old_2_y - new_y);
dist_3 = (old_3_x - new_x)*(old_3_x - new_x) + (old_3_y - new_y) * (old_3_y - new_y);
dist_4 = (old_4_x - new_x)*(old_4_x - new_x) + (old_4_y - new_y) * (old_4_y - new_y);

Dist = [dist_1, dist_2, dist_3, dist_4];

if find(Dist == min(Dist)) == 1

    handles.nodal_parameters(handles.im_number,1) = new_x;
    handles.nodal_parameters(handles.im_number,5) = new_y;
    
else if find(Dist == min(Dist)) == 2
        
        handles.nodal_parameters(handles.im_number,2) = new_x;
        handles.nodal_parameters(handles.im_number,6) = new_y;
        
    else if find(Dist == min(Dist)) == 3
            
            handles.nodal_parameters(handles.im_number,3) = new_x;
            handles.nodal_parameters(handles.im_number,7) = new_y;
            
        else if find(Dist == min(Dist)) == 4
                
                handles.nodal_parameters(handles.im_number,4) = new_x;
                handles.nodal_parameters(handles.im_number,8) = new_y;

            end
        end
    end
end

%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)


guidata(hObject, handles);


% --- Executes on button press in pattern1_save.
function pattern1_save_Callback(hObject, eventdata, handles)
% hObject    handle to pattern1_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Plus
handles.save_nodal_parameters_click = handles.save_nodal_parameters_click + 1;

node_pattern = mod(handles.save_nodal_parameters_click, size(handles.save_nodal_parameters,1));
if node_pattern == 0
    node_pattern = size(handles.save_nodal_parameters,1);
end

set(handles.edit12,'String',node_pattern);

%%%% Pattern
% handles.save_nodal_parameters(handles.node_pattern,1) = handles.nodal_parameters(handles.im_number,1); %%%
% handles.save_nodal_parameters(handles.node_pattern,2) = handles.nodal_parameters(handles.im_number,2); %%%
% handles.save_nodal_parameters(handles.node_pattern,3) = handles.nodal_parameters(handles.im_number,3); %%%
% handles.save_nodal_parameters(handles.node_pattern,4) = handles.nodal_parameters(handles.im_number,4); %%%
% handles.save_nodal_parameters(handles.node_pattern,5) = handles.nodal_parameters(handles.im_number,5); %%%
% handles.save_nodal_parameters(handles.node_pattern,6) = handles.nodal_parameters(handles.im_number,6); %%%
% handles.save_nodal_parameters(handles.node_pattern,7) = handles.nodal_parameters(handles.im_number,7); %%%
% handles.save_nodal_parameters(handles.node_pattern,8) = handles.nodal_parameters(handles.im_number,8); %%%

handles.nodal_parameters(handles.im_number,1) = handles.save_nodal_parameters(node_pattern,1); %%%
handles.nodal_parameters(handles.im_number,2) = handles.save_nodal_parameters(node_pattern,2); %%%
handles.nodal_parameters(handles.im_number,3) = handles.save_nodal_parameters(node_pattern,3); %%%
handles.nodal_parameters(handles.im_number,4) = handles.save_nodal_parameters(node_pattern,4); %%%
handles.nodal_parameters(handles.im_number,5) = handles.save_nodal_parameters(node_pattern,5); %%%
handles.nodal_parameters(handles.im_number,6) = handles.save_nodal_parameters(node_pattern,6); %%%
handles.nodal_parameters(handles.im_number,7) = handles.save_nodal_parameters(node_pattern,7); %%%
handles.nodal_parameters(handles.im_number,8) = handles.save_nodal_parameters(node_pattern,8); %%%

%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

guidata(hObject, handles);




% --- Executes on button press in pattern1_show.
function pattern1_show_Callback(hObject, eventdata, handles)
% hObject    handle to pattern1_show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Minus
handles.save_nodal_parameters_click = handles.save_nodal_parameters_click - 1;

node_pattern = mod(handles.save_nodal_parameters_click, size(handles.save_nodal_parameters,1));
if node_pattern == 0
    node_pattern = size(handles.save_nodal_parameters,1);
end

set(handles.edit12,'String',node_pattern);

%%%% Pattern
% handles.save_nodal_parameters(handles.node_pattern,1) = handles.nodal_parameters(handles.im_number,1); %%%
% handles.save_nodal_parameters(handles.node_pattern,2) = handles.nodal_parameters(handles.im_number,2); %%%
% handles.save_nodal_parameters(handles.node_pattern,3) = handles.nodal_parameters(handles.im_number,3); %%%
% handles.save_nodal_parameters(handles.node_pattern,4) = handles.nodal_parameters(handles.im_number,4); %%%
% handles.save_nodal_parameters(handles.node_pattern,5) = handles.nodal_parameters(handles.im_number,5); %%%
% handles.save_nodal_parameters(handles.node_pattern,6) = handles.nodal_parameters(handles.im_number,6); %%%
% handles.save_nodal_parameters(handles.node_pattern,7) = handles.nodal_parameters(handles.im_number,7); %%%
% handles.save_nodal_parameters(handles.node_pattern,8) = handles.nodal_parameters(handles.im_number,8); %%%

handles.nodal_parameters(handles.im_number,1) = handles.save_nodal_parameters(node_pattern,1); %%%
handles.nodal_parameters(handles.im_number,2) = handles.save_nodal_parameters(node_pattern,2); %%%
handles.nodal_parameters(handles.im_number,3) = handles.save_nodal_parameters(node_pattern,3); %%%
handles.nodal_parameters(handles.im_number,4) = handles.save_nodal_parameters(node_pattern,4); %%%
handles.nodal_parameters(handles.im_number,5) = handles.save_nodal_parameters(node_pattern,5); %%%
handles.nodal_parameters(handles.im_number,6) = handles.save_nodal_parameters(node_pattern,6); %%%
handles.nodal_parameters(handles.im_number,7) = handles.save_nodal_parameters(node_pattern,7); %%%
handles.nodal_parameters(handles.im_number,8) = handles.save_nodal_parameters(node_pattern,8); %%%

%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)


guidata(hObject, handles);

% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Keep
% handles.node_pattern = 15;
handles.save_nodal_parameters_click_2 = handles.save_nodal_parameters_click_2 + 1;

node_pattern_2 = mod(handles.save_nodal_parameters_click_2, size(handles.save_nodal_parameters,1));
if node_pattern_2 == 0
    node_pattern_2 = size(handles.save_nodal_parameters,1);
end
%handles.save_nodal_parameters = [handles.save_nodal_parameters; handles.nodal_parameters(handles.im_number,:)];
handles.save_nodal_parameters(node_pattern_2,:) = handles.nodal_parameters(handles.im_number,:);

 %%%%% Set
 set_nodal_a_xy(hObject, eventdata, handles)
 
 %%%%% Figure
 show_figures_PDGUI(hObject, eventdata, handles)

 
 % --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im_number_last = handles.im_number - 1;
if im_number_last == 0
    im_number_last = 1;
end

handles.nodal_parameters(handles.im_number,1) = handles.nodal_parameters(im_number_last,1); %%%
handles.nodal_parameters(handles.im_number,2) = handles.nodal_parameters(im_number_last,2); %%%
handles.nodal_parameters(handles.im_number,3) = handles.nodal_parameters(im_number_last,3); %%%
handles.nodal_parameters(handles.im_number,4) = handles.nodal_parameters(im_number_last,4); %%%
handles.nodal_parameters(handles.im_number,5) = handles.nodal_parameters(im_number_last,5); %%%
handles.nodal_parameters(handles.im_number,6) = handles.nodal_parameters(im_number_last,6); %%%
handles.nodal_parameters(handles.im_number,7) = handles.nodal_parameters(im_number_last,7); %%%
handles.nodal_parameters(handles.im_number,8) = handles.nodal_parameters(im_number_last,8); %%%


 %%%%% Set
 set_nodal_a_xy(hObject, eventdata, handles)
 
%%%%% Figure
 show_figures_PDGUI(hObject, eventdata, handles)

%%% ---- Show figures
function show_figures_PDGUI(hObject, eventdata, handles)
%set(handles.radiobutton1_center, 'Value', 0);
%set(handles.radiobutton2_nodes, 'Value', 1);
%set(handles.radiobutton3_Blurr, 'Value', 1);
%set(handles.radiobutton4_disp, 'Value', 0);


handles.im_fig = imagesc(handles.IM_defs(:,:,handles.im_number)); colormap hot; caxis([0, max(max(max(handles.IM_defs))).*0.3]);
axis ij; axis([-10 , 266, -10 , 266]); handles.ah = axis; 
set(gcf,'WindowButtonDownFcn',{@axes1_ButtonDownFcn handles})

if handles.radiobutton2_nodes == 1
    hold on; plot(handles.nodal_parameters(handles.im_number,[1:4]), handles.nodal_parameters(handles.im_number,[5:8]),'wo',...
                        'MarkerEdgeColor','c',...
                        'MarkerFaceColor','c',...
                        'MarkerSize',6); %, 'ButtonDownFcn', @axes1_ButtonDownFcn);
                    marker_shift = 12;
                    
    hold on; text(handles.nodal_parameters(handles.im_number,1)-marker_shift, handles.nodal_parameters(handles.im_number,5)-marker_shift,...
    '\bf{\color[rgb]{1 1 0}1}','FontSize',15,...
	'HorizontalAlignment','center',... 
	'BackgroundColor',[.2 .9 .7],...
	'Margin',2);
                    
    hold on; text(handles.nodal_parameters(handles.im_number,2)+marker_shift, handles.nodal_parameters(handles.im_number,6)-marker_shift,...
    '\bf{\color[rgb]{1 1 0}2}','FontSize',15,...
	'HorizontalAlignment','center',... 
	'BackgroundColor',[.2 .8 .8],...
	'Margin',2);
                    
    hold on; text(handles.nodal_parameters(handles.im_number,3)-marker_shift, handles.nodal_parameters(handles.im_number,7)+marker_shift,...
    '\bf{\color[rgb]{1 1 0}3}','FontSize',15,...
	'HorizontalAlignment','center',... 
	'BackgroundColor',[.2 .7 .9],...
	'Margin',2);
                    
    hold on; text(handles.nodal_parameters(handles.im_number,4)+marker_shift, handles.nodal_parameters(handles.im_number,8)+marker_shift,...
    '\bf{\color[rgb]{1 1 0}4}','FontSize',15,...
	'HorizontalAlignment','center',... 
	'BackgroundColor',[.1 .6 1],...
	'Margin',2);
end

if handles.badbreathhold(handles.im_number) == 1;
        hold on; plot(10, 10,'ws',...
                        'MarkerEdgeColor','r',...
                        'MarkerFaceColor','r',...
                        'MarkerSize',15); %, 'ButtonDownFcn', @axes1_ButtonDownFcn);
        hold on; text(20, 10,'\color[rgb]{1 1 1}BadBreathHold',...
            'FontSize',10);
end

if handles.badimage(handles.im_number) == 1;
        hold on; plot(10, 20,'ws',...
                        'MarkerEdgeColor','g',...
                        'MarkerFaceColor','g',...
                        'MarkerSize',15); %, 'ButtonDownFcn', @axes1_ButtonDownFcn);
        hold on; text(20, 20,'\color[rgb]{1 1 1}BadImage',...
            'FontSize',10);
end
                    
if handles.radiobutton4_disp == 1                                        
min_x = min(handles.x_roi_undef);
max_x = max(handles.x_roi_undef);
min_y = min(handles.y_roi_undef);
max_y = max(handles.y_roi_undef);

step_x = (max_x - min_x) / 8;
step_y = (max_y - min_y) / 8;
[x_undef_d, y_undef_d] = meshgrid(min_x : step_x : max_x, min_y : step_y : max_y);
[x_def_d, y_def_d] = roi_undef_to_roi_def_8(x_undef_d, y_undef_d,...
    handles.xi_Xundef, handles.xi_Yundef,...
    handles.nodal_parameters(handles.im_number,:));
disp_u = x_def_d - x_undef_d;
disp_v = y_def_d - y_undef_d;
quiver(x_undef_d, y_undef_d, disp_u, disp_v,'b','Autoscale','off');
end

if handles.radiobutton1_center == 1
    [x_roi_def, y_roi_def] = roi_undef_to_roi_def_8(handles.x_roi_undef, handles.y_roi_undef,...
    handles.xi_Xundef, handles.xi_Yundef,...
    [handles.nodal_parameters(handles.im_number,1),...
    handles.nodal_parameters(handles.im_number,2),...
    handles.nodal_parameters(handles.im_number,3),...
    handles.nodal_parameters(handles.im_number,4),...
    handles.nodal_parameters(handles.im_number,5),...
    handles.nodal_parameters(handles.im_number,6),...
    handles.nodal_parameters(handles.im_number,7),...
    handles.nodal_parameters(handles.im_number,8)]);

hold on; plot(x_roi_def, y_roi_def, 'g--', 'LineWidth',1);
    
end


if handles.radiobutton3_Blurr == 1
[x_roi_def_p31, y_roi_def_p31] = roi_undef_to_roi_def_8(handles.x_roi_undef, handles.y_roi_undef,...
    handles.xi_Xundef, handles.xi_Yundef,...
    [handles.nodal_parameters(handles.im_number,1) - 3,...
    handles.nodal_parameters(handles.im_number,2) - 3,...
    handles.nodal_parameters(handles.im_number,3) - 3,...
    handles.nodal_parameters(handles.im_number,4) - 3,...
    handles.nodal_parameters(handles.im_number,5) - 3,...
    handles.nodal_parameters(handles.im_number,6) - 3,...
    handles.nodal_parameters(handles.im_number,7) - 3,...
    handles.nodal_parameters(handles.im_number,8) - 3]);

hold on; plot(x_roi_def_p31, y_roi_def_p31, 'y:', 'LineWidth',1);

[x_roi_def_m31, y_roi_def_m31] = roi_undef_to_roi_def_8(handles.x_roi_undef, handles.y_roi_undef,...
    handles.xi_Xundef, handles.xi_Yundef,...
    [handles.nodal_parameters(handles.im_number,1) + 3,...
    handles.nodal_parameters(handles.im_number,2) + 3,...
    handles.nodal_parameters(handles.im_number,3) + 3,...
    handles.nodal_parameters(handles.im_number,4) + 3,...
    handles.nodal_parameters(handles.im_number,5) - 3,...
    handles.nodal_parameters(handles.im_number,6) - 3,...
    handles.nodal_parameters(handles.im_number,7) - 3,...
    handles.nodal_parameters(handles.im_number,8) - 3]);

hold on; plot(x_roi_def_m31, y_roi_def_m31, 'y:', 'LineWidth',1);

[x_roi_def_p3, y_roi_def_p3] = roi_undef_to_roi_def_8(handles.x_roi_undef, handles.y_roi_undef,...
    handles.xi_Xundef, handles.xi_Yundef,...
    [handles.nodal_parameters(handles.im_number,1) - 3,...
    handles.nodal_parameters(handles.im_number,2) - 3,...
    handles.nodal_parameters(handles.im_number,3) - 3,...
    handles.nodal_parameters(handles.im_number,4) - 3,...
    handles.nodal_parameters(handles.im_number,5) + 3,...
    handles.nodal_parameters(handles.im_number,6) + 3,...
    handles.nodal_parameters(handles.im_number,7) + 3,...
    handles.nodal_parameters(handles.im_number,8) + 3]);

hold on; plot(x_roi_def_p3, y_roi_def_p3, 'y:', 'LineWidth',1);

[x_roi_def_m3, y_roi_def_m3] = roi_undef_to_roi_def_8(handles.x_roi_undef, handles.y_roi_undef,...
    handles.xi_Xundef, handles.xi_Yundef,...
    [handles.nodal_parameters(handles.im_number,1) + 3,...
    handles.nodal_parameters(handles.im_number,2) + 3,...
    handles.nodal_parameters(handles.im_number,3) + 3,...
    handles.nodal_parameters(handles.im_number,4) + 3,...
    handles.nodal_parameters(handles.im_number,5) + 3,...
    handles.nodal_parameters(handles.im_number,6) + 3,...
    handles.nodal_parameters(handles.im_number,7) + 3,...
    handles.nodal_parameters(handles.im_number,8) + 3]);

hold on; plot(x_roi_def_m3, y_roi_def_m3, 'y:', 'LineWidth',1);


end

guidata(hObject, handles);

%%% ---- Set Nodal_a_xy
function set_nodal_a_xy(hObject, eventdata, handles)

set(handles.nodal_1_x,'String',handles.nodal_parameters(handles.im_number,1));
set(handles.nodal_1_y,'String',handles.nodal_parameters(handles.im_number,5));
set(handles.nodal_2_x,'String',handles.nodal_parameters(handles.im_number,2));
set(handles.nodal_2_y,'String',handles.nodal_parameters(handles.im_number,6));
set(handles.nodal_3_x,'String',handles.nodal_parameters(handles.im_number,3));
set(handles.nodal_3_y,'String',handles.nodal_parameters(handles.im_number,7));
set(handles.nodal_4_x,'String',handles.nodal_parameters(handles.im_number,4));
set(handles.nodal_4_y,'String',handles.nodal_parameters(handles.im_number,8));

guidata(hObject, handles);


% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.badbreathhold(handles.im_number) == 0
    handles.badbreathhold(handles.im_number) = 1;
else
    handles.badbreathhold(handles.im_number) = 0;
end

%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
guidata(hObject, handles);


% --- Executes on button press in pushbutton39.
function pushbutton39_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.badimage(handles.im_number) == 0
    handles.badimage(handles.im_number) = 1;
else
    handles.badimage(handles.im_number) = 0;
end

%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
guidata(hObject, handles);


function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double
handles.save_nodal_parameters_click = round(str2double(get(hObject,'String')));

node_pattern = mod(handles.save_nodal_parameters_click, size(handles.save_nodal_parameters,1));
if node_pattern == 0
    node_pattern = size(handles.save_nodal_parameters,1);
end

set(handles.edit12,'String',node_pattern);

%%%% Pattern
handles.nodal_parameters(handles.im_number,1) = handles.save_nodal_parameters(node_pattern,1); %%%
handles.nodal_parameters(handles.im_number,2) = handles.save_nodal_parameters(node_pattern,2); %%%
handles.nodal_parameters(handles.im_number,3) = handles.save_nodal_parameters(node_pattern,3); %%%
handles.nodal_parameters(handles.im_number,4) = handles.save_nodal_parameters(node_pattern,4); %%%
handles.nodal_parameters(handles.im_number,5) = handles.save_nodal_parameters(node_pattern,5); %%%
handles.nodal_parameters(handles.im_number,6) = handles.save_nodal_parameters(node_pattern,6); %%%
handles.nodal_parameters(handles.im_number,7) = handles.save_nodal_parameters(node_pattern,7); %%%
handles.nodal_parameters(handles.im_number,8) = handles.save_nodal_parameters(node_pattern,8); %%%

%%%%% Set
set_nodal_a_xy(hObject, eventdata, handles)
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
