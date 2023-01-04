% Filename: myfree.m
% Purpose: Plots the motion of an underdamped 1-DOF system
% Usage: Queries the user for input
% Variables
% x = solution array
% A = amplitude constant
% zeta = damping ratio
% omega_n = natural frequency
% omega_d = damped natural frequency
% m = mass
% c = damping constant
% k = spring constant
% x0 = initial displacement
% v0 = initial velocity
%tmax = maximum time value
%phi = phase angle

m=10;
c=40;
k=500;
x0=0.01;
v0=1;
tmax=10;

% Part I
t=0:0.001:tmax;
omega_n = sqrt(k/m); zeta=c/(2*m*omega_n);
omega_d = omega_n*sqrt(1-zeta^2);
A=sqrt(( (v0+zeta*omega_n*x0)^2 + (x0*omega_d)^2 )/ omega_d^2);
phi=atan2(x0*omega_d, v0+zeta*omega_n*x0);

% Method 1
x=A*exp(-zeta*omega_n*t).*sin((omega_d*t)+phi);

% Method 2
A1 = A*sin(phi);
A2 = A*cos(phi);
x1 = exp(-zeta*omega_n*t).*(A1*cos(omega_d*t) + A2*sin(omega_d*t));

% Method 3
a1 = (A1-j*A2)/2;
a2 = (A1+j*A2)/2;
x2 = exp(-zeta*omega_n*t).*(a1*exp(j*omega_d*t) + a2*exp(-j*omega_d*t));

% Plot
plot(t,x,'r-',t,x1,'b--',t,x2,'g:')
title('Displacement vs. Time');
xlabel('Time (s)');
ylabel('Displacement (m)');
grid on

% Part II
[tpicks,xpicks]=ginput(2);

%% Part III
T = tpicks(2) - tpicks(1)
omega_dgraph = (2 * pi )/T
percenterror = abs((omega_d - omega_dgraph) / omega_d) * 100

