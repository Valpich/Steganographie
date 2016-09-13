message=dec2bin('Message cache',8); %Transformation du message en binaire
message=message-'0'; %Convertion char en double
taillem=length(message)*8; %Taille du message en bits 
message=message'; %Transpos� du message 
message=message(:); %Conversion de la matrice en vecteur
rgb=imread('LG2.jpg'); %Lecture de l'image
r = double(rgb(:,:,1)); %R�cup�ration du rouge
v = double(rgb(:,:,2)); %R�cup�ration du vert
b = double(rgb(:,:,3)); %R�cup�ration du bleu
rbin = de2bi(r); %Transformation des valeurs de rouge d�cimales en binaire
height=size(r,1); %Hauteur de rougge
width=size(r,2); %Largeur de rouge
image=reshape(rbin,height*width,8); %Transformation de l'image sous forme d'une matrice d'octets
vide=zeros(height*width-taillem,1); %Cr�ation d'une colonne vide
test=[message;vide]; %Concat�nation du message et de la colonne vide
image(:,[1])=test; %Remplacement du LSB par la colonne avec le message
image=num2str(image,8); %Transofmration de l'image en chaine de caract�re
image(isspace(image)) = ''; %Supression des espaces dans l'image
image=fliplr(reshape(image,height*width,8)); %Inversion du sens des bits et transformation sous forme originale
image=bin2dec(image); %Conversion des nombres binaire en d�cimaux
image=reshape(image,height,width); %Recration de la composante rouge
rgbmessage = uint8(cat(3, image, v, b)); %Recr�ation de l'image
imshow(rgbmessage); %Affichage de l'image crypt�e
imwrite(rgbmessage,'LGCRYPTE.bmp') %Enregistrement de l'image
