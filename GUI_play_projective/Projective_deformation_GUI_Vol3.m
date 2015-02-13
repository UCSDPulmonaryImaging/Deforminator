%% Help Section
% to be completed
%
%
% Function calls
% First load: Projective_deformation_GUI_Vol3(([],[],IM_unreg,[],saveFilename))
% Reload Prev: Projective_deformation_GUI_Vol3(x_roi,y_roi,IM_unreg,Ig8,saveFilename,breathhold,imageq);
% Multimodality: Projective_deformation_GUI_Vol3(x_roi_oldModality,y_roi_oldModality,OtherModalityIM,[],saveFilename,[],[]);
%
%Varargin list for .m-file debugging (empty means use [] as placeholder,
%excluded inputs should not appear at all in the function call
% note that nargin includes the three default hObject, eventdata, handles
% in addition to the varargin argument
%
% 1: x_roi, optionally empty, x coordinates of ROI vertices
% 2: y_roi, optionally empty, y coordinates of ROI vertices
% 3: IM_defs, mandatory input, set of images to register
% 4: Ig8, optionally empty, set of saved nodal parameters
% 5: saveFilename, mandatory input, file name for saving GUI output
% 6: breathhold, optionally excluded, series of saved bad breathhold info
% 7: imageq, optionally excluded, series of saved bad image data
% 8: patterns, optionally excluded, series of saved nodal patterns

%% Initialization function DO NOT EDIT!!!!!
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

% Last Modified by GUIDE v2.5 22-Oct-2014 13:14:13

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
end

% End initialization code

%% Object Creation Functions
% --- Executes during object creation, after setting all properties.

function display_nodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_nodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


function display_center_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_center (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


function display_Blurr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_Blurr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


function display_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


function completionStatus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to completionStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


function pushbutton1_set_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
end


function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
end


function slider1_1x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1_1x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


function slider2_1y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2_1y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


function slider3_2x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3_2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


function slider4_2y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4_2y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


function slider5_3x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5_3x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


function slider6_3y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6_3y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


function slider7_4x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7_4x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


function slider8_4y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8_4y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


function im_number_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to im_number_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function image_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to image_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


function nodal_1_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function nodal_1_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function nodal_2_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function nodal_2_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function nodal_3_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_3_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function pattern_chooser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pattern_chooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function nodal_4_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_4_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function nodal_3_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function nodal_4_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodal_4_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

%% Opening & Output Functions

% --- Executes just before Projective_deformation_GUI_Vol3 is made visible.
function Projective_deformation_GUI_Vol3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)
axis(handles.axes2, [ 0 100, 0 1]);
axis([handles.axes2 handles.axes1], 'off');

% Choose default command line output for Projective_deformation_GUI_Vol3
%%% Input
handles.output = hObject;
handles.IM_defs = varargin{3};
handles.filename = varargin{5};
handles.im_number = 1;
handles.im_number_end = size(handles.IM_defs,3);
handles.nodal_parameters = [];
handles.save_nodal_parameters = [];
handles.reference_im = 1;
handles.initialized = 0;
handles.resetting_reference = 0;

sliderMin = 1;
sliderMax = size(handles.IM_defs,3); % this is variable
sliderStep = [1, 1] / (sliderMax - sliderMin); % major and minor steps of 1

set(handles.image_slider, 'Min', sliderMin);
set(handles.image_slider, 'Max', sliderMax);
set(handles.image_slider, 'SliderStep', sliderStep);
set(handles.image_slider, 'Value', sliderMin); % set to beginning of sequence
set(handles.im_number_edit, 'String', handles.im_number);

%disable for now because it is not currently working
set(handles.setDefault,'enable','off');
handles.path2save = varargin{6};
handles.loadedpath = varargin{7};

%if there are predefined nodes keep them, otherwise set to empty array
%function initialize will check if the array is empty and pre-populate it
if ~isempty(varargin{4})
    handles.nodal_parameters = varargin{4};
end

    if ~isempty(varargin{1}) && ~isempty(varargin{2})
        handles.x_roi_undef = varargin{1};
        handles.y_roi_undef = varargin{2};
        

        if nargin > 10
            handles.badbreathhold = varargin{8};
            handles.badimage = varargin{9};
            handles.save_nodal_parameters = varargin{10};
            handles.reference_pattern = varargin{11};
            handles.subject_initials = varargin{12};
            handles.notes = varargin{13};
            
            availsearch = [1:15];
            % find the first unset nodal pattern (= reference pattern) and set save-to counter to that index
            % note that the first saved pattern is always the original roi,
            % and so we only search through 2:15
            handles.next_available = min(availsearch(squeeze((sum((repmat(handles.reference_pattern,[14 1])==handles.save_nodal_parameters(2:end,:)),2)==8))))+1;
        else
            handles.badbreathhold = zeros(handles.im_number_end,1);
            handles.badimage = zeros(handles.im_number_end,1);
        end

        initialize(hObject, eventdata, handles);

    else %this is what you do if an ROI doesn't exist yet    
        handles.next_available = 2;
        handles.notes = 'notes';
        handles.subject_initials = 'subject initials';
        handles.x_roi_undef = [];
        handles.y_roi_undef = [];
        handles.nodal_parameters = [];
        handles.badbreathhold = zeros(handles.im_number_end,1);
        handles.badimage = zeros(handles.im_number_end,1);
        handles.subject_initials = '';
        handles.notes = '';
        set(handles.slider1_1x, 'enable', 'off'); 
        set(handles.slider2_1y, 'enable','off');
        set(handles.slider3_2x, 'enable', 'off'); 
        set(handles.slider4_2y, 'enable', 'off'); 
        set(handles.slider5_3x, 'enable', 'off'); 
        set(handles.slider6_3y, 'enable', 'off'); 
        set(handles.slider7_4x, 'enable', 'off'); 
        set(handles.slider8_4y, 'enable', 'off'); 
        set(handles.display_center, 'enable', 'off');
        set(handles.display_nodes, 'enable', 'off');
        set(handles.display_Blurr, 'enable', 'off');
        set(handles.display_disp, 'enable', 'off');
        set(handles.pushbutton1_set, 'enable', 'off');

        %%%% Radio Button
        set(handles.display_ROI,'Value',0);
        set(handles.display_center,'Value',0);
        set(handles.display_center,'Value',0);
        set(handles.display_nodes,'Value',0);
        set(handles.display_Blurr,'Value',0);
        set(handles.display_disp,'Value',0); 

        handles.display_ROI_val = 0;
        handles.display_center_val = 0;
        handles.display_nodes_val = 0;
        handles.display_Blurr_val = 0;
        handles.display_disp_val = 0; 
        handles.modifying_ROI = 0;

        guidata(hObject, handles);
        show_figures_PDGUI(hObject, eventdata, handles);

    end   
end

% --- Outputs from this function are returned to the command line. 
% Currently nothing is output
function varargout = Projective_deformation_GUI_Vol3_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% Initialization after ROI selection helper function 
function initialize(hObject, eventdata, handles)

    
    if handles.resetting_reference == 1 %special behavior if initialize is called on a change in reference image
        handles.resetting_reference = 0;
        
    else %regular behavior
        %%%%% Nodes
        min_x = min(handles.x_roi_undef); 
        max_x = max(handles.x_roi_undef);
        min_y = min(handles.y_roi_undef);
        max_y = max(handles.y_roi_undef);
        [X_undef, Y_undef] = meshgrid(1:size(handles.IM_defs,2),1:size(handles.IM_defs,1));
        handles.xi_Xundef = (X_undef - min_x) / (max_x - min_x);
        handles.xi_Yundef = (Y_undef - min_y) / (max_y - min_y);
    end
 
        
        
    if isempty(handles.nodal_parameters) 
        handles.nodal_parameters = [min_x * ones(handles.im_number_end,1), max_x * ones(handles.im_number_end,1),...
            min_x * ones(handles.im_number_end,1), max_x * ones(handles.im_number_end,1),...
            min_y * ones(handles.im_number_end,1), min_y * ones(handles.im_number_end,1),...
            max_y * ones(handles.im_number_end,1), max_y * ones(handles.im_number_end,1)];
        
        handles.reference_pattern = handles.nodal_parameters(handles.im_number,:);
    end
        
    
    if isempty(handles.save_nodal_parameters)
        handles.save_nodal_parameters = handles.nodal_parameters(1:15,:);
    end
    
    handles.initial_nodal_parameters = handles.nodal_parameters;
    handles.save_nodal_parameters_click = 0;
    handles.save_nodal_parameters_click_2 = 0;

    if ~handles.initialized %run this if executing for the first time, else use set_nodal_all callback
        
        handles.node_pattern = 1;
        
        %%% Node 1 x slider
        sliderMin_1x = -10;
        sliderMax_1x = size(handles.IM_defs,2) + 50; % this is variable
        sliderStep_1x = [1, 1] / (sliderMax_1x - sliderMin_1x); % major and minor steps of 1

        set(handles.slider1_1x, 'Min', sliderMin_1x);
        set(handles.slider1_1x, 'Max', sliderMax_1x);
        set(handles.slider1_1x, 'SliderStep', sliderStep_1x);


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
    else
        set_nodal_all_xy(hObject, eventdata, handles)
    end

    %%%% Radio Button
    set(handles.display_center,'Value',1);
    set(handles.display_nodes,'Value',1);
    set(handles.display_Blurr,'Value',0);
    set(handles.display_disp,'Value',0);
    set(handles.display_ROI,'Value',0);
    
    
    set(handles.accept_ROI, 'enable', 'off');
    set(handles.display_ROI,'enable','on');

    handles.display_ROI_val = 0;
    handles.display_center_val = 1;
    handles.display_nodes_val = 1;
    handles.display_Blurr_val = 0;
    handles.display_disp_val = 0;
    handles.modifying_ROI = 0;

    %%%
    
    handles.initialized = 1;
    set(handles.pattern_chooser,'String',handles.node_pattern);
    set(handles.im_number_edit,'String',handles.im_number);

    % Update handles structure
    guidata(hObject, handles);
    show_figures_PDGUI(hObject, eventdata, handles);
    set_nodal_all_xy(hObject, eventdata, handles);
end

%% Callbacks - GUI keypress (keyboard shortcuts)

% --- Executes on key press with focus on GuiMainWindow or any of its controls.
function GuiMainWindow_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to GuiMainWindow (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

switch eventdata.Key
    case 'rightarrow'
        if handles.im_number < handles.im_number_end
            handles.im_number = handles.im_number+1;
            resetImg();
            pause(.03);
        end
        
    case 'leftarrow'
        if handles.im_number > 1
            handles.im_number = handles.im_number-1;
             resetImg();
             pause(.03);
        end
        
    case '1'
        handles.node_pattern = 1;
        loadSelectedPattern(hObject,eventdata,handles);
        
    case '2'
        handles.node_pattern = 2;
        loadSelectedPattern(hObject,eventdata,handles);
    
    case '3'
        handles.node_pattern = 3;
        loadSelectedPattern(hObject,eventdata,handles);
    
    case '4'
        handles.node_pattern = 4;
        loadSelectedPattern(hObject,eventdata,handles);
        
    case '5'
        handles.node_pattern = 5;
        loadSelectedPattern(hObject,eventdata,handles);
    
    case '6'
        handles.node_pattern = 6;
        loadSelectedPattern(hObject,eventdata,handles);
    
    case '7'
        handles.node_pattern = 7;
        loadSelectedPattern(hObject,eventdata,handles);
    
    case '8'
        handles.node_pattern = 8;
        loadSelectedPattern(hObject,eventdata,handles);
    
    case '9'
        handles.node_pattern = 9;
        loadSelectedPattern(hObject,eventdata,handles);
        
    case '0'
        handles.node_pattern = 10;
        loadSelectedPattern(hObject,eventdata,handles);
        
    case 'q'
        handles.node_pattern = 11;
        loadSelectedPattern(hObject,eventdata,handles);
        
    case 'w'
        handles.node_pattern = 12;
        loadSelectedPattern(hObject,eventdata,handles);
        
    case 'e'
        handles.node_pattern = 13;
        loadSelectedPattern(hObject,eventdata,handles);
        
    case 'r'
        handles.node_pattern = 14;
        loadSelectedPattern(hObject,eventdata,handles);
        
    case 't'
        handles.node_pattern = 15;
        loadSelectedPattern(hObject,eventdata,handles);
        
    case 's'
        pushbutton1_set_Callback(hObject, eventdata, handles); %save to file
        
    case 'z'
        pushbutton41_Callback(hObject, eventdata, handles); % last pattern
    
    case 'x'
        pushbutton2_set_Callback(hObject, eventdata, handles); %initial pattern
    
    case 'k' %keyboard shortcut to save current node pattern into the next available space
        pushbutton40_Callback(hObject, eventdata, handles);
        
    case 'backspace' %keyboard shortcut to replace selected node pattern (in edit box) with the current figure's pattern
        handles.save_nodal_parameters(handles.node_pattern,:) = handles.nodal_parameters(handles.im_number,:);
        guidata(hObject,handles);
        
end

    %this function is not currently implemented (for resetting default) 
    function resetImg()
        set(handles.im_number_edit,'String',handles.im_number);
        guidata(hObject, handles);
        
        if handles.initialized
        set_nodal_all_xy(hObject, eventdata, handles);
        end
        
        set(handles.image_slider, 'Value', handles.im_number);
        show_figures_PDGUI(hObject, eventdata, handles);
    end


end


%% Callbacks - Slider Movement

% --- Executes on slider movement.
function slider1_1x_Callback(hObject, eventdata, handles)
% hObject    handle to slider1_1x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,1) = get(handles.slider1_1x,'Value');
guidata(hObject, handles);
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
set(handles.nodal_1_x,'String',handles.nodal_parameters(handles.im_number,1));
set(handles.completionStatus,'String','Unsaved Changes');
end

function slider2_1y_Callback(hObject, eventdata, handles)
% hObject    handle to slider2_1y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,5) = get(handles.slider2_1y,'Value'); %%%
guidata(hObject, handles);
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
set(handles.nodal_1_y,'String',handles.nodal_parameters(handles.im_number,5)); %%%
set(handles.completionStatus,'String','Unsaved Changes');
end

