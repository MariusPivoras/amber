function Image = PreprocessImage(Im)

%   Konvertavimas á grayscale erdvæ
    Image = rgb2gray(Im);
%   imshow(Image);
    
%   Ðeðëliø paðalinimas - Reikðmës nustatytos eksperimento bûdu
    Image = imadjust(Image,[0.2 0.5],[]);
%   imshow(Image);
   
%   Konvertavimas á binary erdvæ
    Image = imbinarize(Image);
%   imshow(Image);
    
%   Backgroud triukðmo paðalinimas (nebûtina, eksperimentavimas)
%   Image = bwareaopen(Image, 50);
%   imshow(Image);

%   Skyliø uþpildymas
    Image = imfill(1-Image, 'holes');
%   imshow(Image);

end