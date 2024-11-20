function z = z_minus_1(rho, phi, X_rho, X_phi, m_rho, m_phi, theta_0, phi_0, beta_sw, eps_r, h, tc, freq)

x_minus = X_minus_1(rho, phi,X_rho, X_phi, m_rho, m_phi, theta_0, phi_0, beta_sw, tc, freq);
x_plus = X_plus_1(rho, phi,X_rho, X_phi, m_rho, m_phi, theta_0, phi_0, beta_sw, tc, freq);

y_minus = Y_minus_1(rho, phi, X_rho, X_phi, theta_0, phi_0, beta_sw, eps_r, h, freq);

z = x_plus * y_minus * x_minus;

end