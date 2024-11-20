resolution = 2.8e-3;

x = x_min : resolution : x_max;
y = y_min : resolution : y_max;

[X, Y] = meshgrid(x, y);

[PHI, RHO] = cart2pol(X, Y);

alpha_sw = 0.015 * k;


E_ax = calculate_E_ax(freq,  X,  Y,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0, modulation_coeffs) .* exp(alpha_sw * RHO);
E_ay = calculate_E_ay(freq,  X,  Y,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0, modulation_coeffs) .* exp(alpha_sw * RHO);

Eaa_rho = E_ax.*cos(PHI) + E_ay.*sin(PHI);
Eaa_phi = -E_ax.*sin(PHI) + E_ay .* cos(PHI);


Num = epsilon_r * cot(k * h * sqrt(epsilon_r - 1 - (X_op/eta_0)^2));
Denom = sqrt(epsilon_r - 1 - (X_op/eta_0)^2);

if (bc_flag == 'o')
        XX0 = X_op;
else
        XX0 = X_op * (1 - X_op/eta_0 * Num / Denom )^(-1);
end

n = sqrt(1+(X_op/eta_0)^2);
psi_ref = besselh(1, 2, n*k*RHO);
% psi_ref = exp(-1i*n*k0*rho);
Z_rho = XX0*(1   +    2*imag(Eaa_rho./psi_ref));
Z_phi = XX0* 2 * imag(Eaa_phi./psi_ref);


figure
imagesc( x * 1000, y * 1000, Z_rho);
title('X_{\rho \rho}');
colormap hot;
colorbar;
ax = gca;
ax.YDir = 'normal';
axis square;

figure
imagesc( x * 1000, y * 1000, Z_phi);
title('X_{\rho \phi}');
colormap hot;
colorbar;
ax = gca;
ax.YDir = 'normal';
axis square;