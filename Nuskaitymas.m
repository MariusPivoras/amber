%------------------------------------------------------
%Gintar� r��iavimas
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
%-----COM porto apra�ymas klasi� i�vedimui prad�ia-----
%------------------------------------------------------

s=serial('COM1', 'Baudrate',38400); 
fopen(s);
% fwrite(s,41);

%-----------------------------------------------------
%-----COM porto apra�ymas klasi� i�vedimui galas------
%-----------------------------------------------------

%---------------------------------------------
%-----PointGrey kameros apra�ymas prad�ia-----
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
%-----PointGrey kameros apra�ymas galas-----
%-------------------------------------------
tmpLine = '----------------------------------------------------------- \n';
fprintf(tmpLine);
fprintf( 1, '|         Pradedamas gintar� r��iavimo procesas          |\n' );

amberNr=0;
class=0;
classNr=10;
classM=2; % Klas�s generavimo metodas

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
    
    fprintf('| Gintaras nr.: %2d | Klas�: %2d | Laikas: %2.8f sek. |\n', amberNr, class, toc);
    fprintf(tmpLine);
        
end

%------------------------
%-----Klas� paeiliui-----
%------------------------
function class=classL(class, classNr)
  
    if class==classNr
        class=0;
    end
    
    class=+1;
    
end

%---------------------------
%-----Klas� atsitiktin�-----
%---------------------------
function class=classR(classNr)
  
   class = randi([1 classNr],1);
    
end

%flushdata(vid);    
%stop(vid);fclose(s)


