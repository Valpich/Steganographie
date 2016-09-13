
function trameBin = fileBin2trameBin(pathFileBin)
    fileID = fopen(pathFileBin,'r');            % On ouvre le fichier binaire
    vecteurFichier = fread(fileID);             % On récupère le vecteur du fichier
    fclose(fileID);                             % On ferme le fichier puisqu'on en a plus besoin

    vecteurFichierBin = de2bi(vecteurFichier);     % On convertit le vecteur du fichier en binaire
    vecteurFichierBin = vecteurFichierBin';        % On transpose la matrice binaire
    trameBin = vecteurFichierBin(:);               % On convertit la matrice binaire en vecteur colonne
end

