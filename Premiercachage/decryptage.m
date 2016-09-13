rgb=imread('LGCRYPTE.bmp'); %Lecture de l'image cryptée
r = double(rgb(:,:,1)); %Récupération du rouge
v = double(rgb(:,:,2)); %Récupération du vert
b = double(rgb(:,:,3)); %Récupération du bleu
rbin = de2bi(r);%Transformation des valeurs de rouge décimales en binair
height=size(r,1); %Hauteur de rougge
width=size(r,2); %Largeur de rouge
image=reshape(rbin,height*width,8); %Transformation de l'image sous forme d'une matrice d'octets
messagerecup=image(:,[1]);%Récupération de la dernière colonne contenant le message
messagerecup=reshape(messagerecup,height*width/8,8); %Retour à la taille originale de l'image 
messagerecup=num2str(messagerecup,8); %Transformation des octctets en nombres
messagerecup(isspace(messagerecup)) = '';%Suppression des espaces
creachaine(messagerecup,13); %Création de la chaine de caractère