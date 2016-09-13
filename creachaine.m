%Fonction de création de la chaine de caractère et d'affichage du message
function creachaine(messagerecup,taillemessage)
k=1;
u=bin2dec(messagerecup(1:8)); %Conversion d'un caractère récupérér en cellule
while k<taillemessage% Concatenation des cellules
    a=k*8+1;
    b=a+7;
    v=bin2dec(messagerecup(a:b));
    u=[u;v];
    k=k+1;
end
u=u';
%Récupération des clefs RSA
prompt = {'Entrer l''element n de la cle privée','Entrer l''element d de la cle privée'};
dlg_title = 'Dechiffrage RSA';
N=30;
definitions = {'Saisir n','Saisir d'};
reponse = inputdlg(prompt,dlg_title,[1, length(dlg_title)+N],definitions);
clefpublique=str2num(reponse{1});
d=str2num(reponse{2});
messagedechiffre=dechiffrementrsa(u,clefpublique,taillemessage,d); 
%Affichage du message
prompt = {'Affichage du message decodé'};
dlg_title = 'Dechiffrage RSA';
N=60;
tmp=length('Affichage du message decodé');
if length(messagedechiffre)>tmp
    tmp=length(messagedechiffre);
end
definitions = {messagedechiffre};
reponse = inputdlg(prompt,dlg_title,[1, length(tmp)+N],definitions);
end