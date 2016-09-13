message=dec2bin('La st�ganographie est l art de la dissimulation : son objet est de faire passer inaper�u un message dans un autre message. Elle se distingue de la cryptographie, � art du secret �, qui cherche � rendre un message inintelligible � autre que qui-de-droit. Pour prendre une m�taphore, la st�ganographie consisterait � enterrer son argent dans son jardin l� o� la cryptographie consisterait � l enfermer dans un coffre-fort ? cela dit, rien n emp�che de combiner les deux techniques, de m�me que l on peut enterrer un coffre dans son jardin.',8); %Transformation du message en binaire
message=message-'0'; %Convertion char en double
taillem=length(message)*8; %Taille du message en bits
taillembin=de2bi(taillem,16);
taillembin=taillembin';
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
vide=randi([0,1],height*width-taillem-16,1); %Cr�ation d'une colonne vide
test=[taillembin;message;vide]; %Concat�nation du message et de la colonne vide
image(:,[1])=test; %Remplacement du LSB par la colonne avec le message
image=num2str(image,8); %Transofmration de l'image en chaine de caract�re
image(isspace(image)) = ''; %Supression des espaces dans l'image
image=fliplr(reshape(image,height*width,8)); %Inversion du sens des bits et transformation sous forme originale
image=bin2dec(image); %Conversion des nombres binaire en d�cimaux
image=reshape(image,height,width); %Recration de la composante rouge
rgbmessage = uint8(cat(3, image, v, b)); %Recr�ation de l'image
imshow(rgbmessage); %Affichage de l'image crypt�e
imwrite(rgbmessage,'LGCRYPTE.bmp'); %Enregistrement de l'image