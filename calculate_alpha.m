function alpha = calculate_alpha(freq, eps_r, h, X_op, m_rho, m_phi, theta_0, phi_0, tc, rho, phi)

c = 3e8;
lambda = c/freq;
k = 2*pi*freq/c;
eta0 = 120*pi;
% 
coeff = sqrt(eps_r - 1 - (X_op/eta0)^2);
X_rho = X_op * (    1  -  X_op/eta0 *    eps_r * cot(k*h*coeff)  / coeff    )^(-1);
X_phi = X_rho;

beta_sw = k * sqrt(1 + (X_op/eta0)^2);

phi_rho = PHI_a(rho, phi, tc);
phi_phi = PHI_b(rho, phi, tc);

ks = KS(rho, phi, theta_0, phi_0, beta_sw, freq);

zz_minus_1 = z_minus_1(rho, phi, X_rho, X_phi, m_rho, m_phi, theta_0, phi_0, beta_sw, eps_r, h, tc, freq);
zz_plus_1 = z_plus_1(rho, phi, X_rho, X_phi, m_rho, m_phi, theta_0, phi_0, beta_sw, eps_r, h, tc, freq);

zgf = ZGF0(rho, phi, X_rho, X_phi, theta_0, phi_0, beta_sw, eps_r, h, tc, freq);
X0 = [X_rho, 0; 0, X_phi];
Ki_N = (-1i) * ( (zgf - 1i*X0) + zz_minus_1  + zz_plus_1);
Ki_rho_rho = Ki_N(1,1);
Ki_rho_phi = Ki_N(1, 2);
Ki_phi_rho = Ki_N(2, 1);
Ki_phi_phi = Ki_N(2, 2);

A = 1;
B = -conj(Ki_phi_rho) / conj(Ki_phi_phi);
C = 1;
D = -Ki_phi_rho / Ki_phi_phi;

zz_t = ctranspose(zz_minus_1);
M1 = zz_t(1, 1);
M2 = zz_t(1, 2);
M3 = zz_t(2, 1);
M4 = zz_t(2, 2);

Num = -real(C*(A*M1 + B*M3)    +   D*(A*M2 + B*M4)   );
Denum = (X_rho^2 * beta_sw*k)/eta0 * (2*eps_r / (h * (eps_r*k^2 - beta_sw^2)^2 )     +     1/(beta_sw^2 - k^2)^1.5);

alpha = Num / Denum;

%  alpha = 0.015 * k;

end