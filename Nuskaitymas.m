%------------------------------------------------------
%Gintarø rûðiavimas
%Modifikuota: 2018-10-06
%------------------------------------------------------

global vid;
global s;

clc;
close all;

%Panaikita serial porto konekcijas
delete(instrfindall); 

% stop(vid);
% fclose(s);

%------------------------------------------------------
%-----COM porto apraðymas klasiø iðvedimui pradþia-----
%------------------------------------------------------

s=serial('COM1', 'Baudrate',38400); 
fopen(s);
% fwrite(s,41);

%-----------------------------------------------------
%-----COM porto apraðymas klasiø iðvedimui galas------
%-----------------------------------------------------

%---------------------------------------------
%-----PointGrey kameros apraðymas pradþia-----
%---------------------------------------------

% vid = videoinput('pointgrey', 1, 'RGB32_640x480');

% %src = getselectedsource(vid);
 
% vid.FramesPerTrigger = 1;

% % src.BrightnessMode = 'Manual';
% % src.ExposureMode = 'Manual';
% % src.GainMode = 'Manual';
% % src.PanMode = 'Manual';
% % src.Brightness = 140;
% % src.Exposure = 7;
% % src.Gain = 0;
 
% set(vid, 'FramesPerTrigger', 1);
% set(vid, 'TriggerRepeat', Inf);
% triggerconfig(vid, 'immediate');%'manual');

% start(vid)

%-------------------------------------------
%-----PointGrey kameros apraðymas galas-----
%-------------------------------------------
tmpLine = '----------------------------------------------------------- \n';
fprintf(tmpLine);
fprintf( 1, '|         Pradedamas gintarø rûðiavimo procesas          |\n' );

amberNr=0;
class=0;
classNr=10;
classM=2; % Klasës generavimo metodas

fprintf(tmpLine);

while 1
    
    tic;
    
    amberNr=amberNr+1;
    % Im= peekdata(vid,1);
    I=imread('C:\Users\Marius\Desktop\Magistrinis_darbas\MatLab\Gintaru_foto\Image.1.39.1.jpg');
    switch classM
        case 1
            class=classL(class,classNr);
        otherwise
            class=classR(classNr);
    end
    % fwrite(s,class,'int8');
    
    fprintf('| Gintaras nr.: %2d | Klasë: %2d | Laikas: %2.8f sek. |\n', amberNr, class, toc);
    fprintf(tmpLine);
        
end

%------------------------
%-----Klasë paeiliui-----
%------------------------
function class=classL(class, classNr)
  
    if class==classNr
        class=0;
    end
    
    class=+1;
    
end

%---------------------------
%-----Klasë atsitiktinë-----
%---------------------------
function class=classR(classNr)
  
   class = randi([1 classNr],1);
    
end

%flushdata(vid);    
%stop(vid);fclose(s)


