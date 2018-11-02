%------------------------------------------------------
%Gintarø rûğiavimas
%Modifikuota: 2018-11-02
%Gintaro nuotraukos apdorojimas sàvybiø iğgavimui
%------------------------------------------------------
function class= checkSize(Amber, Area,classNr)
    for i=1:1:classNr
        if Area>Amber(i).area(1)&& Area<Amber(i).area(2)
            class=i;
        end
    end
end