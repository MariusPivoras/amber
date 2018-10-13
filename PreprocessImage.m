function Image = PreprocessImage(Im)

%   Image=imread('C:\Users\Marius\Desktop\Magistrinis_darbas\MatLab\Gintaru_foto\Image.1.1.84.jpg');
%   Konvertavimas á grayscale erdvæ
    Image = rgb2gray(Im);
%   imshow(Image);
    
%   Kontrasto padidinimas, atsispindinèiø objektø formos iðgavimui !!!!!!!!!(gali tekti koreguoti) 

%   Pridëti erosion ðëðëliø panaikinimui (!!!!!!!!?)
    Image = imadjust(Image,[0.6 1],[]);
%   imshow(Image);
   
%   Konvertavimas á binary erdvæ
    Image = imbinarize(Image);
%   imshow(Image);
    

%   Skyliø uþpildymas
    Image = imfill(1-Image, 'holes');
%   imshow(Image);
    
%   Backgroud triukðmo paðalinimas (svarbu objektams su atspindþiais)    
    Image = bwareaopen(Image, 250); %(removes all connected components (objects) that have fewer than P pixels from the binary image)
%   imshow(Image);

%   Erosion
    se = strel('disk',7,6);
    Image = imerode(Image,se);
end