function slider3_2x_Callback(hObject, eventdata, handles)
% hObject    handle to slider3_2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,2) = get(handles.slider3_2x,'Value'); %%%
guidata(hObject, handles);
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
set(handles.nodal_2_x,'String',handles.nodal_parameters(handles.im_number,2)); %%%
set(handles.completionStatus,'String','Unsaved Changes');
end

function slider4_2y_Callback(hObject, eventdata, handles)
% hObject    handle to slider4_2y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nodal_parameters(handles.im_number,6) = get(handles.slider4_2y,'Value'); %%%
guidata(hObject, handles);
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

set(handles.nodal_2_y,'String',handles.nodal_parameters(handles.im_number,6)); %%%
set(handles.completionStatus,'String','Unsaved Changes');

end

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
end

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
end

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
set(handles.completionStatus,'String','Unsaved Changes');
end

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
set(handles.completionStatus,'String','Unsaved Changes');
end

%% Callbacks - Radio Buttons

% --- Executes on button press in display_center.
function display_center_Callback(hObject, eventdata, handles)
% hObject    handle to display_center (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of display_center

% When it is on:1 or off:0
handles.display_center_val=get(hObject,'Value');
%%%%% Figure

%%%%% Set
guidata(hObject,handles);  
set_nodal_all_xy(hObject, eventdata, handles)
show_figures_PDGUI(hObject, eventdata, handles);
end

% --- Executes on button press in display_nodes.
function display_nodes_Callback(hObject, eventdata, handles)
% hObject    handle to display_nodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of display_nodes
handles.display_nodes_val=get(hObject,'Value');
%%%%% Figure

%%%%% Set
guidata(hObject,handles);  
set_nodal_all_xy(hObject, eventdata, handles)
show_figures_PDGUI(hObject, eventdata, handles);
end

% --- Executes on button press in display_Blurr.
function display_Blurr_Callback(hObject, eventdata, handles)
% hObject    handle to display_Blurr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of display_Blurr
handles.display_Blurr_val=get(hObject,'Value');
%%%%% Figure

%%%%% Set
guidata(hObject,handles);
set_nodal_all_xy(hObject, eventdata, handles)
show_figures_PDGUI(hObject, eventdata, handles);
end

% --- Executes on button press in display_disp.
function display_disp_Callback(hObject, eventdata, handles)
% hObject    handle to display_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of display_disp
% When it is on:1 or off:0
handles.display_disp_val=get(hObject,'Value');
%%%%% Figure

%%%%% Set
guidata(hObject,handles);
set_nodal_all_xy(hObject, eventdata, handles);
show_figures_PDGUI(hObject, eventdata, handles)
end

% --- Executes on button press in display_ROI.
function display_ROI_Callback(hObject, eventdata, handles)
% hObject    handle to display_ROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of display_ROI

handles.display_ROI_val = get(hObject,'Value');

if handles.display_ROI_val == 1
    set(handles.slider1_1x, 'enable', 'off');
    set(handles.slider2_1y, 'enable','off'); 
    set(handles.slider3_2x, 'enable', 'off'); 
    set(handles.slider4_2y, 'enable', 'off');
    set(handles.slider5_3x, 'enable', 'off'); 
    set(handles.slider6_3y, 'enable', 'off'); 
    set(handles.slider7_4x, 'enable', 'off'); 
    set(handles.slider8_4y, 'enable', 'off');
    set(handles.display_center, 'enable', 'off');
    set(handles.display_nodes, 'enable', 'off');
    set(handles.display_Blurr, 'enable', 'off');
    set(handles.display_disp, 'enable', 'off');
    set(handles.accept_ROI, 'enable', 'on');
    set(handles.display_ROI, 'enable', 'off');
    set(handles.pushbutton1_set,'enable','off');
     
    
    %%%% Radio Button
    set(handles.display_center,'Value',0);
    set(handles.display_nodes,'Value',0);
    set(handles.display_Blurr,'Value',0);
    set(handles.display_disp,'Value',0); 
    
    handles.display_center_val = 0;
    handles.display_nodes_val = 0;
    handles.display_Blurr_val = 0;
    handles.display_disp_val = 0;
end

    
guidata(hObject, handles);
show_figures_PDGUI(hObject, eventdata, handles);
end

%% Callbacks - Accept ROI, Bad Breath, and Bad Image


% --- Executes on button press in badbreath.
function badbreath_Callback(hObject, eventdata, handles)
% hObject    handle to badbreath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.badbreathhold(handles.im_number) == 0
    handles.badbreathhold(handles.im_number) = 1;
else
    handles.badbreathhold(handles.im_number) = 0;
end

%%%%% Set
if ~isempty(handles.nodal_parameters)
set_nodal_all_xy(hObject, eventdata, handles)
end
%%%%% Figure
guidata(hObject, handles);
show_figures_PDGUI(hObject, eventdata, handles);
end

% --- Executes on button press in badimage.
function badimage_Callback(hObject, eventdata, handles)
% hObject    handle to badimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.badimage(handles.im_number) == 0
    handles.badimage(handles.im_number) = 1;
else
    handles.badimage(handles.im_number) = 0;
end

%%%%% Set
if ~isempty(handles.nodal_parameters)
set_nodal_all_xy(hObject, eventdata, handles)
end
%%%%% Figure

guidata(hObject, handles);
show_figures_PDGUI(hObject, eventdata, handles);
end

% --- Executes on button press in accept_ROI.
function accept_ROI_Callback(hObject, eventdata, handles)
% hObject    handle to accept_ROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(hObject,'enable','off');

    handles.modifying_ROI = 0;
    newROIPos = getPosition(handles.ROI);
    
    delete(handles.ROI);
    handles.x_roi_undef = newROIPos(:,1);
    handles.y_roi_undef = newROIPos(:,2);
    handles.x_roi_undef(end+1) = handles.x_roi_undef(1);
    handles.y_roi_undef(end+1) = handles.y_roi_undef(1);
    
    if ~isempty(handles.nodal_parameters)
        min_x = min(handles.x_roi_undef); 
        max_x = max(handles.x_roi_undef);
        min_y = min(handles.y_roi_undef);
        max_y = max(handles.y_roi_undef);

        handles.nodal_parameters(handles.im_number,:) = [min_x, max_x, min_x, max_x, min_y, min_y, max_y, max_y];
        handles.reference_pattern = handles.nodal_parameters(handles.im_number,:);
    end
    
    %set up parameters for new roi
    initialize(hObject, eventdata, handles);
    
    %turn controls back on  
    set(handles.slider1_1x, 'enable', 'on');
    set(handles.slider2_1y, 'enable','on'); 
    set(handles.slider3_2x, 'enable', 'on'); 
    set(handles.slider4_2y, 'enable', 'on');
    set(handles.slider5_3x, 'enable', 'on'); 
    set(handles.slider6_3y, 'enable', 'on'); 
    set(handles.slider7_4x, 'enable', 'on'); 
    set(handles.slider8_4y, 'enable', 'on');
    set(handles.display_center, 'enable', 'on');
    set(handles.display_nodes, 'enable', 'on');
    set(handles.display_Blurr, 'enable', 'on');
    set(handles.display_disp, 'enable', 'on');
    set(handles.display_ROI,'enable','on');
    set(handles.pushbutton1_set, 'enable', 'on');
    set(handles.completionStatus,'String','Unsaved Changes');

end

%% Callbacks - Node Position edit

function nodal_1_x_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_1_x as text
%        str2double(get(hObject,'String')) returns contents of nodal_1_x as a double
handles.nodal_parameters(handles.im_number,1) = str2double(get(hObject,'String'));

%%%%% Figure

set(handles.slider1_1x, 'Value', handles.nodal_parameters(handles.im_number,1));
guidata(hObject, handles);
show_figures_PDGUI(hObject, eventdata, handles);
set(handles.completionStatus,'String','Unsaved Changes');
end

function nodal_1_y_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_1_y as text
%        str2double(get(hObject,'String')) returns contents of nodal_1_y as a double
handles.nodal_parameters(handles.im_number,5) = str2double(get(hObject,'String'));

%%%%% Figure

set(handles.slider2_1y, 'Value', handles.nodal_parameters(handles.im_number,5));
guidata(hObject, handles);
show_figures_PDGUI(hObject, eventdata, handles);
set(handles.completionStatus,'String','Unsaved Changes');
end

function nodal_2_x_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_2_x as text
%        str2double(get(hObject,'String')) returns contents of nodal_2_x as a double
handles.nodal_parameters(handles.im_number,2) = str2double(get(hObject,'String'));

%%%%% Figure
set(handles.slider3_2x, 'Value', handles.nodal_parameters(handles.im_number,2));
guidata(hObject, handles);
show_figures_PDGUI(hObject, eventdata, handles);
set(handles.completionStatus,'String','Unsaved Changes');


end

function nodal_2_y_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_2_y as text
%        str2double(get(hObject,'String')) returns contents of nodal_2_y as a double
handles.nodal_parameters(handles.im_number,6) = str2double(get(hObject,'String'));

set(handles.slider4_2y, 'Value', handles.nodal_parameters(handles.im_number,6));
guidata(hObject, handles);
show_figures_PDGUI(hObject, eventdata, handles);
set(handles.completionStatus,'String','Unsaved Changes');

end

function nodal_3_x_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_3_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_3_x as text
%        str2double(get(hObject,'String')) returns contents of nodal_3_x as a double
handles.nodal_parameters(handles.im_number,3) = str2double(get(hObject,'String'));
set(handles.slider5_3x, 'Value', handles.nodal_parameters(handles.im_number,3));
guidata(hObject, handles);
show_figures_PDGUI(hObject, eventdata, handles);
set(handles.completionStatus,'String','Unsaved Changes');
end

function nodal_3_y_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_3_y as text
%        str2double(get(hObject,'String')) returns contents of nodal_3_y as a double
handles.nodal_parameters(handles.im_number,7) = str2double(get(hObject,'String'));

%%%%% Figure
set(handles.slider6_3y, 'Value', handles.nodal_parameters(handles.im_number,7));
guidata(hObject, handles);
show_figures_PDGUI(hObject, eventdata, handles);
set(handles.completionStatus,'String','Unsaved Changes');
end

function nodal_4_x_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_4_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_4_x as text
%        str2double(get(hObject,'String')) returns contents of nodal_4_x as a double
handles.nodal_parameters(handles.im_number,4) = str2double(get(hObject,'String'));
set(handles.slider7_4x, 'Value', handles.nodal_parameters(handles.im_number,4));
guidata(hObject, handles);
show_figures_PDGUI(hObject, eventdata, handles);
set(handles.completionStatus,'String','Unsaved Changes');
end

function nodal_4_y_Callback(hObject, eventdata, handles)
% hObject    handle to nodal_4_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodal_4_y as text
%        str2double(get(hObject,'String')) returns contents of nodal_4_y as a double
handles.nodal_parameters(handles.im_number,8) = str2double(get(hObject,'String'));
set(handles.slider8_4y, 'Value', handles.nodal_parameters(handles.im_number,8));
guidata(hObject, handles);
show_figures_PDGUI(hObject, eventdata, handles);
set(handles.completionStatus,'String','Unsaved Changes');
end

%%% ---- Set Nodal_a_xy
function set_nodal_all_xy(hObject, eventdata, handles)
%update text boxes
set(handles.nodal_1_x,'String',handles.nodal_parameters(handles.im_number,1));
set(handles.nodal_1_y,'String',handles.nodal_parameters(handles.im_number,5));
set(handles.nodal_2_x,'String',handles.nodal_parameters(handles.im_number,2));
set(handles.nodal_2_y,'String',handles.nodal_parameters(handles.im_number,6));
set(handles.nodal_3_x,'String',handles.nodal_parameters(handles.im_number,3));
set(handles.nodal_3_y,'String',handles.nodal_parameters(handles.im_number,7));
set(handles.nodal_4_x,'String',handles.nodal_parameters(handles.im_number,4));
set(handles.nodal_4_y,'String',handles.nodal_parameters(handles.im_number,8));

%update sliders
set(handles.slider1_1x, 'Value', handles.nodal_parameters(handles.im_number,1));
set(handles.slider2_1y, 'Value', handles.nodal_parameters(handles.im_number,5)); 
set(handles.slider3_2x, 'Value', handles.nodal_parameters(handles.im_number,2)); 
set(handles.slider4_2y, 'Value', handles.nodal_parameters(handles.im_number,6)); 
set(handles.slider5_3x, 'Value', handles.nodal_parameters(handles.im_number,3)); 
set(handles.slider6_3y, 'Value', handles.nodal_parameters(handles.im_number,7)); 
set(handles.slider7_4x, 'Value', handles.nodal_parameters(handles.im_number,4)); 
set(handles.slider8_4y, 'Value', handles.nodal_parameters(handles.im_number,8));


guidata(hObject, handles);
end

%% Callbacks - Image select slider and edit

function im_number_edit_Callback(hObject, eventdata, handles)
% hObject    handle to im_number_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of im_number_edit as text
%        str2double(get(hObject,'String')) returns contents of im_number_edit as a double
handles.im_number = str2double(get(hObject,'String'));

if handles.im_number < 1
   handles.im_number = 1;
   set(hObject,'String',num2str(handles.im_number,1));
   
elseif handles.im_number > handles.im_number_end
   handles.im_number = handles.im_number_end;
   set(hObject,'String',num2str(handles.im_number,3));
end

set(handles.image_slider, 'Value', handles.im_number);
guidata(hObject, handles);
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
%%%%% Set
if handles.initialized
    set_nodal_all_xy(hObject, eventdata, handles)
end
end

% --- Executes on slider movement.
function image_slider_Callback(hObject, eventdata, handles)
% hObject    handle to image_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.im_number = round(get(handles.image_slider,'Value'));
set(handles.im_number_edit,'String',handles.im_number);

%%%%% Figure

%%%%% Set
guidata(hObject, handles);
if handles.initialized
    set_nodal_all_xy(hObject, eventdata, handles)
end
show_figures_PDGUI(hObject, eventdata, handles);

end


%% Callbacks - Node Pattern Store & Select

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

guidata(hObject, handles);

%%%%% Set
set_nodal_all_xy(hObject, eventdata, handles);

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles);

