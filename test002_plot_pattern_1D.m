clear;
%  close all;

 eta_0 = 120 * pi;

%% Polarization State
pol_flag = 'r';
bc_flag = 'o';

%% Hologram Specs
X_op = 0.5 * eta_0;
M = 0.05;
%%
%%
initialize_structure;
%%

modulation_coeffs = [1, 5, 10, 0];

theta = linspace(-90, 90, 500) * pi / 180;
phi = 0;

calculate_pattern_1D;
% hold on;
% hold on;
% plot_surface_impedance;



