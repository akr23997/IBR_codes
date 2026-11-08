clc;
clear;
close all;

%% SCR values

SCR = [10 8 6 4 2 1];

%% Example state space matrices
% Replace these with actual linearized
% matrices for each SCR.

A = [-10 2;
     -5 -20];

%% Eigenvalue calculation

lambda = eig(A);

%% Damping calculation

sigma = real(lambda);

omega = imag(lambda);

wn = abs(lambda);

zeta = -sigma./wn;

%% Display results

disp('Eigenvalues:');

disp(lambda);

disp('Damping Ratios:');

disp(zeta);

%% Stability check

if all(real(lambda)<0)

    disp('System is stable');

else

    disp('System is unstable');

end

%% Eigenvalue plot

figure;

plot(real(lambda),imag(lambda),'x','MarkerSize',12);

grid on;

xlabel('Real Axis');

ylabel('Imaginary Axis');

title('Eigenvalue Distribution');

xline(0,'r--');
