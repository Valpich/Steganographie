function a = d2b(d)

i=1;

a=zeros(1,65535);

while d >= 2

    r=rem(d,2);

    if r==1

        a(i)=1;

    else

        a(i)=0;

    end

    i=i+1;

    d=floor(d/2);

end

if d == 2

    a(i) = 0;

else

    a(i) = 1;

end


