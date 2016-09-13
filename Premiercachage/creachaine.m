function creachaine(messagerecup,max)
k=1;
u=cellstr(char(bin2dec(messagerecup(1:8)))); %Conversion d'un caractère récupérér en cellule
while k<(max+1)% Concatenation des cellules
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
u %Affichage du message
end