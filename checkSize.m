%------------------------------------------------------
%Gintar� r��iavimas
%Modifikuota: 2018-11-02
%Gintaro nuotraukos apdorojimas s�vybi� i�gavimui
%------------------------------------------------------
function class= checkSize(Amber, Area,classNr)
    for i=1:1:classNr
        if Area>Amber(i).area(1)&& Area<Amber(i).area(2)
            class=i;
        end
    end
end