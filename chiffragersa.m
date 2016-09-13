%Fonction permettant de chiffrer en RSA le message
function [messagechiffrepret,clefpublique,phi,e,d] = chiffragersa()
%Affichage de la fenetre de dialogue pour r�cup�rer les deux nombres
%premiers
prompt = {'Entrer le premier nombre premier p : ','Entrer le second nombre premier q : '};
dlg_title = 'Chiffrage RSA';
num_lignes = 1;
definitions = {'Saisir p nombre premier','Saisir q nombre premier'};
options.Resize='on';
options.WindowStyle='normal';
options.Interpreter='tex';
reponsetexte = inputdlg(prompt,dlg_title,num_lignes,definitions,options);
p = str2num(reponsetexte{1});%R�cup�ration de p sous forme d'un nombre
q = str2num(reponsetexte{2});%R�cup�ration de q sous forme d'un nombre

%Cr�ation des clefs et affichage
[clefpublique,phi,e,d] = creerclef(p,q);
prompt = {'Affichage du nombre n pour les couples: ','Affichage de e pour la clef publique','Affichage de d pour la cle priv�e'};
dlg_title = 'Clefs RSA';
num_lignes = 1;
charpub=num2str(clefpublique);
chare=num2str(e);
chard=num2str(d);
definitions = {charpub,chare,chard};
inputdlg(prompt,dlg_title,num_lignes,definitions,options);

%Saisie du texte � crypter
dlg_title = 'Saisie du texte � chacher';
prompt = {'Entrer le texte � crypter: '};
num_lignes = 4;
definitions = {'Taper le texte'};
reponsetexte = inputdlg(prompt,dlg_title,[2,100],definitions,options);
M = reponsetexte{1};
taillem=length(M);%R�cuperation de la taille du message
%Creation du message en code ASCII
codeascii=0;
for j=1:taillem
    for i=0:255
        if strcmp(M(j),char(i))
            codeascii(j)=i;
        end
    end
end
%Chiffrage du message
messagechiffrepret=chiffrage(clefpublique,e,taillem,codeascii);
end

