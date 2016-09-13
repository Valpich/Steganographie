clear all;
close all;
clc;

%% Fonction de chiffrement
matriceImagePorteuse = imread('imagePorteuse.jpg');                                   % Chargement de l'image porteuse en matrice 3D unit8
matriceImagePorteuseDouble = double(matriceImagePorteuse);                            % On convertit la matrice de la porteuse en double
vecteurImagePorteuse = matriceImagePorteuseDouble(:);                                 % On convertit la matrice de la porteuse en un vecteur COLONNE
vecteurImagePorteuseBin = de2bi(vecteurImagePorteuse);                                % On convertit le vecteur en binaire (ATTENTION : Le lsb est � gauche)

texteACacher = 'Ce texte est cache';                        % On d�finit un texte � cacher
texteACacherBin = dec2bin(texteACacher,8);                  % On convertit le texte � cacher en binaire
texteACacherBin = texteACacherBin - '0';                    % On convertit char en double
texteACacherBin = texteACacherBin';                         % On prend la matrice transpos�e
trameBin = texteACacherBin(:);                       % Convertit la matrice en colonne

tailleTrameBin = length(trameBin);
tailleTrameBinBin = de2bi(tailleTrameBin,8*4,'left-msb')';     % Taille max : 536 Mo

vecteurOnes = zeros(length(vecteurImagePorteuseBin)-length(trameBin)-length(tailleTrameBinBin),1);  % On cr�e un vecteur de z�ros de taille tailleDuVecteurImagePorteuseBin - tailleDuTexteACacher
trameBin = [tailleTrameBinBin;trameBin;vecteurOnes];                                    % On concat�ne les deux vecteurs colonnes de fa�on � avoir la m�me taille qu'un vecteur colonne de l'image porteuse
vecteurImagePorteuseBin(:,1) = trameBin;                                                    % On remplace le LSB de l'image porteuse par notre texte en binaire
vecteurImagePorteuseModifiee = bi2de(vecteurImagePorteuseBin);                              % On convertit en le vecteur binaire en d�cimal

matriceImageFinaleDouble = reshape(vecteurImagePorteuseModifiee,size(matriceImagePorteuseDouble));      % On convertit le vecteur de l'image modifi� en latrice RGB
matriceImageFinale = uint8(matriceImageFinaleDouble);                                                   % On convertit la matrice de l'image modifi� en uint8   
imwrite(matriceImageFinale,'texteCache.bmp','bmp');                                                     % On enregistre l'image en BMP
