clc;
clear;
close all;

%% Inverter parameters

Sbase = 1.1e6;

Vbase = 660;

f = 50;

%% SCR values

SCR = [10 8 6 4 2 1];

%% Base impedance

Zbase = Vbase^2/Sbase;

%% Assume X/R = 10

XR = 10;

Zmag = Zbase./SCR;

Rgrid = Zmag/sqrt(1+XR^2);

Xgrid = XR*Rgrid;

Lgrid = Xgrid/(2*pi*f);

%% Display results

Results = table(SCR',Zmag',Rgrid',Xgrid',Lgrid', ...
    'VariableNames', ...
    {'SCR','Zmag','Rgrid','Xgrid','Lgrid'});

disp(Results);

%% Plot grid impedance

figure;

plot(SCR,Zmag,'o-','LineWidth',2);

grid on;

set(gca,'XDir','reverse');

xlabel('Short Circuit Ratio');

ylabel('Grid Impedance (Ohms)');

title('Grid Impedance Variation with SCR');

%% Plot grid inductance

figure;

plot(SCR,Lgrid*1000,'o-','LineWidth',2);

grid on;

set(gca,'XDir','reverse');

xlabel('SCR');

ylabel('Grid Inductance (mH)');

title('Grid Inductance Variation with SCR');
