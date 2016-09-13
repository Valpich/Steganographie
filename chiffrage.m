%Fonction de chiffrage du message
function chiffre=chiffrage(clepublique,e,taillem,c)
for j= 1:taillem
    chiffre(j)= chiffrement(c(j),clepublique,e);
end
end

