%------------------------------------------------------
%Gintar� r��iavimas
%Modifikuota: 2018-11-02
%Gintaro nuotraukos apdorojimas s�vybi� i�gavimui
%------------------------------------------------------
function [Image, Skip]= PreprocessImage(Im)
    Skip=0;
%   Im=imread('C:\Users\Marius\Desktop\Magistrinis_darbas\MatLab\Gintaru_foto\Image.1.1.85.jpg');
%   Konvertavimas � grayscale erdv�
    Image = rgb2gray(Im);
%     imshow(Image);
    
%   Prid�ti erosion ����li� panaikinimui (!!!!!!!!?)
    Image = imadjust(Image,[0.46 1],[]);
%   imshow(Image);
%   pause
%   Konvertavimas � binary erdv�
    Image = imbinarize(Image);
%   imshow(Image);
%   pause

%   Skyli� u�pildymas
    Image = imfill(1-Image, 'holes');
%   imshow(Image);
%   pause
%   Backgroud triuk�mo pa�alinimas (svarbu objektams su atspind�iais)    
    Image = bwareaopen(Image, 250); %(removes all connected components (objects) that have fewer than P pixels from the binary image)
%   imshow(Image);

%   Erosion
    se = strel('disk',7,6);
    Image = imerode(Image,se);
%   Pasukimas pagal major axis
%     f1 = figure(1);
%     screensize = get( groot, 'Screensize' );
%     set(f1,'position',[-screensize(3)/2 0 screensize(3) screensize(4)])
%     imshow(Image);
    [L,Num] = bwlabel(Image);
    if Num == 1
        stats = regionprops(Image,'orientation');
        rotationAngle=stats.Orientation;
        Image = imrotate(Image, -rotationAngle);
    else
        Skip=1;
    end
%     f2 = figure(2);
%     set(f2,'position',[screensize(3)/2 0 screensize(3) screensize(4)])
%    imshow(Image)
end