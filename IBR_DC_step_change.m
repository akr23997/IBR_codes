clc;
clear;
close all;

%% Parameters

Vdc_initial = 1150;

Vdc_final = 1200;

t = 0:0.001:5;

%% Reference generation

Vref = Vdc_initial*ones(size(t));

Vref(t >= 2) = Vdc_final;

%% Plot reference

figure;

plot(t,Vref,'LineWidth',2);

grid on;

xlabel('Time (seconds)');

ylabel('Vdc Reference (V)');

title('DC Link Voltage Reference Step Change');

%% Example state space model

% Replace with actual linearized matrices.

A = [-10 2;
     -5 -20];

B = [1;0];

C = [1 0];

D = 0;

sys = ss(A,B,C,D);

%% Simulation

u = Vref - Vdc_initial;

[y,tout] = lsim(sys,u,t);

figure;

plot(tout,y,'LineWidth',2);

grid on;

xlabel('Time (seconds)');

ylabel('Response');

title('State Space Response for Vdc Reference Change');
