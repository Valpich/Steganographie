rgb=imread('LGCRYPTE.bmp'); %Lecture de l'image crypt�e
r = double(rgb(:,:,1)); %R�cup�ration du rouge
v = double(rgb(:,:,2)); %R�cup�ration du vert
b = double(rgb(:,:,3)); %R�cup�ration du bleu
rbin = de2bi(r);%Transformation des valeurs de rouge d�cimales en binair
height=size(r,1); %Hauteur de rougge
width=size(r,2); %Largeur de rouge
image=reshape(rbin,height*width,8); %Transformation de l'image sous forme d'une matrice d'octets
messagerecup=image(:,[1]);%R�cup�ration de la derni�re colonne contenant le message
messagerecup=reshape(messagerecup,height*width/8,8); %Retour � la taille originale de l'image 
messagerecup=num2str(messagerecup,8); %Transformation des octctets en nombres
messagerecup(isspace(messagerecup)) = '';%Suppression des espaces
creachaine(messagerecup,13); %Cr�ation de la chaine de caract�re