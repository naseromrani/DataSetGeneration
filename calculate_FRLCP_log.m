function [F_RHCP_log, F_LHCP_log] = calculate_FRLCP_log(freq, theta_0, phi_0, pol_flag, psi_slant, X_op, M, x_min, x_max, y_min, y_max, epsilon_r, h, tc, modulation_coeffs)

zeta_0 = 0 * pi / 180;


[coeff_x, coeff_y] = calculate_polarization_coeff(theta_0, phi_0, psi_slant, pol_flag);

M_x = M * coeff_x;
M_y = M * coeff_y;

theta = linspace(-90, 90, 500) * pi / 180;
phi = 0;

switch pol_flag
        case {'v', 'V'} % Vertical polarization
                        coeff_x = 1;
                        coeff_y = tan(phi_0);
                        
                        f_x = coeff_x * calculate_f_x(freq,  theta,  phi,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0,      x_min,  x_max,  y_min, y_max, modulation_coeffs);
                        f_y = coeff_y * f_x;

        case {'h', 'H'} % Horizontal polarization
                        coeff_x = -tan(phi_0);
                        coeff_y = 1;

                        f_y = coeff_y * calculate_f_y(freq,  theta,  phi,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0,      x_min,  x_max,  y_min, y_max, modulation_coeffs);
                        f_x = coeff_x * f_y;

        case {'r', 'R', 'RHCP', 'rhcp'} % RHCP
                        coeff_x = 1;
                        coeff_y = (cos(theta_0)*sin(phi_0) - 1i*cos(phi_0))/ (cos(theta_0)*cos(phi_0) + 1i*sin(phi_0));

                        f_x = coeff_x * calculate_f_x(freq,  theta,  phi,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0,      x_min,  x_max,  y_min, y_max, modulation_coeffs);
                        f_y = coeff_y * f_x;

%                         plot_RHCP_component_1D;

        case {'l', 'L', 'LHCP', 'lhcp'} % LHCP
                        coeff_x = 1;
                        coeff_y = (cos(theta_0)*sin(phi_0) + 1i*cos(phi_0))/ (cos(theta_0)*cos(phi_0) - 1i*sin(phi_0));

                        f_x = coeff_x * calculate_f_x(freq,  theta,  phi,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0,      x_min,  x_max,  y_min, y_max, modulation_coeffs);
                        f_y = coeff_y * f_x;


        case {'s', 'S', 'SLANT', 'slant'} % Slant polarization
                        alphax = tan(psi_slant);
                        coeff_x = 1;
                        coeff_y =  (alphax*cos(theta_0)*sin(phi_0) + cos(phi_0))/ (alphax*cos(theta_0)*cos(phi_0) - sin(phi_0));

                        f_x = coeff_x * calculate_f_x(freq,  theta,  phi,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0,      x_min,  x_max,  y_min, y_max, modulation_coeffs);
                        f_y = coeff_y * f_x;


        otherwise 
                        coeff_x = 1;
                        coeff_y = 1;
end


F_theta = f_x * cos(phi)  +  f_y * sin(phi);
F_phi = cos(theta) .* (-f_x * sin(phi)  +  f_y * cos(phi));

F_RHCP = F_theta + 1i * F_phi;
F_LHCP = F_theta - 1i * F_phi;

F_RHCP_log = 10 * log10(abs(F_RHCP).^2);
F_LHCP_log = 10 * log10(abs(F_LHCP).^2);

F_abs_log = 10 * log10( abs(F_theta).^2  +  abs(F_phi).^2 );
F_normal = F_abs_log - max(F_abs_log);

% peaks_F = findpeaks(F_normal);
% peaks_2 = maxk(peaks_F, 3);
% 
% SLL = peaks_2(end);


end