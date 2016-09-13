function trameBin = messageChar2TrameBin(message)

    trameBin = dec2bin(message,8);   % On convertit le texte à cacher en binaire
    trameBin = trameBin - '0';       % On convertit char en double
    trameBin = trameBin';            % On prend la matrice transposée
    trameBin = trameBin(:);          % Convertit la matrice en colonne
end