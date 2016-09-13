
function dissimulerTrameBinaireDansImage(pathImagePorteuse, trameBinaire, pathImageModifiee)
      
    matriceImagePorteuse = imread(pathImagePorteuse);              % Chargement de l'image porteuse en matrice 3D unit8
    matriceImagePorteuseDouble = double(matriceImagePorteuse);     % On convertit la matrice de la porteuse en double
    vecteurImagePorteuse = matriceImagePorteuseDouble(:);          % On convertit la matrice de la porteuse en un vecteur COLONNE
    vecteurImagePorteuseBin = de2bi(vecteurImagePorteuse);         % On convertit le vecteur en binaire (ATTENTION : Le lsb est à gauche)
  
    tailleTrameBin = length(trameBinaire);                             % On calcule la taille de la trame que l'on veut dissimuler
    tailleTrameBinBin = de2bi(tailleTrameBin,8*4,'left-msb')';     % On convertit cette taille en binaire (Taille max : 536 Mo)
    
    vecteurOnes = ones(length(vecteurImagePorteuseBin)-length(trameBinaire)-length(tailleTrameBinBin),1);  % On crée un vecteur de "ones" de taille tailleDuVecteurImagePorteuseBin - tailleDeLaTrameADissimuler - tailleDeLaTailleDeLaTrameACacher
    trameBinFinale = [tailleTrameBinBin;trameBinaire;vecteurOnes];                                         % On concatène les 3 vecteurs colonnes de façon à avoir la même taille qu'un vecteur colonne de l'image porteuse
    vecteurImagePorteuseBin(:,1) = trameBinFinale;                                                         % On remplace le LSB de l'image porteuse par notre trame en binaire
    vecteurImagePorteuseModifiee = bi2de(vecteurImagePorteuseBin);                                         % On convertit en le vecteur binaire en décimal

    matriceImageFinaleDouble = reshape(vecteurImagePorteuseModifiee,size(matriceImagePorteuseDouble));     % On convertit le vecteur de l'image modifié en latrice RGB
    matriceImageFinale = uint8(matriceImageFinaleDouble);                                                  % On convertit la matrice de l'image modifié en uint8   
    imwrite(matriceImageFinale,pathImageModifiee,'bmp');                                                   % On enregistre l'image en BMP
end