end

% --- Executes on button press in patternSelect_next.
function patternSelect_next_Callback(hObject, eventdata, handles)
% hObject    handle to patternSelect_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Plus
if handles.save_nodal_parameters_click >= 15
    handles.save_nodal_parameters_click = 1;
else
    handles.save_nodal_parameters_click = handles.save_nodal_parameters_click + 1;
end

handles.node_pattern = handles.save_nodal_parameters_click;
loadSelectedPattern(hObject,eventdata,handles);
end

% --- Executes on button press in patternSelect_prev.
function patternSelect_prev_Callback(hObject, eventdata, handles)
% hObject    handle to patternSelect_prev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Minus
if handles.save_nodal_parameters_click <= 1
    handles.save_nodal_parameters_click = 15;
else
    handles.save_nodal_parameters_click = handles.save_nodal_parameters_click - 1;
end

handles.node_pattern = handles.save_nodal_parameters_click;
loadSelectedPattern(hObject, eventdata, handles);
end

% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.save_nodal_parameters(handles.next_available,:) = handles.nodal_parameters(handles.im_number,:);
set(handles.pattern_chooser,'String',handles.next_available);
handles.next_available = handles.next_available + 1;
if handles.next_available > 15
	handles.next_available = 15;
end
guidata(hObject,handles);
%%%%% Set
set_nodal_all_xy(hObject, eventdata, handles)
 
