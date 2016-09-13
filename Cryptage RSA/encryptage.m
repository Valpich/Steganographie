function chiffrage=encryptage(clepublique,e,taillem,c)
for j= 1:taillem
   chiffrage(j)= cryptage(c(j),clepublique,e); 
end
disp('Texte chiffré par RSA en ASCII :');
disp(chiffrage);
end

