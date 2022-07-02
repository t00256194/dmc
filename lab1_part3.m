clear all
clc

%% Set1
figure
sim('mysim')
subplot 121
plot(simout,'b--'); hold on
plot(simout1,'r-'); grid on
title('Set 1 vs. Time'); legend('y1','y2')
xlabel('Time (s)'); ylabel('Set 1')

%% Set2
sim('mysim2')
subplot 122
plot(simout3,'b--'); hold on
plot(simout4,'r-') ; grid on
title('Set 2 vs. Time'); legend('y3','y4')
xlabel('Time (s)'); ylabel('Set 2')