%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)
end

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
 set_nodal_all_xy(hObject, eventdata, handles)
 
%%%%% Figure
 show_figures_PDGUI(hObject, eventdata, handles)
end

% --- Executes on text edit in pattern_chooser
function pattern_chooser_Callback(hObject, eventdata, handles)
% hObject    handle to pattern_chooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pattern_chooser as text
%        str2double(get(hObject,'String')) returns contents of pattern_chooser as a double
handles.save_nodal_parameters_click = round(str2double(get(hObject,'String')));
if handles.save_nodal_parameters_click > 15
    handles.save_nodal_parameters_click = 15;
elseif handles.save_nodal_parameters_click <1
      handles.save_nodal_parameters_click = 1;
end

handles.node_pattern = handles.save_nodal_parameters_click;
loadSelectedPattern(hObject,eventdata,handles);
end

%%%%%%%%%%%%%%%%%%%% Helper functions for callbacks %%%%%%%%%%%%%%%%%%%%%%

function loadSelectedPattern(hObject, eventdata, handles)
if handles.node_pattern == 0
    handles.node_pattern = size(handles.save_nodal_parameters,1);
end

set(handles.pattern_chooser,'String',handles.node_pattern);

handles.nodal_parameters(handles.im_number,1) = handles.save_nodal_parameters(handles.node_pattern,1); %%%
handles.nodal_parameters(handles.im_number,2) = handles.save_nodal_parameters(handles.node_pattern,2); %%%
handles.nodal_parameters(handles.im_number,3) = handles.save_nodal_parameters(handles.node_pattern,3); %%%
handles.nodal_parameters(handles.im_number,4) = handles.save_nodal_parameters(handles.node_pattern,4); %%%
handles.nodal_parameters(handles.im_number,5) = handles.save_nodal_parameters(handles.node_pattern,5); %%%
handles.nodal_parameters(handles.im_number,6) = handles.save_nodal_parameters(handles.node_pattern,6); %%%
handles.nodal_parameters(handles.im_number,7) = handles.save_nodal_parameters(handles.node_pattern,7); %%%
handles.nodal_parameters(handles.im_number,8) = handles.save_nodal_parameters(handles.node_pattern,8); %%%

