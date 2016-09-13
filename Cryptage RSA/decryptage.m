function message=decryptage(chiffrage,clepublique,taillem,d)
for j= 1:taillem
   message(j)= cryptage(chiffrage(j),clepublique,d); 
end
end

