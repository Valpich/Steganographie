%x=[-1:0.1:1];
%y=x.^2
%yprime=a.^2.*sin(x).*exp(-x)
%plot(x,y,'r-',x,yprime,'g-')

%t=[0:0.01:10*pi];
%x=cos(3*t);y=sin(2*t);z=t;
%plot3(x,y,z,'b')
%axis([-1 1 -1 1 -1 1],'equal')

x=-5:0.1:5;
y=-5:0.1:5;
[x,y] = meshgrid(-5:.1:5, -5:.1:5);
double z=sin(sqrt((x.^2)+(y.^2)+1))/sqrt((x.^2)+(y.^2)+1))
surf(x,y,z)