%%%%% Set
set_nodal_all_xy(hObject, eventdata, handles)

%%%%% Figure
show_figures_PDGUI(hObject, eventdata, handles)

guidata(hObject, handles);
end

%% Callbacks - Save to file

% --- Executes on button press in pushbutton1_set.
function pushbutton1_set_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%% Figure
set(handles.pushbutton1_set,'Enable','off');

Ig8 = handles.nodal_parameters;
breathhold = handles.badbreathhold;
imageq = handles.badimage;
ROIObj = impoly(handles.axes1,[handles.x_roi_undef, handles.y_roi_undef],'Closed',true);
ROI = createMask(ROIObj);
delete(ROIObj);
reference_pattern = handles.reference_pattern;
path2save = handles.path2save;
loadedpath = handles.loadedpath;
homedir = cd;
subject_initials = handles.subject_initials;
notes = handles.notes;

%notes and initials prompt
prompt={'Subject initials:','Notes:'};
name='Input subject info';
defaultanswer={subject_initials,notes};
answer=inputdlg(prompt,name,2,defaultanswer);

if ~isempty(answer)
    subject_initials=char(answer(1));
    notes=char(answer(2));
    handles.subject_initials = subject_initials;
    handles.notes = notes;
end

x_roi = handles.x_roi_undef;
y_roi = handles.y_roi_undef;
IM_unreg = handles.IM_defs;
saveFilename = handles.filename;
nodepatterns = handles.save_nodal_parameters;

