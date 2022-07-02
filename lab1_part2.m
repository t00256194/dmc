clear all
clc

%% Equations
t = 0:pi/100:2*pi;
y1 = exp(-0.5*t);
y2 = exp(-0.5*t).*sin(2*t);
y3 = exp(0.5*t);
y4 = exp(0.5*t).*sin(2*t);

%% Set1
figure
subplot 121
plot(t,y1,'b--'); hold on
plot(t,y2,'r-'); grid on 
title('Set 1 vs. Time'); legend('y1','y2')
xlabel('Time (s)'); ylabel('Set 1')

%% Set2
subplot 122
plot(t,y3,'b--'); hold on
plot(t,y4,'r-'); grid on
title('Set 2 vs. Time'); legend('y3','y4')
xlabel('Time (s)'); ylabel('Set 2')


