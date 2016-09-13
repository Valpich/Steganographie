function [clefpublique,Phi,e,d] = creerclef(p,q)
clc;
%Calcul de la cle publique
clefpublique=p*q;
%Calcul de l'indicateur d'Euler
Phi=(p-1)*(q-1);
%Calcul de l'exposant de chiffremenent (e)
x=2;
e=1;
while x > 1
    e=e+1;
    x=gcd(Phi,e); %PGCD 
end
%Calcul de l'exposant de déchiffrement (d) par l'algorithme d'Euclide
i=1;
r=1;
while r > 0
    k=(Phi*i)+1;
    r=rem(k,e); %Reste de la division euclidienne
    i=i+1;
end
d=k/e;
clc;




