message=dec2bin('La stéganographie est l art de la dissimulation : son objet est de faire passer inaperçu un message dans un autre message. Elle se distingue de la cryptographie, « art du secret », qui cherche à rendre un message inintelligible à autre que qui-de-droit. Pour prendre une métaphore, la stéganographie consisterait à enterrer son argent dans son jardin là où la cryptographie consisterait à l enfermer dans un coffre-fort ? cela dit, rien n empêche de combiner les deux techniques, de même que l on peut enterrer un coffre dans son jardin.',8); %Transformation du message en binaire
message=message-'0'; %Convertion char en double
taillem=length(message)*8; %Taille du message en bits
taillembin=de2bi(taillem,16);
taillembin=taillembin';
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
vide=randi([0,1],height*width-taillem-16,1); %Création d'une colonne vide
test=[taillembin;message;vide]; %Concaténation du message et de la colonne vide
image(:,[1])=test; %Remplacement du LSB par la colonne avec le message
image=num2str(image,8); %Transofmration de l'image en chaine de caractère
image(isspace(image)) = ''; %Supression des espaces dans l'image
image=fliplr(reshape(image,height*width,8)); %Inversion du sens des bits et transformation sous forme originale
image=bin2dec(image); %Conversion des nombres binaire en décimaux
image=reshape(image,height,width); %Recration de la composante rouge
rgbmessage = uint8(cat(3, image, v, b)); %Recréation de l'image
imshow(rgbmessage); %Affichage de l'image cryptée
imwrite(rgbmessage,'LGCRYPTE.bmp'); %Enregistrement de l'image