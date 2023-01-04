clear all; clc
load('Data.mat');


%% Acceleration vs. Time PLot
t = Data(:,1);
a = Data(:,2);

plot(t,a)
title('Acceleration vs. Time')
xlabel('time (s)')
ylabel('Acceleration (m/s^2)')
grid on 

%% Dimensions (m) - L is total length; l is free length
L = 0.3175; b =0.2552; h = 0.005;
l = 0.288;

%% Mass (kg)
beam = 0.1392; accel = 0.0194; mass = 0.2387;
M = accel + mass;
m = (beam/L)*l;
meq = 0.23*m + M

%% Equicalent K & C
n=10; A1 = 2.796; A2 = 2.034; logdec = log(A1/A2)/n;   %%%Log Decrement
dratio = logdec/sqrt(4*pi^2 + logdec^2);               %%%Damping Ratio
T1 = 1.83; T2 = 1.882; T = T2-T1;                      %%%Period


w_n = 2*pi/T;                                          %%%Natural Frequency
w_d = 0.5*w_n/sqrt(1-dratio^2);                            %%%Damped Natural Frequency
keq = meq*w_n^2
ceq = dratio*2*sqrt(meq*keq)


%% SIMULINK
figure
sim('SDOF2')
plot(tout,simout)
title('SIMULINK Scope Output')
xlabel('time (s)')
grid on

%% RMS
n = length(a);
rmse = sqrt(sum(((a-simout).^2)./n))
