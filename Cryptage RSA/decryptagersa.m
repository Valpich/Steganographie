function dechiffrage = decryptagersa(chiffrage,clefpublique,taillem,d)
% Decryptage du code ASCII
message=decryptage(chiffrage,clefpublique,taillem,d);

%Affichage du code ASCII et le message recompos� 
disp('Message d�crypt� en code ASCII:');
disp(message);

message=char(message);
disp('Affichage du message r�el:');
disp(message)
end