IM_def_corr = zeros(size(handles.IM_defs)).*NaN; %preallocate for speed
Area_Change_def = IM_def_corr; %preallocating
pbar = zeros(1,100);
axes(handles.axes2);

if isfield(handles,'pbar_plot')
    if ishandle(handles.pbar_plot)
        delete(handles.pbar_plot);
    end
end
        
for i1 = 1:handles.im_number_end
    percentComplete = i1/handles.im_number_end*100;
    if percentComplete >= 99;
        percentComplete = 99;
    end
    pbar(ceil(percentComplete)) = 1;
    
    if i1 == 1
        hold off;
    end
    if i1 ~= 1
        delete(handles.pbar_plot);
    end
    
    handles.pbar_plot = bar(handles.axes2,pbar,'FaceColor',[0 .5 .5],'EdgeColor',[0 .5 .5]);
    if percentComplete == 100
        set(handles.completionStatus,'String',[num2str(percentComplete,3),'%']);
    else
        set(handles.completionStatus,'String',[num2str(percentComplete,2),'%']);
    end
    hold on;
    axis([ 0 100, 0 1]);
    axis off;
    
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
    IM_def_in_undef_febl(isnan(IM_def_in_undef_febl)) = 0;
    IM_def_corr(:,:,i1) = IM_def_in_undef_febl;
    Area_Change_def(:,:,i1) = Area_Change;
    pause(.01);
