clear;
close all;

eta_0 = 120 * pi;

%% Polarization State
pol_flag = 'r';
bc_flag = 't';

%% Hologram Specs
X_op = 0.6 * eta_0;
M = 0.05;
%%
initialize_structure;
%%

modulation_coeffs = [0, 3, 3, 0];

th = linspace(0, 90, 100) * pi / 180;
ph = linspace(0, 360, 100) * pi / 180;

[theta, phi] = meshgrid(th, ph);

calculate_pattern_2D;
%  plot_surface_impedance;



