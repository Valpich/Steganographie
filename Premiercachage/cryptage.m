message=dec2bin('Message cache',8); %Transformation du message en binaire
message=message-'0'; %Convertion char en double
taillem=length(message)*8; %Taille du message en bits 
message=message'; %Transposé du message 
message=message(:); %Conversion de la matrice en vecteur
rgb=imread('LG2.jpg'); %Lecture de l'image
r = double(rgb(:,:,1)); %Récupération du rouge
v = double(rgb(:,:,2)); %Récupération du vert
b = double(rgb(:,:,3)); %Récupération du bleu
rbin = de2bi(r); %Transformation des valeurs de rouge décimales en binaire
height=size(r,1); %Hauteur de rougge
width=size(r,2); %Largeur de rouge
image=reshape(rbin,height*width,8); %Transformation de l'image sous forme d'une matrice d'octets
vide=zeros(height*width-taillem,1); %Création d'une colonne vide
test=[message;vide]; %Concaténation du message et de la colonne vide
image(:,[1])=test; %Remplacement du LSB par la colonne avec le message
image=num2str(image,8); %Transofmration de l'image en chaine de caractère
image(isspace(image)) = ''; %Supression des espaces dans l'image
image=fliplr(reshape(image,height*width,8)); %Inversion du sens des bits et transformation sous forme originale
image=bin2dec(image); %Conversion des nombres binaire en décimaux
image=reshape(image,height,width); %Recration de la composante rouge
rgbmessage = uint8(cat(3, image, v, b)); %Recréation de l'image
imshow(rgbmessage); %Affichage de l'image cryptée
imwrite(rgbmessage,'LGCRYPTE.bmp') %Enregistrement de l'image