end
cd(path2save);
save([path2save,'/',handles.filename], 'Ig8', 'IM_def_corr', 'breathhold', 'imageq', 'Area_Change_def','ROI','x_roi','y_roi','IM_unreg','nodepatterns','saveFilename','reference_pattern','path2save','loadedpath','subject_initials','notes');
delete(handles.pbar_plot);
cd(homedir);

set(handles.completionStatus,'String','Save Complete');

set(handles.pushbutton1_set,'Enable','on');
guidata(hObject, handles);
end

%% Callbacks - Figure Display

%%% ---- Show figures
function show_figures_PDGUI(hObject, eventdata, handles)

%clear the figure if it exists, note that ishandle fails if variable
%doesn't exist, which is why I check if the structure field exists first
%there is probably a better way, but this at least seems to work

if isfield(handles,'im_fig')
    if ishandle(handles.im_fig)
       delete(handles.im_fig);
       handles = rmfield(handles,'im_fig');
       guidata(hObject, handles);
    end
end

if isfield(handles,'nodes_im')
   if ishandle(handles.nodes_im)
   delete(handles.nodes_im);
   handles = rmfield(handles,'nodes_im');
   guidata(hObject, handles);
   end
end

if isfield(handles,'outline_im')
   if ishandle(handles.outline_im)
   delete(handles.outline_im);
   handles = rmfield(handles,'outline_im');
   guidata(hObject, handles);
   end
end

if exist('Node1','var')
delete(Node1);
end

if exist('Node2','var')
delete(Node2);
end

if exist('Node3','var')
delete(Node3);
end

if exist('Node4','var')
delete(Node4);
end

if exist('NodeCenter','var')
delete(NodeCenter);
end
% end clear

%display the new image
hold off;
axes(handles.axes1);
handles.im_fig = imagesc(handles.IM_defs(:,:,handles.im_number)); colormap hot; caxis([0, max(max(max(handles.IM_defs))).*0.3]);
axis ij; axis([-10 , 266, -10 , 266]); handles.ah = axis; 

%additional display options based on radio-button/image-quality values

if handles.display_nodes_val == 1
    NodeAdjust = 5; %space the visual markers a out a little from the actual node point (helps with draggability)
    
    Node1x = handles.nodal_parameters(handles.im_number,1) - NodeAdjust;
    Node2x = handles.nodal_parameters(handles.im_number,2) + NodeAdjust;
    Node3x = handles.nodal_parameters(handles.im_number,3) - NodeAdjust;
    Node4x = handles.nodal_parameters(handles.im_number,4) + NodeAdjust;
   

    Node1y = handles.nodal_parameters(handles.im_number,5) - NodeAdjust;
    Node2y = handles.nodal_parameters(handles.im_number,6) - NodeAdjust;
    Node3y = handles.nodal_parameters(handles.im_number,7) + NodeAdjust;
    Node4y = handles.nodal_parameters(handles.im_number,8) + NodeAdjust;
    
    NodeCenterX = Linear_interp(.5,.5,[Node1x Node2x Node3x Node4x]);
    NodeCenterY = Linear_interp(.5,.5,[Node1y Node2y Node3y Node4y]);
    
    Node1 = impoint(handles.axes1, Node1x, Node1y); setColor(Node1,'blue');
    Node2 = impoint(handles.axes1, Node2x, Node2y); setColor(Node2,'blue');
    Node3 = impoint(handles.axes1, Node3x, Node3y); setColor(Node3,'blue');
    Node4 = impoint(handles.axes1, Node4x, Node4y); setColor(Node4,'blue');
    NodeCenter = impoint(handles.axes1,NodeCenterX,NodeCenterY); setColor(NodeCenter,'green');
    
    addNewPositionCallback(Node1,@updateN1);
    addNewPositionCallback(Node2,@updateN2);
    addNewPositionCallback(Node3,@updateN3);
    addNewPositionCallback(Node4,@updateN4);
    addNewPositionCallback(NodeCenter,@updateNC);
    
    constrainfcn = makeConstrainToRectFcn('impoint', [0 256], [0 256]);
    setPositionConstraintFcn(Node1,constrainfcn);
    setPositionConstraintFcn(Node2,constrainfcn);
    setPositionConstraintFcn(Node3,constrainfcn);
    setPositionConstraintFcn(Node4,constrainfcn);
    setPositionConstraintFcn(NodeCenter,constrainfcn);
    
    redraw();
elseif (handles.display_center_val == 1) && (handles.display_nodes_val == 0)
    redraw();
end

if handles.display_Blurr_val == 1
   redraw();
end

if handles.display_ROI_val == 1
    %first time roi, set modifying flag to one and create
    if isempty(handles.x_roi_undef) && (handles.modifying_ROI == 0)
      handles.ROI = impoly(handles.axes1,'Closed',true);
      handles.modifying_ROI = 1;
      handles.ROIPosition = getPosition(handles.ROI);
    else
        %editing prev ROI:
        %if we weren't previously modifying, create ROI based on the ROI
        %vertices saved
        if handles.modifying_ROI == 0
              handles.ROI = impoly(handles.axes1,[handles.x_roi_undef, handles.y_roi_undef],'Closed',true);
              handles.ROIPosition = getPosition(handles.ROI);
              handles.modifying_ROI = 1;
        else
        %if we were already modifying the ROI and the image has updated,
        %create a new ROI based on the last known position of the previous
        %one
              
              handles.ROI = impoly(handles.axes1,handles.ROIPosition,'Closed',true);
        end 
    end
    
    addNewPositionCallback(handles.ROI,@updateROIPos); 
    guidata(hObject, handles);
end

hold on; text(20, 10,['\color[rgb]{1 1 1}',handles.loadedpath],...
     'FontSize',10);

if handles.badbreathhold(handles.im_number) == 1;
        hold on; plot(10, 20,'ws',...
                        'MarkerEdgeColor','r',...
                        'MarkerFaceColor','r',...
                        'MarkerSize',15); %, 'ButtonDownFcn', @axes1_ButtonDownFcn);
        hold on; text(20, 20,'\color[rgb]{1 1 1}BadBreathHold',...
            'FontSize',10);
