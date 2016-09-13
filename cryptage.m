%Script de cryptage
clc;
clear all;
close all;

[messagechiffrepret,clefpublique,phi,e,d] = chiffragersa();%Chiffrage RSA du message
message=dec2bin(messagechiffrepret,8); %Transformation du message en binaire
message=message-'0'; %Convertion char en double
taillem=length(message)*8; %Taille du message en bits
taillembin=de2bi(taillem,16);%Codage de la taille sur 16 bits
taillembin=taillembin';
taillembin=reshape(taillembin,8,2);
taillemun=taillembin(:,[1]);%Division en deux de la taille à cacher
taillemdeux=taillembin(:,[2]);%Suite
message=message'; %Transposé du message 
message=message(:); %Conversion de la matrice en vecteur
[fileName,path] = uigetfile({'*.jpg';'*.bmp'},'Choisir une image porteuse');%Affichage de la fenetre de récupération de l'image
pathImagePorteuse = strcat(path,fileName);%Récupération de l'image dans matlab
rgb=imread(pathImagePorteuse); %Lecture de l'image
r = double(rgb(:,:,1)); %Récupération du rouge
v = double(rgb(:,:,2)); %Récupération du vert
b = double(rgb(:,:,3)); %Récupération du bleu
rbin = de2bi(r); %Transformation des valeurs de rouge décimales en binaire
vbin = de2bi(v); %Transformation des valeurs de vert décimales en binaire
bbin = de2bi(b); %Transformation des valeurs de bleu décimales en binaire
height=size(r,1); %Hauteur de l'image
width=size(r,2); %Largeur de l'image
imager=reshape(rbin,height*width,8); %Transformation de l'image rouge sous forme d'une matrice d'octets
imagev=reshape(vbin,height*width,8); %Transformation de l'image sous forme d'une matrice d'octets
imageb=reshape(bbin,height*width,8); %Transformation de l'image sous forme d'une matrice d'octets

%Récuperation des clefs hexadécimales
prompt = {'Entrer la clé hexa N°1 :','Entrer la clé hexa N°2 :','Entrer la clé hexa N°3 :'};
dlg_title = 'Saisie des clés hexadécimales';
N=22;
definitions = {'Saisir ici','Saisir ici','Saisir ici'};
reponse=inputdlg(prompt,dlg_title,[1, length(dlg_title)+N],definitions);

videm1=randi([0,1],hex2dec(reponse{1}),1); %Création d'une colonne aléatoire pour cacher le debut du message
videm2=randi([0,1],height*width-taillem-hex2dec(reponse{1}),1); %Création d'une colonne aléatoire pour finir de cacher le message
testr=[videm1;message;videm2]; %Concaténation du message et de la colonne vide
imager(:,[1])=testr; %Remplacement du LSB par la colonne avec le message
imager=num2str(imager,8); %Transformation de l'image en chaine de caractère
imager(isspace(imager)) = ''; %Supression des espaces dans l'image
imager=fliplr(reshape(imager,height*width,8)); %Inversion du sens des bits et transformation sous forme originale
imager=bin2dec(imager); %Conversion des nombres binaire en décimaux
imager=reshape(imager,height,width); %Recration de la composante rouge

videlongb1=randi([0,1],hex2dec(reponse{3}),1); %Création d'une colonne aléatoire pour cacher le début de la cle partie 2
videlongb2=randi([0,1],height*width-8-hex2dec(reponse{3}),1); %Création d'une colonne aléatoire pour cacher la fin de la cle partie 2
testb=[videlongb1;taillemun;videlongb2]; %Concaténation du message et de la colonne vide
imageb(:,[1])=testb; %Remplacement du LSB par la colonne avec le message
imageb=num2str(imageb,8); %Transformation de l'image en chaine de caractère
imageb(isspace(imageb)) = ''; %Supression des espaces dans l'image
imageb=fliplr(reshape(imageb,height*width,8)); %Inversion du sens des bits et transformation sous forme originale
imageb=bin2dec(imageb); %Conversion des nombres binaire en décimaux
imageb=reshape(imageb,height,width); %Recration de la composante bleu

videlongv1=randi([0,1],hex2dec(reponse{2}),1); %Création d'une colonne aléatoire pour cacher le debut de la cle partie 1
videlongv2=randi([0,1],height*width-8-hex2dec(reponse{2}),1); %Création d'une colonne aléatoire pour cacher la fin de la cle partie 1
testv=[videlongv1;taillemdeux;videlongv2]; %Concaténation du message et de la colonne vide
imagev(:,[1])=testv; %Remplacement du LSB par la colonne avec le message
imagev=num2str(imagev,8); %Transformation de l'image en chaine de caractère
imagev(isspace(imagev)) = ''; %Supression des espaces dans l'image
imagev=fliplr(reshape(imagev,height*width,8)); %Inversion du sens des bits et transformation sous forme originale
imagev=bin2dec(imagev); %Conversion des nombres binaire en décimaux
imagev=reshape(imagev,height,width); %Recration de la composante verte

rgbmessage = uint8(cat(3, imager, imagev, imageb)); %Recréation de l'image
%Choix du nom de l'image à sauvegarder
prompt = {'Choisir le nom de l''image'};
dlg_title = 'Choix du nom de l''image cryptee';
N=22;
definitions = {'Saisie du nom finissant par .bmp'};
reponse = inputdlg(prompt,dlg_title,[1, length(dlg_title)+N],definitions);
writefile = fullfile(path,reponse{1});
imwrite(rgbmessage,writefile,'bmp'); %Enregistrement de l'image