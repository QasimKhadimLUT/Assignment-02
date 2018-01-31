 %%=========== FREE VIBRATION ======================================
 
 
tspan=0:0.0001:1;     %time span (seconds)
y0=[0.5;0];           %Initial conditions,first element defines the initial displacement and second one velocity.




% Exact solution 

syms p;
p=dsolve('D2x+500*x=0','Dx(0)=0','x(0)=0.5');
pretty(p);
v=0:0.0001:1; 
xn=double(subs(p,v));


%Plotting results
figure (1)
plot(v,xn)

% axis limit
axis([0 1 -0.6 0.6])


hold on
grid on 


%ODE45-ordinary differential equations45
[t,y]=ode45(@unforced_undamped,tspan,y0);

%Plotting results
figure (1)
plot(t,y(:,1),'b');


hold on;
grid on


%ODE23S-ordinary differential equations23s
[t,y]=ode23s(@unforced_undamped,tspan,y0);

%Plotting results
figure (1)
plot(t,y(:,1),'red -.');
hold on;
grid on


%ODE113-ordinary differential equations113
[t,y]=ode113(@unforced_undamped,tspan,y0);

%Plotting results
figure (1)
plot(t,y(:,1),'green -');

%Labelling axis
xlabel('time(sec)')
ylabel('displacement(m)')
title('FREE VIBRATIONS')
legend('Exact','ode45','ode23s','ode113')


%%  DAMPED VIBRATIONS




tspan=0:0.0001:1;     %time span (seconds)
y0=[0.5;0];           %Initial conditions,first element defines the initial displacement and second one velocity.


% Exact solution 

syms q;
q=dsolve('D2z+10*Dz+500*z=0','Dz(0)=0','z(0)=0.5');
pretty(q);
s=0:0.0001:1; 
zn=double(subs(q,s));


%Plotting results
figure (2)
plot(s,zn)

hold on
grid on


% axis limit
axis([0 1 -0.6 0.6])

%ODE45-ordinary differential equations45
[t,y]=ode45(@unforced_damped,tspan,y0);

%Plotting results
figure (2)
plot(t,y(:,1),'b');


hold on
grid on


%ODE23S-ordinary differential equations23s
[t,y]=ode23s(@unforced_damped,tspan,y0);

%Plotting results
figure (2)
plot(t,y(:,1),'red -.');


%ODE113-ordinary differential equations113
[t,y]=ode113(@unforced_damped,tspan,y0);
figure (2)
plot(t,y(:,1),'green');

%Labelling axis
xlabel('time(sec)')
ylabel('displacement(m)')
title('DAMPED VIBRATIONS')
legend('Exact','ode45','ode23s','ode113')


%%  FORCED VIBRATION




tspan=0:0.0001:1;     %time span (seconds)
y0=[0.5;0];           %Initial conditions,first element defines the initial displacement and second one velocity.



syms m;
m=dsolve('D2i+10*Di+500*i=100* sin (10*t)','Di(0)=0','i(0)=0.5');
pretty(m);
h=0:0.0001:1; 
zn=double(subs(m,h));


%Plotting results
figure (3)
plot(h,zn)

hold on
grid on


%ODE45-ordinary differential equations45
[t,y]=ode45(@forced_damped,tspan,y0);

%Plotting results
figure (3)
plot(t,y(:,1));

hold on;
grid on


%ODE23S-ordinary differential equations23s
[t,y]=ode23s(@forced_damped,tspan,y0);

%Plotting results
figure (3)
plot(t,y(:,1),'red -.');


%ODE113-ordinary differential equations113
[t,y]=ode113(@forced_damped,tspan,y0);

%Plotting results
figure (3)
plot(t,y(:,1),'-');

%Labelling axis
xlabel('time(sec)')
ylabel('displacement(m)')
title('FORCED VIBRATIONS')
legend('Exact','ode45','ode23s','ode113')

