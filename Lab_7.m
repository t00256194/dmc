clear;clc

%% Part II 

m = 10; c_1 = 2; k = 1000;       %%Mass, Damper, Spring

omega_n = sqrt(k/m);             %%Natural Frequency         (#1)
zratio_1 = 0.5*c_1/sqrt(m*k);    %%Damping Ratio             (#2)
tau_1 = m/c_1;                   %%Time Constant             (#3)

c_2 = 0.1*2*sqrt(m*k)            %%Theoretical Damping value (#4)
zratio_2 = 0.5*c_2/sqrt(m*k)
tau_2 = m/c_2                    %%Theoretical Time Constant (#5)


%% Part III
                                                
r = 0:0.01:5;                                               %%Input-Natural Frequency Ratio
T_1 = (1+j.*2.*zratio_1.*r)./((1-r.^2)+j.*2.*zratio_1.*r);  %%Frequency Response Function
mag_1 = abs(T_1); phase_1 = angle(T_1);                     %%Phase and Angle

figure (1)                                                  %%Plot 1
sgtitle('C = 2 N-s/m')

subplot 211
plot(r,mag_1)
title('Magnitude vs. Frequency Ratio')
xlabel('Frequency ratio, r'); ylabel('Magnitude, M') 
grid on

subplot 212
plot(r,phase_1)
title('Phase vs. Frequency Ratio')
xlabel('Frequency ratio, r'); ylabel('Phase,\phi') 
grid on

r = 0:0.01:5;                                                %%Input-Natural Frequency Ratio
T_2 = (1+j.*2.*zratio_2.*r)./((1-r.^2)+j.*2.*zratio_2.*r);   %%Frequency Response Function
X = (1+j.*2.*zratio_2.*r); Y = ((1-r.^2)+j.*2.*zratio_2.*r);
mag_2 = abs(T_2); phase_2 = angle(T_2);                      %%Phase and Angle

figure (2)                                                   %%Plot 2
sgtitle('c = 20 N-s/m')

subplot 211
plot(r,mag_2)
title('Magnitude vs. Frequency Ratio')
xlabel('Frequency ratio, r'); ylabel('Magnitude, M') 
grid on

subplot 212
plot(r,phase_2)
title('Phase vs. Frequency Ratio')
xlabel('Frequency ratio, r'); ylabel('Phase, \phi') 
grid on


%% Part IV

sim('model.slx')
figure (3)
plot('simout')


