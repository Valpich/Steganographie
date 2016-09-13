clear all;
close all;
clc;

%% Fonction de chiffrement
matriceImagePorteuse = imread('imagePorteuse.jpg');                                   % Chargement de l'image porteuse en matrice 3D unit8
matriceImagePorteuseDouble = double(matriceImagePorteuse);                            % On convertit la matrice de la porteuse en double
vecteurImagePorteuse = matriceImagePorteuseDouble(:);                                 % On convertit la matrice de la porteuse en un vecteur COLONNE
vecteurImagePorteuseBin = de2bi(vecteurImagePorteuse);                                % On convertit le vecteur en binaire (ATTENTION : Le lsb est à gauche)

texteACacher = 'Ce texte est cache';                        % On définit un texte à cacher
texteACacherBin = dec2bin(texteACacher,8);                  % On convertit le texte à cacher en binaire
texteACacherBin = texteACacherBin - '0';                    % On convertit char en double
texteACacherBin = texteACacherBin';                         % On prend la matrice transposée
trameBin = texteACacherBin(:);                       % Convertit la matrice en colonne

tailleTrameBin = length(trameBin);
tailleTrameBinBin = de2bi(tailleTrameBin,8*4,'left-msb')';     % Taille max : 536 Mo

vecteurOnes = zeros(length(vecteurImagePorteuseBin)-length(trameBin)-length(tailleTrameBinBin),1);  % On crée un vecteur de zéros de taille tailleDuVecteurImagePorteuseBin - tailleDuTexteACacher
trameBin = [tailleTrameBinBin;trameBin;vecteurOnes];                                    % On concatène les deux vecteurs colonnes de façon à avoir la même taille qu'un vecteur colonne de l'image porteuse
vecteurImagePorteuseBin(:,1) = trameBin;                                                    % On remplace le LSB de l'image porteuse par notre texte en binaire
vecteurImagePorteuseModifiee = bi2de(vecteurImagePorteuseBin);                              % On convertit en le vecteur binaire en décimal

matriceImageFinaleDouble = reshape(vecteurImagePorteuseModifiee,size(matriceImagePorteuseDouble));      % On convertit le vecteur de l'image modifié en latrice RGB
matriceImageFinale = uint8(matriceImageFinaleDouble);                                                   % On convertit la matrice de l'image modifié en uint8   
imwrite(matriceImageFinale,'texteCache.bmp','bmp');                                                     % On enregistre l'image en BMP
