clear;
close all;

%% Polarization State
pol_flag = 'r';
bc_flag = 'o';

%% Hologram Specs
X_op = 0.8 * eta_0;
M = 0.11;
%%
initialize_structure;

calculate_aperture_field;