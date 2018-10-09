%------------------------------------------------------
%Gintarø rûðiavimas
%Modifikuota: 2018-10-09
%------------------------------------------------------

global vid;
global s;

clc;
close all;

%Panaikita serial porto konekcijas
delete(instrfindall); 

%------------------------------------------------------
%-----COM porto apraðymas klasiø iðvedimui pradþia-----
%------------------------------------------------------

s=serial('COM3', 'Baudrate',38400); 
fopen(s);
% fwrite(s,41);

%-----------------------------------------------------
%-----COM porto apraðymas klasiø iðvedimui galas------
%-----------------------------------------------------

%---------------------------------------------
%-----PointGrey kameros apraðymas pradþia-----
%---------------------------------------------

vid = videoinput('pointgrey');

% src = getselectedsource(vid);
 
vid.FramesPerTrigger = 1;

% src.BrightnessMode = 'Manual';
% src.ExposureMode = 'Manual';
% src.GainMode = 'Manual';
% src.PanMode = 'Manual';
% src.Brightness = 140;
% src.Exposure = 7;
% src.Gain = 0;
 
set(vid, 'FramesPerTrigger', 1);
set(vid, 'TriggerRepeat', Inf);
triggerconfig(vid, 'immediate');%'manual');
%  vid.TimerFcn = {'stop'};

start(vid)

%-------------------------------------------
%-----PointGrey kameros apraðymas galas-----
%-------------------------------------------

tmpLine = '------------------------------------------------------------------------------ \n';
fprintf(tmpLine);
fprintf( 1, '|                  Pradedamas gintarø rûðiavimo procesas                   |\n' );

amberNr=0;
class=0;
classNr=5;
classM=2; % Klasës generavimo metodas

% Klasiø konstruktorius
for i=1:1:classNr
    Gintaras(i) = GintarasClass();
end

fprintf(tmpLine);

timeInterval = 60;
tMainElapsed = 0;
pause
tMain=tic;
Im=[];

while tMainElapsed < timeInterval
    
    tIner = tic;
    Im=peekdata(vid,1);

    if size(Im,1)~=0 % Tikrina ar yra vaizdas
      
        amberNr=amberNr+1;
%      imshow(Im)
%      I=imread('C:\Users\Marius\Desktop\Magistrinis_darbas\MatLab\Gintaru_foto\Image.1.39.1.jpg');
        switch classM
            case 1
                class=classL(class,classNr);
            otherwise
                class=classR(classNr);
        end

        Gintaras(class).kiekis = GintarasClass.klasesKiekis(Gintaras(class).kiekis);

        fwrite(s,class,'int8');
        tInerElapsed = toc(tIner);
        fprintf('| Gintaras nr.: %2d | Klasë: %2d | Viso klasëje: %2d | Laikas: %2.8f sek. |\n', amberNr, class, Gintaras(class).kiekis, tInerElapsed);
        fprintf(tmpLine);
        
        flushdata(vid, 'all'); % pasalina vaida is kameros
    end
    
    Im=[]; % pasalina vaizda
    
    tMainElapsed = toc(tMain);
   
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


