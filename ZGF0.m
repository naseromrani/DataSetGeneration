function zgf = ZGF0(rho, phi, X_rho, X_phi, theta_0, phi_0, beta_sw, eps_r, h, tc, freq)

k = 2*pi * freq / 3e8;
eta0 = 120*pi;

beta0 = beta_sw;

alpha_z = sqrt(beta0^2 - k^2);
kz1 = sqrt(eps_r*k^2 - beta0^2);

xTM = -eta0 * alpha_z / k;
xTE = eta0 * k / alpha_z;

zTM1 = eta0 * kz1 / (k*eps_r);
zTE1 = eta0 * k / kz1;

X0_rho_rho = xTM;
X0_phi_phi = xTE;

X0 = [X0_rho_rho, 0; 0 X0_phi_phi];

XG_rho_rho = zTM1 * tan(h*kz1);
XG_phi_phi = zTE1 * tan(h*kz1);

XG = [XG_rho_rho, 0; 0, XG_phi_phi];

zgf = -1i * inv(     inv(X0)     +    inv(XG)      );

end
