function messageChar = trameBin2messageChar(trameBin)
    messageBin = reshape(trameBin,8,length(trameBin)/8)';  % On transforme la colonne en matrice 
    messageBin = num2str(messageBin,'%o');                 % Permet de transformée le message binaire en type char
    messageChar = char(bin2dec(messageBin))';              % On transforme le message binnaire en ascii
end