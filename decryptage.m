%Script de décryptage
clc;
clear all;
close all;

[fileName,path] = uigetfile({'*.bmp';'*.jpg'},'Choisir une image à decrypter');%Affichage de la fenetre de récupération de l'image
pathImageDecrypte = strcat(path,fileName);%Récupération de l'image dans matlab
rgb=imread(pathImageDecrypte); %Lecture de l'image cryptée
r = double(rgb(:,:,1)); %Récupération du rouge
v = double(rgb(:,:,2)); %Récupération du vert
b = double(rgb(:,:,3)); %Récupération du bleu
rbin = de2bi(r); %Transformation des valeurs de rouge décimales en binaire
vbin = de2bi(v); %Transformation des valeurs de vert décimales en binaire
bbin = de2bi(b); %Transformation des valeurs de bleu décimales en binaire
height=size(r,1); %Hauteur de l'image
width=size(r,2); %Largeur de l'image

%Affichage de la fenetre de dialogue pour récuperer les clefs
prompt = {'Entrer la clé hexa N°1 :','Entrer la clé hexa N°2 :','Entrer la clé hexa N°3 :'};
dlg_title = 'Saisie des clés hexadécimales';
N=22;
definitions = {'Saisir ici','Saisir ici','Saisir ici'};
reponse = inputdlg(prompt,dlg_title,[1, length(dlg_title)+N],definitions);

imageb=reshape(bbin,height*width,8); %Transformation de l'image sous forme d'une matrice d'octets
cleunrecup=imageb([hex2dec(reponse{3})+1:hex2dec(reponse{3})+8],[1]);%Récupération de la dernière colonne contenant le message

imagev=reshape(vbin,height*width,8); %Transformation de l'image sous forme d'une matrice d'octets
cledeuxrecup=imagev([hex2dec(reponse{2})+1:hex2dec(reponse{2})+8],[1]);%Récupération de la dernière colonne contenant le message

%Obtention de la taille du message
taillemessage=[cleunrecup;cledeuxrecup];
taillemessage=taillemessage';
taillemessage=num2str(taillemessage);
taillemessage(isspace(taillemessage)) = '';
taillemessage=fliplr(taillemessage);
taillemessage=bin2dec(taillemessage);
taillemessageoctet=int32(taillemessage/8);
taillemessageoctet=double(taillemessageoctet);

imager=reshape(rbin,height*width,8); %Transformation de l'image sous forme d'une matrice d'octets
messagerecup=imager([(hex2dec(reponse{1})+1):(hex2dec(reponse{1})+8*taillemessageoctet)],[1]);%Récupération de la dernière colonne contenant le message
messagerecup=reshape(messagerecup,taillemessageoctet,8); %Retour à la taille originale de l'image
messagerecup=num2str(messagerecup,8); %Transformation des octctets en nombres
messagerecup(isspace(messagerecup)) = '';%Suppression des espaces

creachaine(messagerecup,taillemessageoctet); %Création de la chaine de caractère