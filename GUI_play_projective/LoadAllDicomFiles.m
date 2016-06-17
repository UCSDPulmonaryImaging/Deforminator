function [Xsorted,FNa,X,IND]=LoadAllDicomFiles(path2dir);

% [Xsorted,FNa,X,IND]=LoadAllDicomFiles(path2dir);
%
% This function loads all dicom files in one folder.
% It also sorts them out
%
% path2dir - directory path where images are located
% 
% Xsorted => Structure with all images e.g. = 256x256xNumberOfImages
%            sorted according to file name .MRDC.XXX
% FNa => Unsorted images file names (for verification purpusoses)
% X   => Unsorted structure with all images e.g. = 256x256xNumberOfImages
% IND => 'translation' from X to Xsorted 
%
% Running this function plots the number of files 
%     - for sanity check...
%
% Rui Carlos Sá - Tatsuya Arai
% January 2014 V5.1
%
%----------------------------------------------------
% Changes from v1.0 to v2.0
%  Sorts files when scanner output is not in the right order.
%  Order is established by number after .MRDC.XXX
%----------------------------------------------------
% Changes from v2.0 to v3.0
%  Solves a bug reported by Evan, present only when data is discarded 
% and the first .MRDC.XXX is NOT equal to 1. 
%----------------------------------------------------
% Changes from v3.0 to v4.0
%  Read only .MRDC.XXX dicom images. 
%----------------------------------------------------
% Changes from v4.0 to v5.0
%  Can read DICOM's of any diadic dimension (256, 128, etc)
%  January 2013, Rui Carlos Sá
% Changes from v5.0 to v5.1 
%  Re-introduced possibility to load data with "holes"
%  as used to be the case (c.f. v3.0)
%  January 2014, Rui Carlos Sá 
%----------------------------------------------------

cd(path2dir)

Z=dir('*.MRDC*');

Z2=struct2cell(Z);
Nm=size(Z2,2);

% determine matrix size (added on v50)
trial=dicomread(char(Z2(1,1)));

% creates file name structure
FNa=[];
% variable matrix size (added on v50)
X=zeros(size(trial,1),size(trial,2),Nm);
clear trial

for i=1:Nm
    a=Z2(1,i);
    FNa=[FNa; a];
    X(:,:,i)=dicomread(char(FNa(i,:)));
end

% Sorts the images by the number after 'MRDC.'
FNa2=char(FNa);

Xsorted=zeros(size(X));
aux1=strfind(FNa2(1,:),'MRDC.');
ba=aux1+5;

for i=1:Nm
   la=length(FNa2(i,:));
   IND(i)=str2num(FNa2(i,(ba:la)));
   c=IND(i)-IND(1)+1;
   Xsorted2(:,:,c)=X(:,:,i);
end


% In some datasets, DICOM naming is not continuous.
% These added lines erase "holes in data"
in=zeros(1,max(IND));
auxvarholes=squeeze(sum(sum(Xsorted2,2),1));
auxin=find(auxvarholes);
in(auxin)=1;

Xsorted(:,:,1:Nm)=Xsorted2(:,:,find(in));
