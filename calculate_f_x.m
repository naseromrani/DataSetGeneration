function fxx = calculate_f_x(freq,  theta,  phi,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0,      x_min,  x_max,  y_min, y_max, modulation_coeffs)
        
        c = 2.9979e8;
        k = 2 * pi * freq / c;

        k_x = k * sin(theta) .* cos(phi);
        k_y = k * sin(theta) .* sin(phi);

        fxx = quadv(@(x_prim)                        quadv(@(y_prim) calculate_E_ax(freq,  x_prim,  y_prim, X_op,  M_x,  M_y,  theta_0,  phi_0, epsilon_r,  h,  tc,  zeta_0, modulation_coeffs) .* exp(1i*(k_x.*x_prim + k_y.*y_prim))         , x_min, x_max),            y_min, y_max         );
        
end