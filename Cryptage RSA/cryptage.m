function messagecrypte = cryptage(M,N,e)
u=de2bi(e);%Transformation de l'exposant de chiffrage en binaire
tmp=zeros(1,65535-length(u));%Création d'une ligne de zeros
e=[u tmp];%Ajout de l'exposant dans cette ligne de 0
k=65535; %Codage sur 16 bits
tmp=M;
cf=1;
cf=mod(tmp*cf,N);
%Calcul du chiffrement du message 
for i=k-1:-1:1
    tmp=mod(tmp*tmp,N);
    j=k-i+1;
     if e(j)==1
         cf=mod(tmp*cf,N);
     end
end
messagecrypte=cf;

