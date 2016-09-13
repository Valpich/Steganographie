clc;
clear all; 
close all;
%Affichage de la fenetre de dialogue pour r�cup�rer les deux nombres
%premiers
prompt = {'Entrer le premier nombre premier p : ','Entrer le second nombre premier q : '};
dlg_title = 'Chiffrage RSA';
num_lignes = 1;
definitions = {'Saisir p','Saisir q'};
options.Resize='on';
options.WindowStyle='normal';
options.Interpreter='tex';
reponsetexte = inputdlg(prompt,dlg_title,num_lignes,definitions,options);
p = str2num(reponsetexte{1});%R�cup�ration de p sous forme d'un nombre
q = str2num(reponsetexte{2});%R�cup�ration de q sous forme d'un nombre

[clefpublique,phi,e,d] = creerclef(p,q);%Cr�ation des clefs 

prompt = {'Entrer le texte � crypter: '};
num_lignes = 1;
definitions = {'Taper le texte'};
reponsetexte = inputdlg(prompt,dlg_title,num_lignes,definitions,options);
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
%Affichage du code ASCII
disp('Code ASCII du message :');
disp(codeascii); 

% Encryptage du code ASCII
chiffrage=encryptage(clefpublique,e,taillem,codeascii);

% Decryptage du code ASCII
message=decryptage(chiffrage,clefpublique,taillem,d);

%Affichage du code ASCII et le message recompos� 
disp('Message d�crypt� en code ASCII:');
disp(message);

message=char(message);
disp('Affichage du message r�el:');
disp(message);


