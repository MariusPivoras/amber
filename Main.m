%------------------------------------------------------
%Gintarø rûðiavimas
%Modifikuota: 2018-10-16
%Pagrindinë paleidþiamoji byla
%------------------------------------------------------

global vid;
global s;

clc;
close all;
clear all;

%Panaikita serial porto konekcijas
delete(instrfindall); 

%------------------------------------------------------
%-----COM porto apraðymas klasiø iðvedimui pradþia-----
%------------------------------------------------------

% s=serial('COM3', 'Baudrate',38400); 
% fopen(s);
% fwrite(s,41);

%-----------------------------------------------------
%-----COM porto apraðymas klasiø iðvedimui galas------
%-----------------------------------------------------

%---------------------------------------------
%-----PointGrey kameros apraðymas pradþia-----
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
%-----PointGrey kameros apraðymas galas-----
%-------------------------------------------
fileID = fopen('log.txt','w');
tmpLine = '-----------------------------------------------------------------------------------------------------------------  \n';
fprintf(tmpLine);
fprintf(fileID,tmpLine);
fprintf( 1, '|                                    Pradedamas gintarø rûðiavimo procesas                                      |\n' );
fprintf(fileID,'|                                    Pradedamas gintarø rûðiavimo procesas                                      |\n' );
fprintf(tmpLine);
fprintf(fileID,tmpLine);

amberNr=0;
amberBadNr=0;
class=0;
Skip=0;
MaxArea=50000;
classNr=10;
classM=2; % Klasës generavimo metodas

timeInterval = 60;
tMainElapsed = 0;

pause

tMain=tic;

Im=[];

MaxIndex=20;
MinIndex=12;
% Klasiø konstruktorius
for i=1:1:classNr
    Amber(i) = AmberClass();
    Amber(i).class=i;
    AreaLenght = MaxArea/classNr;
    FormIndexLenght = (MaxIndex-MinIndex)/classNr;
    if Amber(i).class==1
         Amber(i).area=[0, (i*AreaLenght)+(AreaLenght/2)-1]; 
         Amber(i).formIndex=[MinIndex, (i*FormIndexLenght)+(FormIndexLenght/2)-0.0001 + MinIndex]; 
    elseif Amber(i).class==classNr
         Amber(i).area=[(i*AreaLenght)-(AreaLenght/2), MaxArea*10]; 
         Amber(i).formIndex=[(i*FormIndexLenght)-(FormIndexLenght/2)+MinIndex, MaxIndex*10]; 
    else
         Amber(i).area=[(i*AreaLenght)-(AreaLenght/2), (i*AreaLenght)+(AreaLenght/2)-1];
         Amber(i).formIndex=[(i*FormIndexLenght)-(FormIndexLenght/2)+MinIndex, (i*FormIndexLenght)+(FormIndexLenght/2)-0.0001+MinIndex]; 
    end
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
    [Image, Skip, Area, Perimeter]=PreprocessImage(Im); % Vidutinis apdorojimo laikas priklauso nuo apdorojamos nuotruakos dydþio (prie 640x480 prisideda ~0.01 sek) .
    amberNr=amberNr+1;
%     f1 = figure(1);
%     screensize = get( groot, 'Screensize' );
%     set(f1,'position',[-screensize(3)/2 0 screensize(3) screensize(4)])
%     imshow(Im);
%     MaskedImg = Im .* uint8(Image);
%     f2 = figure(2);
%     set(f2,'position',[screensize(3)/2 0 screensize(3) screensize(4)])
%     imshow(MaskedImg)
%     pause

         if Skip == 0
%            [p1,p2]=FindPoints(Image,1); % Apdorojimo laikas praktiðkai neátakoja bendro iteracijos apdorojimo laiko
%            DrawLines(Image,p1,p2);
%            pause
%            imshow(Image)
%                 switch classM
%                     case 1
%                         class=classL(class,classNr);
%                     otherwise
%                         class=classR(classNr);
%                 end
%                 class = checkSize(Amber, Area, classNr);
                
                formIndex = (Perimeter^2)/Area;
                class = checkForm(Amber, formIndex, classNr);
                
                Amber(class).sum = AmberClass.classCount(Amber(class).sum);

        %         fwrite(s,class,'int8');
                tInerElapsed = toc(tIner);
                fprintf('| Gintaras nr.: %2d | Klasë: %2d | Viso klasëje: %2d | Iteracijos laikas: %2.4f sek. | Bendras laikas: %2.2f sek. |\n', amberNr, class, Amber(class).sum, tInerElapsed, tMainElapsed);
                fprintf(fileID,'| Gintaras nr.: %2d | Klasë: %2d | Viso klasëje: %2d | Iteracijos laikas: %2.4f sek. | Bendras laikas: %2.2f sek. |\n', amberNr, class, Amber(class).sum, tInerElapsed, tMainElapsed);
                fprintf(tmpLine);
                fprintf(fileID,tmpLine);
        %         flushdata(vid, 'all'); % pasalina vaida is kameros
         else
            amberBadNr=amberBadNr+1;
            fprintf('| Gintaras nr.: %2d | Klasë: Bad | Viso klasëje: %2d | Iteracijos laikas: %2.4f sek. | Bendras laikas: %2.2f sek. |\n', amberNr, amberBadNr, tInerElapsed, tMainElapsed);
            fprintf(fileID,'| Gintaras nr.: %2d | Klasë: Bad | Viso klasëje: %2d | Iteracijos laikas: %2.4f sek. | Bendras laikas: %2.2f sek. |\n', amberNr, amberBadNr, tInerElapsed, tMainElapsed);
            fprintf(tmpLine);
            fprintf(fileID,tmpLine);
            imwrite(Image,sprintf('Gintaras_bad_%d.jpg',amberBadNr));
%              fwrite(s,100,'int8');
         end
         tMainElapsed = toc(tMain);

    end
    
%      Im=[]; % pasalina vaizda
    
%     tMainElapsed = toc(tMain);
    fclose(fileID);
% end

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


