clear all
clc

%% Independent_Variables
x = 0:2:25;
y = linspace(0,25,100);

%% Dependent_Variables
fx = sin(x)./x;
fy = sin(y)./y; 

%% Plots
subplot 121
plot(x,fx,'g--')
title('f(x) vs. x'); grid on
xlabel('x'); ylabel('f(x)')

subplot 122
plot(y,fy,'k:')
title('f(y) vs. y'); grid on
xlabel('y'); ylabel('f(y)')

clear all
