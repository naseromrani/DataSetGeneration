function [coeff_x, coeff_y] = calculate_polarization_coeff(theta_0, phi_0, psi_slant, pol_flag)
        switch pol_flag
                case {'v', 'V'} % Vertical polarization
                        coeff_x = 1;
                        coeff_y = tan(phi_0);
                case {'h', 'H'} % Horizontal polarization
                        coeff_x = -tan(phi_0);
                        coeff_y = 1;
                case {'r', 'R', 'RHCP', 'rhcp'} % RHCP
                        coeff_x = 1;
                        coeff_y = (cos(theta_0)*sin(phi_0) - 1i*cos(phi_0))/ (cos(theta_0)*cos(phi_0) + 1i*sin(phi_0));
                case {'l', 'L', 'LHCP', 'lhcp'} % LHCP
                        coeff_x = 1;
                        coeff_y = (cos(theta_0)*sin(phi_0) + 1i*cos(phi_0))/ (cos(theta_0)*cos(phi_0) - 1i*sin(phi_0));
                case {'s', 'S', 'SLANT', 'slant'} % Slant polarization
                        alphax = tan(psi_slant);
                        coeff_x = 1;
                        coeff_y =  (alphax*cos(theta_0)*sin(phi_0) + cos(phi_0))/ (alphax*cos(theta_0)*cos(phi_0) - sin(phi_0));
                otherwise 
                        coeff_x = 1;
                        coeff_y = 1;
        end
end