%------------------------------------------------------
%Gintar� r��iavimas
%Modifikuota: 2018-10-16
%Gintaro nuotraukos apdorojimas s�vybi� i�gavimui
%------------------------------------------------------
function Image = PreprocessImage(Im)

%   Im=imread('C:\Users\Marius\Desktop\Magistrinis_darbas\MatLab\Gintaru_foto\Image.1.1.21.jpg');
%   Konvertavimas � grayscale erdv�
    Image = rgb2gray(Im);
%   imshow(Image);
    
%   Prid�ti erosion ����li� panaikinimui (!!!!!!!!?)
    Image = imadjust(Image,[0.4 1],[]);
%   imshow(Image);
   
%   Konvertavimas � binary erdv�
    Image = imbinarize(Image);
%   imshow(Image);
    

%   Skyli� u�pildymas
    Image = imfill(1-Image, 'holes');
%   imshow(Image);
    
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
    
    stats = regionprops(Image,'orientation');
    Image = imrotate(Image, -stats.Orientation);
%     f2 = figure(2);
%     set(f2,'position',[screensize(3)/2 0 screensize(3) screensize(4)])
%     imshow(Image)
end