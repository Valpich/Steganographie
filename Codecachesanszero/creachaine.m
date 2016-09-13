function creachaine(messagerecup)
k=3;
alpha=messagerecup(1:16);
alphainv=fliplr(alpha);
max=bin2dec(alphainv);
u=cellstr(char(bin2dec(messagerecup(17:24)))); %Conversion d'un caractère récupérér en cellule
while k<(max/8+2)% Concatenation des cellules
    a=k*8+1;
    b=a+7;
    space=bin2dec(messagerecup(a:b));
    if(space==32) %Insertion des espaces
       v={' '};
    else
      v=cellstr(char(bin2dec(messagerecup(a:b))));
    end 
    u=strcat(u,v);
    k=k+1;
    end
disp(u{1}) %Affichage du message
end