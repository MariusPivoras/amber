%------------------------------------------------------
%Gintar� r��iavimas
%Modifikuota: 2018-10-09
%------------------------------------------------------

global vid;
global s;

clc;
close all;

%Panaikita serial porto konekcijas
delete(instrfindall); 

%------------------------------------------------------
%-----COM porto apra�ymas klasi� i�vedimui prad�ia-----
%------------------------------------------------------

% s=serial('COM3', 'Baudrate',38400); 
% fopen(s);
% fwrite(s,41);

%-----------------------------------------------------
%-----COM porto apra�ymas klasi� i�vedimui galas------
%-----------------------------------------------------

%---------------------------------------------
%-----PointGrey kameros apra�ymas prad�ia-----
%---------------------------------------------

% vid = videoinput('pointgrey');
% vid.FramesPerTrigger = 1;
% set(vid, 'FramesPerTrigger', 1);
% set(vid, 'TriggerRepeat', Inf);
% triggerconfig(vid, 'immediate');%'manual');

% % src = getselectedsource(vid);
% % src.BrightnessMode = 'Manual';
% % src.ExposureMode = 'Manual';
% % src.GainMode = 'Manual';
% % src.PanMode = 'Manual';
% % src.Brightness = 140;
% % src.Exposure = 7;
% % src.Gain = 0;
%  vid.TimerFcn = {'stop'};

% start(vid)

%-------------------------------------------
%-----PointGrey kameros apra�ymas galas-----
%-------------------------------------------
fileID = fopen('log.txt','w');
tmpLine = '-----------------------------------------------------------------------------------------------------------------  \n';
fprintf(tmpLine);
fprintf(fileID,tmpLine);
fprintf( 1, '|                                    Pradedamas gintar� r��iavimo procesas                                      |\n' );
fprintf(fileID,'|                                    Pradedamas gintar� r��iavimo procesas                                      |\n' );
fprintf(tmpLine);
fprintf(fileID,tmpLine);

amberNr=0;
class=0;

classNr=5;
classM=2; % Klas�s generavimo metodas

timeInterval = 60;
tMainElapsed = 0;

pause

tMain=tic;

Im=[];
% Klasi� konstruktorius
for i=1:1:classNr
    Amber(i) = AmberClass();
end

imagefiles = dir('Gintaru_foto\*.jpg');      
nfiles = length(imagefiles);


% while tMainElapsed < timeInterval
for ii=1:nfiles   
    tIner = tic;
%   Im=peekdata(vid,1);
%   Im=imread('C:\Users\Marius\Desktop\Magistrinis_darbas\MatLab\Gintaru_foto\Image.1.1.21.jpg');
%     if size(Im,1)~=0 % Tikrina ar yra vaizdas
    currentfilename = [imagefiles(ii).folder, '\', imagefiles(ii).name];
    Im=imread(currentfilename);
    Image=PreprocessImage(Im); % Vidutinis apdorojimo laikas priklauso nuo apdorojamos nuotruakos dyd�io (prie 640x480 prisideda ~0.01 sek) .
%     figure(1),imshow(Image)
%     pause 
%     MaskedImg = Im .* uint8(Image);
%     figure(2),imshow(MaskedImg);
%     pause
     [p1,p2]=FindPoints(Image,1); % Apdorojimo laikas prakti�kai ne�takoja bendro iteracijos apdorojimo laiko
     
     DrawLines(Im,p1,p2);
   pause
%    imshow(Image)
        switch classM
            case 1
                class=classL(class,classNr);
            otherwise
                class=classR(classNr);
        end

        Amber(class).sum = AmberClass.classCount(Amber(class).sum);

%         fwrite(s,class,'int8');
        amberNr=amberNr+1;
        tInerElapsed = toc(tIner);
        fprintf('| Gintaras nr.: %2d | Klas�: %2d | Viso klas�je: %2d | Iteracijos laikas: %2.4f sek. | Bendras laikas: %2.2f sek. |\n', amberNr, class, Amber(class).sum, tInerElapsed, tMainElapsed);
        fprintf(fileID,'| Gintaras nr.: %2d | Klas�: %2d | Viso klas�je: %2d | Iteracijos laikas: %2.4f sek. | Bendras laikas: %2.2f sek. |\n', amberNr, class, Amber(class).sum, tInerElapsed, tMainElapsed);
        fprintf(tmpLine);
        fprintf(fileID,tmpLine);
%         flushdata(vid, 'all'); % pasalina vaida is kameros
%     end
    
%      Im=[]; % pasalina vaizda
    
    tMainElapsed = toc(tMain);
   
end
fclose(fileID);
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


