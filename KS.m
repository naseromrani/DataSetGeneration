function ks = KS(rho, phi, theta_0, phi_0, beta_sw, freq)

k = 2*pi*freq / 3e8;
[x, y] = pol2cart(phi, rho);

ks = beta_sw * rho - k * sin(theta_0) * cos(phi_0) * x - k * sin(theta_0) * sin(phi_0) *y;

end