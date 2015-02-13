function Deforminator_PIL_MultiModality(saveFilename)

% Wrapper around Tatsuya Arai's 
%   Projective deformation code
% =================== 
% WORK IN PROGRESS
% ===================
% USAGE
%   Deforminator_PIL
% 
% Optional inputs
%   savedFilename 'This is an appropriate filename.mat';
% 
% Outputs
%   none to the working environment
%   File saved with the selected File name
%
% Variables saved 
%   IM_def - registered images
%   IM_unreg - original images
% 
%   imageq - good/bad image (0 good, 1 bad)
%   breathold - good/bad breathold (0 good, 1 bad)
%   Area_change - Jacobian of the local transformation/ area change
%   notes - notes 
%   out - image # selected as reference
%   refIM - reference image
%   referenceROI - reference ROI
%   dire2 - directory of loaded data
%   Ig8 - Projective transformation
%
% Rui Carlos Sá. Projective transformation and GUI's by Tatsuya Arai
% March 2014
% v1.1
%
% Changes from v1.0
% Adds possibility to start from an ongoing file 
% Changed function name
% 

close all

if nargin == 0 
    % -1 - Select UI File Name -> Saving
    'Select save file name'
    [saveFilename,path2save]=uiputfile('*.mat', 'Select save file name');
    % 0 - Load all Files
    home = cd;
    % If no subject directory included, select it now

        % Select folder where data is stored
    dire0=pwd;
    'Select folder containing data to be registered'
    dire2=uigetdir(dire0,'Select folder containing DICOM data to be registered');
    loadedpath = dire2;

    %Load all dicom images in 
    [IM_unreg]=LoadAllDicomFiles(dire2);
    cd(home);
    Projective_deformation_GUI_Vol3([],[],IM_unreg,[],saveFilename,path2save,loadedpath);

end

if nargin ==1
    
    load(saveFilename)
    
    
     'Select save file name'
    [saveFilename_OtherModality,path2save]=uiputfile('*.mat', 'Select save file name');
    % 0 - Load all Files
    home = cd;
    
    nodepatterns = repmat(reference_pattern,[15,1]);
    
    %some stuff for backwards compatibility with previous versions (did not
    %have as many saved outputs)
    if ~exist('path2save')
        path2save = cd;
    end
    
    if ~exist('loadedpath')
        loadedpath = 'Not Available';
    end
    
    if ~exist('reference_pattern')
        min_x = min(x_roi); 
        max_x = max(x_roi);
        min_y = min(y_roi);
        max_y = max(y_roi);
        reference_pattern = [min_x, max_x, min_x, max_x, min_y, min_y, max_y, max_y];
    end
    
    %if ~exist('nodepatterns')
        nodepatterns = repmat(reference_pattern,[15,1]);
    %end
    
    if ~exist('subject_initials')
        subject_initials = '';
    end
    
    if ~exist('notes')
        notes = '';
    end
 
    dire0=pwd;
    'Select folder containing data to be registered'
    dire2=uigetdir(dire0,'Select folder containing DICOM data to be registered');
    loadedpath = dire2;
    [Modality2Images]=LoadAllDicomFiles(dire2);
    cd(home);
    
    Projective_deformation_GUI_Vol3(x_roi,y_roi,Modality2Images,[],saveFilename_OtherModality,path2save,loadedpath,breathhold,imageq,nodepatterns,reference_pattern,subject_initials,notes);

end
