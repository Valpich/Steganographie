
function trameBin2fileBin(trameBin, pathFileBin)
    vecteurFichierBin = reshape(trameBin, 8, length(trameBin)/8)';  % On convertit la trame binaire en vecteur binaire
    vecteurFichier  = bi2de(vecteurFichierBin);                     % On convertit le vecteur du fichier binaire en décimal
    
    fileID = fopen(pathFileBin,'w+');    % On ouvre le fichier binaire
    fwrite(fileID,vecteurFichier);       % On écrit le vecteur dans le fichier            
    fclose(fileID);                      % On referme le fichier
end