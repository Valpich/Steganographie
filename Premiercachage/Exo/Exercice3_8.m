x=20;
n=0;
u=0;
while n<30&&((x.^n)/factorial(n))>0.0001
    u=u+(x.^n)/factorial(n);
    n=n+1;
end
if(((x.^n)/factorial(n))>0.0001)
    disp('Pas assez de termes !');
else
    u
end