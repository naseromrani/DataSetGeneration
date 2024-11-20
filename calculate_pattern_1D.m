switch pol_flag
        case {'v', 'V'} % Vertical polarization
                        coeff_x = 1;
                        coeff_y = tan(phi_0);
                        
                        f_x = coeff_x * calculate_f_x(freq,  theta,  phi,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0,      x_min,  x_max,  y_min, y_max, modulation_coeffs);
                        f_y = coeff_y * f_x;
                        plot_vertical_component_1D;
        case {'h', 'H'} % Horizontal polarization
                        coeff_x = -tan(phi_0);
                        coeff_y = 1;

                        f_y = coeff_y * calculate_f_y(freq,  theta,  phi,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0,      x_min,  x_max,  y_min, y_max, modulation_coeffs);
                        f_x = coeff_x * f_y;
                        plot_horizontal_component;
        case {'r', 'R', 'RHCP', 'rhcp'} % RHCP
                        coeff_x = 1;
                        coeff_y = (cos(theta_0)*sin(phi_0) - 1i*cos(phi_0))/ (cos(theta_0)*cos(phi_0) + 1i*sin(phi_0));

                        f_x = coeff_x * calculate_f_x(freq,  theta,  phi,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0,      x_min,  x_max,  y_min, y_max, modulation_coeffs);
                        f_y = coeff_y * f_x;

                        plot_RHCP_component_1D;
        case {'l', 'L', 'LHCP', 'lhcp'} % LHCP
                        coeff_x = 1;
                        coeff_y = (cos(theta_0)*sin(phi_0) + 1i*cos(phi_0))/ (cos(theta_0)*cos(phi_0) - 1i*sin(phi_0));

                        f_x = coeff_x * calculate_f_x(freq,  theta,  phi,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0,      x_min,  x_max,  y_min, y_max, modulation_coeffs);
                        f_y = coeff_y * f_x;

                        plot_LHCP_component;
        case {'s', 'S', 'SLANT', 'slant'} % Slant polarization
                        alphax = tan(psi_slant);
                        coeff_x = 1;
                        coeff_y =  (alphax*cos(theta_0)*sin(phi_0) + cos(phi_0))/ (alphax*cos(theta_0)*cos(phi_0) - sin(phi_0));

                        f_x = coeff_x * calculate_f_x(freq,  theta,  phi,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0,      x_min,  x_max,  y_min, y_max, modulation_coeffs);
                        f_y = coeff_y * f_x;

                        plot_vertical_component;
        otherwise 
                        coeff_x = 1;
                        coeff_y = 1;
end