function yp=unforced_damped(t,y)
c=10;
F=0;
m=1;
wn=10;
k=500;
yp=[y(2);((-10*F)*y(2)-(500)*y(1))];