end

if handles.badimage(handles.im_number) == 1;
        hold on; plot(handles.axes1,10, 30,'ws',...
                        'MarkerEdgeColor','b',...
                        'MarkerFaceColor','b',...
                        'MarkerSize',15); %, 'ButtonDownFcn', @axes1_ButtonDownFcn);
        hold on; text(20, 30,'\color[rgb]{1 1 1}BadImage',...
            'FontSize',10);
end

%position callbacks for imroi objects
function updateROIPos(pos)
    handles.ROIPosition = pos;
    guidata(hObject,handles);
end

function updateCenterOnDistort()
    NodeCenterX = Linear_interp(.5,.5,[Node1x Node2x Node3x Node4x]);
    NodeCenterY = Linear_interp(.5,.5,[Node1y Node2y Node3y Node4y]);
    setPosition(NodeCenter,[NodeCenterX,NodeCenterY]);
end

function updateN1(h)
        handles.nodal_parameters(handles.im_number,[1 5]) = h + [NodeAdjust NodeAdjust];
        Node1x = h(1);
        Node1y = h(2);
        updateCenterOnDistort();       
        redraw();
        guidata(hObject, handles);
        set_nodal_all_xy(hObject, eventdata, handles);
        set(handles.completionStatus,'String','Unsaved Changes');
end        
        
function updateN2(h)
        handles.nodal_parameters(handles.im_number,[2 6]) = h + [-NodeAdjust NodeAdjust];
        Node2x = h(1);
        Node2y = h(2);
        updateCenterOnDistort();     
        redraw();
        guidata(hObject, handles);
        set_nodal_all_xy(hObject, eventdata, handles);
        set(handles.completionStatus,'String','Unsaved Changes');

       
end
        
function updateN3(h)
        handles.nodal_parameters(handles.im_number,[3 7]) = h + [NodeAdjust -NodeAdjust];
        Node3x = h(1);
        Node3y = h(2);
        updateCenterOnDistort();     
        redraw();
        guidata(hObject, handles);
        set_nodal_all_xy(hObject, eventdata, handles);
        set(handles.completionStatus,'String','Unsaved Changes');
     
end
        
function updateN4(h)
        handles.nodal_parameters(handles.im_number,[4 8]) = h + [-NodeAdjust -NodeAdjust];
        Node4x = h(1);
        Node4y = h(2);
        updateCenterOnDistort();     
        redraw();
        guidata(hObject, handles);
        set_nodal_all_xy(hObject, eventdata, handles);
        set(handles.completionStatus,'String','Unsaved Changes');
end

function updateNC(h)
    shiftx = h(1)-NodeCenterX;
    shifty = h(2)-NodeCenterY;
    NodeCenterX = h(1);
    NodeCenterY = h(2);
    handles.nodal_parameters(handles.im_number,[1:4]) =  handles.nodal_parameters(handles.im_number,[1:4])+ shiftx;
    handles.nodal_parameters(handles.im_number,[5:8]) = handles.nodal_parameters(handles.im_number,[5:8])+ shifty;
    setPosition(Node1,(getPosition(Node1)+[shiftx shifty]));
    setPosition(Node2,(getPosition(Node2)+[shiftx shifty]));
    setPosition(Node3,(getPosition(Node3)+[shiftx shifty]));
    setPosition(Node4,(getPosition(Node4)+[shiftx shifty]));
    redraw();
    guidata(hObject, handles);
    set_nodal_all_xy(hObject, eventdata, handles);
    set(handles.completionStatus,'String','Unsaved Changes');
end
        
function redraw()

if isfield(handles,'outline_im')
    if ishandle(handles.outline_im)
        delete(handles.outline_im);
    end
end

if isfield(handles,'refmarker')
   if ishandle(handles.refmarker)
   delete(handles.refmarker);
   handles = rmfield(handles,'refmarker');
   delete(handles.reftext);
   handles = rmfield(handles,'reftext');
   end
end

if ~isempty(handles.nodal_parameters)
    if all(handles.nodal_parameters(handles.im_number,:) ==handles.reference_pattern)
       hold on; handles.refmarker = plot(handles.axes1,10, 40,'ws',...
                        'MarkerEdgeColor','g',...
                        'MarkerFaceColor','g',...
                        'MarkerSize',15); %, 'ButtonDownFcn', @axes1_ButtonDownFcn);
        hold on; handles.reftext = text(20, 40,'\color[rgb]{1 1 1}Reference',...
            'FontSize',10);
    end
end
                            
if handles.display_disp_val == 1                                        
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
    disp_v = y_def_d - y_undef_d; hold on;
    quiver(x_undef_d, y_undef_d, disp_u, disp_v,'b','Autoscale','off'); axis ij;
end

if handles.display_center_val == 1
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

hold on; handles.outline_im=plot(handles.axes1,x_roi_def, y_roi_def, 'g--', 'LineWidth',1);

%uistack(handles.outline_im,'down',5);
    
end

if handles.display_Blurr_val == 1
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

    hold on; plot(handles.axes1,x_roi_def_p31, y_roi_def_p31, 'y:', 'LineWidth',1);

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

    plot(handles.axes1,x_roi_def_m31, y_roi_def_m31, 'y:', 'LineWidth',1);

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

    plot(handles.axes1,x_roi_def_p3, y_roi_def_p3, 'y:', 'LineWidth',1);

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

    plot(handles.axes1,x_roi_def_m3, y_roi_def_m3, 'y:', 'LineWidth',1);
end
end

guidata(hObject, handles);

end

%% doesn't yet work
% --- Executes on button press in setDefault.
function setDefault_Callback(hObject, eventdata, handles)
% hObject    handle to setDefault (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.reference_pattern = handles.nodal_parameters(handles.im_number,:);

 handles.resetting_reference = 1;
 guidata(hObject, handles);
 initialize(hObject, eventdata, handles);
end
