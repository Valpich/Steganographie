clear all;
close all;
clc;

%% Fonction de déchiffrement
matriceImagePorteuse = imread('texteCache.bmp','bmp');                              % Chargement de l'image porteuse en matrice 3D unit8
matriceImagePorteuseDouble = double(matriceImagePorteuse);                             % On convertit la matrice de la porteuse en double
vecteurImagePorteuse = matriceImagePorteuseDouble(:);                                % On convertit la matrice de la porteuse en un vecteur COLONNE
vecteurImagePorteuseBin = de2bi(vecteurImagePorteuse);                                % On convertit le vecteur en binaire (ATTENTION : Le lsb est à gauche)

trameBin = vecteurImagePorteuseBin(:,1);                           % On récupère la colonne LSB là où le message est caché

tailleTrameBinBin = trameBin(1:32);
tailleTrameBin = bi2de(tailleTrameBinBin','left-msb');

messageBin = trameBin(33:tailleTrameBin+32);
messageBin = reshape(messageBin,8,length(messageBin)/8);     % On transforme la colonne en matrice 
messageBin = messageBin';                                        % On prend la matrice transposée (on a donc une matrice de 8 colonnes)
messageBin = num2str(messageBin,'%o');                           % Permet de transformée le message binaire en type char

messageDechiffre = char(bin2dec(messageBin))'                       % On transforme le message binnaire en ascii
