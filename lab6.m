%%%System 1
s1a = load('1a.txt'); s1b = load('1b.txt');
s1c = load('1c.txt'); s1d = load('1d.txt');

s1a1 = s1a(:,2); s1a2 = s1a(:,3);
s1b1 = s1b(:,2); s1b2 = s1b(:,3);
s1c1 = s1c(:,2); s1c2 = s1c(:,3);
s1d1 = s1d(:,2); s1d2 = s1d(:,3);

t = s1a(:,1);

%%System 1 Plot
figure (1)
subplot 211; hold on; grid on; box on
plot(t,s1a1); plot(t,s1a2); hold off;
title('Run 1a vs. Time'); xlabel('Time (s)'); ylabel('Run 1a Acceleration (m/s^2 )');
legend('Acceleration _1', 'Acceleration_2','location','northeast')
subplot 212; hold on; grid on; box on
plot(t,s1b1); plot(t,s1b2); hold off;
title('Run 1b vs. Time'); xlabel('Time (s)'); ylabel('Acceleration (m/s^2 )');
legend('Acceleration _1', 'Acceleration_2','location','northeast')

figure (2)
subplot 211; hold on; grid on; box on
plot(t,s1c1); plot(t,s1c2); hold off;
title('Run 1c vs. Time'); xlabel('Time (s)'); ylabel('Acceleration (m/s^2 )');
legend('Acceleration _1', 'Acceleration_2','location','northeast')
subplot 212; hold on; grid on; box on
plot(t,s1d1); plot(t,s1d2); hold off;
title('Run 1d vs. Time'); xlabel('Time (s)'); ylabel('Acceleration (m/s^2 )');
legend('Acceleration _1', 'Acceleration_2','location','northeast')

%%%System 2 
s2a = load('2a.txt'); s2b = load('2b.txt');
s2c = load('2c.txt'); s2d = load('2d.txt');

s2a1 = s2a(:,2); s2a2 = s2a(:,3);
s2b1 = s2b(:,2); s2b2 = s2b(:,3);
s2c1 = s2c(:,2); s2c2 = s2c(:,3);
s2d1 = s2d(:,2); s2d2 = s2d(:,3);

t = s2a(:,1);

%%System 2 Plots
figure (3)
subplot 211; hold on; grid on;
plot(t,s2a1); plot(t,s2a2); hold off; box on
title('Run 2a vs. Time'); xlabel('Time (s)'); ylabel('Acceleration (m/s^2 )');
legend('Acceleration _1', 'Acceleration_2','location','northeast')
subplot 212; hold on; grid on; box on
plot(t,s2b1); plot(t,s2b2); hold off;
title('Run 2b vs. Time'); xlabel('Time (s)'); ylabel('Acceleration (m/s^2 )');
legend('Acceleration _1', 'Acceleration_2','location','northeast')

figure (4)
subplot 211; hold on; grid on; box on
plot(t,s2c1); plot(t,s2c2); hold off;
title('Run 2c vs. Time'); xlabel('Time (s)'); ylabel('Acceleration (m/s^2 )');
legend('Acceleration _1', 'Acceleration_2','location','northeast')
subplot 212; hold on; grid on; box on
plot(t,s2d1); plot(t,s2d2); hold    off;
title('Run 2d vs. Time'); xlabel('Time (s)'); ylabel('Acceleration (m/s^2 )');
legend('Acceleration _1', 'Acceleration_2','location','northeast')


%% System 1 Natural Frequencies (Equal masses)
k1 = 3; k2 = 3; k3 = 3;               %%Stiffness  
K = [k1+k2 -k2; -k2 k2+k3];

s1m1 = 0.18534; s1m2  = 0.18534;      %%Mass
M1 = diag([s1m1 s1m2]);
    
[V1,D1] = eig(K,M1);                  %%Solve

s1wn = sqrt(D1);                      %%Natural Frequencies
s1wn1 = s1wn(1) 
s1wn2 = s1wn(4)             

s1V1 = V1(:,1)                        %%Eigenvectors
s1V2 = V1(:,2)


%% System 2 Natural Frequencies (Unequal masses)
k1 = 3; k2 = 3; k3 = 3;               %%Stiffness  
K = [k1+k2 -k2; -k2 k2+k3];

s2m1 = 0.18534; s2m2  = 0.38090;      %%Mass
M2 = diag([s2m1 s2m2]);
     
[V2,D2] = eig(K,M2);                  %%Solve

s2wn = sqrt(D2);                      %%Natural Frequencies
s2wn1 = s2wn(1) 
s2wn2 = s2wn(4)             

s1V1 = V2(:,1)                        %%Eigenvectors
s2V2 = V2(:,2)

%% SIMULINKS
load('lab6_constants.m');
sim('two_dof.mdl')
plot(tout,x1dotdot_sim)


