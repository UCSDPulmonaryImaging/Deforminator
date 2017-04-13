function [Xsorted,FNa,X,IND]=LoadAllDicomFilesv6(path2dir,IDF,imnumb);

% [Xsorted,FNa,X,IND]=LoadAllDicomFiles(path2dir,Identifier);
%
% This function loads all dicom files in one folder.
% It also sorts them out
%
% Inputs: 
%    path2dir - directory path where images are located
%    Identifier - (optional) string corresponding to your scanner identifier 
%                  e.g 'IM_' or 'MRDC' or 'CFMRIW'
%    imnumber - (optional) loads selected images 
%                  e.g. [22 120] will load images 22 and 120    
% 
% Xsorted => Structure with all images e.g. = 256x256xNumberOfImages
%            sorted according to file name .MRDC.XXX
% FNa => Unsorted images file names (for verification purpusoses)
% X   => Unsorted structure with all images e.g. = 256x256xNumberOfImages
% IND => 'translation' from X to Xsorted 
%
% Rui Carlos Sá - Tatsuya Arai
% April 2017 V6.0
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
% Changes from v5.0 to v6.0
% - Using structures to make the function more versatile
% - Reads not only "MRDC" files (PIL), but any file name 
% - integrates the functionallity of loading select files
%  April 2017, Rui Carlos Sá 
%----------------------------------------------------


cd(path2dir)

if nargin == 1
    IDF='*.MRDC*';
end


Z=dir(['*' IDF '*']);

Z2=struct2cell(Z);
Nm=size(Z2,2)

if Nm==0;
    'There are no files with the identifier you selected in the folder'
    Xsorted=[];
    FNa=[];
    X=[];
    IND=[];

elseif Nm>0

% determine matrix size (added on v50)
trial=dicomread(char(Z2(1,1)));

% creates file name structure
FNa=[];
% variable matrix size (added on v50)
X=zeros(size(trial,1),size(trial,2),Nm);
clear trial

% ** (note for future improvement)
for i=1:Nm
    a=Z2(1,i);
    FNa=[FNa; a];
    X(:,:,i)=dicomread(char(FNa(i,:)));
end

% Sorts the images by the number after 'MRDC.'
FNa2=char(FNa);

Xsorted=zeros(size(X));
aux1=strfind(FNa2(1,:),IDF);
ba=aux1+length(IDF);

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


end


% Loading selected dicom files was an afterthought
% Ideally, this could be better integrated above ** for 
% faster performance

if nargin ==3
    
for i=1:length(imnumb)
clear Xsorted
Xsorted(:,:,i)=Xsorted2(:,:,imnumb(i));
end

elseif nargin<3
Xsorted(:,:,1:Nm)=Xsorted2(:,:,find(in));
end

