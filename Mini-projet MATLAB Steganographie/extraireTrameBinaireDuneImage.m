function trameBinaire = extraireTrameBinaireDuneImage(pathImagePorteuse)

    matriceImagePorteuse = imread(pathImagePorteuse,'bmp');         % Chargement de l'image porteuse en matrice 3D unit8
    matriceImagePorteuseDouble = double(matriceImagePorteuse);      % On convertit la matrice de la porteuse en double
    vecteurImagePorteuse = matriceImagePorteuseDouble(:);           % On convertit la matrice de la porteuse en un vecteur COLONNE
    vecteurImagePorteuseBin = de2bi(vecteurImagePorteuse);          % On convertit le vecteur en binaire (ATTENTION : Le lsb est � gauche)

    trameBinaireTotale = vecteurImagePorteuseBin(:,1);              % On r�cup�re la colonne LSB l� o� le message est cach�

    tailleTrameBinBin = trameBinaireTotale(1:32);                   % On r�cup�re la taille de la trame binaire que l'on veut extraire (qui est elle m�me en binaire)
    tailleTrameBin = bi2de(tailleTrameBinBin','left-msb');          % On convertit cette taille en d�cimal

    trameBinaire = trameBinaireTotale(33:tailleTrameBin+32);        % La trame binaire que l'on veut extraire se situe donc entre l'info de la taille de cette trame et la taille + 32 puisque celle-ci est cod� sur 32 Bits 
end