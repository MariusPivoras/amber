function Image = PreprocessImage(Im)

%   Konvertavimas � grayscale erdv�
    Image = rgb2gray(Im);
%   imshow(Image);
    
%   �e��li� pa�alinimas - Reik�m�s nustatytos eksperimento b�du
    Image = imadjust(Image,[0.2 0.5],[]);
%   imshow(Image);
   
%   Konvertavimas � binary erdv�
    Image = imbinarize(Image);
%   imshow(Image);
    
%   Backgroud triuk�mo pa�alinimas (neb�tina, eksperimentavimas)
%   Image = bwareaopen(Image, 50);
%   imshow(Image);

%   Skyli� u�pildymas
    Image = imfill(1-Image, 'holes');
%   imshow(Image);

end