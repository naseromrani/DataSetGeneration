function E_ay = calculate_E_ay(freq,  x_prim,  y_prim,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0, modulation_coeffs)
        
        % Constants
        eta_0 = 120 * pi;
        c = 2.9979e8;

        lambda = c / freq;
        %%%%%%%%%%%%%%%%%%%

        k = 2 * pi * freq / c;

        [phi_prim,  rho_prim] = cart2pol(x_prim,  y_prim);

%         modulation_coeffs = modulation_coeffs / sum(modulation_coeffs);

        mod_coeff = modulation_coeffs(1) + modulation_coeffs(2) * cos(pi / (2 * 10 * lambda) * rho_prim)  + modulation_coeffs(3) * cos(2 * pi / (2 * 10 * lambda) * rho_prim) + modulation_coeffs(4) * cos(3 * pi / (2 * 10 * lambda) * rho_prim); 

        M_x = M_x *  mod_coeff;
        M_y = M_y *  mod_coeff;
        

        m_rho  =  M_x .* cos(phi_prim)  +  M_y .* sin(phi_prim);
        m_phi  =   -M_x .* sin(phi_prim)  +  M_y .* cos(phi_prim);

        

        beta_sw  =  k * sqrt(1  +  (X_op / eta_0) ^ 2);

        for ii = 1 : size(rho_prim, 1)
                for jj = 1 : size(rho_prim, 2)
                        alpha_sw(ii, jj)  =   calculate_alpha(freq, epsilon_r, h, X_op, m_rho(ii, jj), m_phi(ii, jj), theta_0, phi_0, tc, rho_prim(ii, jj), phi_prim(ii, jj));
                end
        end


        E_rho0  =  (M_y) ./ sqrt(2*pi*sqrt(beta_sw^2  +  alpha_sw.^2) .* rho_prim) .* exp(-alpha_sw .* rho_prim);
%         E_rho0 = M_y * cos(pi / (2 * 10 * lambda) * rho_prim) ./ sqrt(2*pi*sqrt(beta_sw^2  +  alpha_sw^2) .* rho_prim) .* exp(-alpha_sw * rho_prim);
        E_ay  =  E_rho0 .* exp(-1i*(k*x_prim*sin(theta_0)*cos(phi_0) +  k*y_prim*sin(theta_0)*sin(phi_0)      +   zeta_0  +   tc*phi_prim  ));
        
         E_ay = E_ay .* (rho_prim < 7 * lambda);
        

end
