function Image = PreprocessImage(Im)

%   Image=imread('C:\Users\Marius\Desktop\Magistrinis_darbas\MatLab\Gintaru_foto\Image.1.1.84.jpg');
%   Konvertavimas � grayscale erdv�
    Image = rgb2gray(Im);
%   imshow(Image);
    
%   Kontrasto padidinimas, atsispindin�i� objekt� formos i�gavimui !!!!!!!!!(gali tekti koreguoti) 

%   Prid�ti erosion ����li� panaikinimui (!!!!!!!!?)
    Image = imadjust(Image,[0.6 1],[]);
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
end