function Deforminator_PIL(saveFilename)

% Wrapper around Tatsuya Arai's 
%   Projective deformation code
% 
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
    
    %Load all dicom images in 
    [IM_unreg]=LoadAllDicomFiles(dire2);
    cd(home);
    Projective_deformation_GUI_Vol3([],[],IM_unreg,[],saveFilename);

end

if nargin ==1
    
    load(saveFilename)
    Projective_deformation_GUI_Vol3(x_roi,y_roi,IM_unreg,Ig8,saveFilename,breathhold,imageq);

end
