clc;
clear;
close all;

%% PV current parameters

Ipv_initial = 478.26;
Ipv_final = 526.09;

t = 0:0.001:5;

Ipv = Ipv_initial*ones(size(t));

Ipv(t >= 2) = Ipv_final;

%% Plot PV current

figure;

plot(t,Ipv,'LineWidth',2);

grid on;

xlabel('Time (seconds)');
ylabel('PV Current (A)');

title('Step Change in PV Current');

%% State Space Model

% Replace these matrices with the actual
% matrices obtained from Simulink linearization.

A = [ -10  2;
       -5 -20 ];

B = [1; 0];

C = [1 0];

D = 0;

sys = ss(A,B,C,D);

%% State space simulation

u = Ipv - Ipv_initial;

[y,tout] = lsim(sys,u,t);

figure;

plot(t, y,'LineWidth',2);

grid on;

xlabel('Time (seconds)');
ylabel('Output');

title('State Space Response to PV Current Step');
