function x_minus_1 = X_minus_1(rho, phi,X_rho, X_phi, m_rho, m_phi, theta_0, phi_0, beta_sw, tc, freq)

ks = KS(rho, phi, theta_0, phi_0, beta_sw, freq);
phi_rho = PHI_a(rho, phi, tc);
phi_phi = PHI_b(rho, phi, tc) - pi/2;

x_rho_rho = 0.5 * exp(+1i*ks) * exp(+1i*phi_rho) * m_rho * X_rho;
x_phi_phi = -0.5 * exp(+1i*ks) * exp(+1i*phi_rho) * m_rho * X_phi;

x_rho_phi = 0.5 * exp(+1i*ks) * exp(+1i*phi_phi) * m_phi * X_rho;
x_phi_rho = x_rho_phi;

x_minus_1 = [x_rho_rho, x_rho_phi; x_phi_rho, x_phi_phi];

end