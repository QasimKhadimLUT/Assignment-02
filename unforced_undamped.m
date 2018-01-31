function yp=unforced_undamped(t,y)
c=0;
F=0;
m=1;
wn=10;
k=500;
yp=[y(2);(-500*y(1))];