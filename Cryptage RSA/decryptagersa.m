function dechiffrage = decryptagersa(chiffrage,clefpublique,taillem,d)
% Decryptage du code ASCII
message=decryptage(chiffrage,clefpublique,taillem,d);

%Affichage du code ASCII et le message recomposé 
disp('Message décrypté en code ASCII:');
disp(message);

message=char(message);
disp('Affichage du message réel:');
disp(message)
end

