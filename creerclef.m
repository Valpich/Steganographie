function [clefpublique,Phi,e,d] = creerclef(p,q)
clc;
%Calcul de la cle publique
clefpublique=p*q;
%Calcul de l'indicateur d'Euler
Phi=(p-1)*(q-1);
%Choix de l'exposant de chiffrement
e=59;
%Calcul de l'exposant de déchiffrement (d) par l'algorithme d'Euclide
d=1;
true=1;
while true==1
    if mod(d*e,Phi)==1
        true=0
    else
        d=d+1;
    end
end
clc;




