%% Constants
eta_0 = 120 * pi;
c = 2.9979e8;

%% Operation Frequency
freq = 18e9;
k = 2 * pi * freq / c;
lambda = c / freq;

%% Dielectric Parameters
epsilon_r = 3.55;
h = 1.524e-3;

%% Antenna Dimensions
x_min = -6.99 * lambda;
x_max = 7 * lambda;

y_min = -6.99 * lambda;
y_max = 7 * lambda;

%% Far-zone Pattern Specs
theta_0 = 0 * pi / 180; %Zenith angle
phi_0 = 0 * pi / 180; %Azimuth angle

psi_slant = 45 * pi / 180;

tc = 1; %Topological charge

zeta_0 = 0 * pi / 180;

%% Hologram Specs
[coeff_x, coeff_y] = calculate_polarization_coeff(theta_0, phi_0, psi_slant, pol_flag);

M_x = M * coeff_x;
M_y = M * coeff_y;



