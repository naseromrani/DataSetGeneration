clc
clear
close all

%%%%%% ---> parameters

eta_0 = 120 * pi;
theta = linspace(-90, 90, 500) * pi / 180;
phi = 0;

pol_flag = 'r';     % Polarization State
bc_flag = 't';      % Polarization State

step=0;
main_data = [];
h = waitbar(0,'Computations progress,Please wait....');
steps = 11*10*11*11*11*9;
for temp=1.1:-0.1:0.1
    for M=1:-0.1:0.1 
        for i=0.8:-0.1:0
            for j=0.8:-0.1:0
                for p=0.8:-0.1:0
                    for q=1:-0.1:0
                        sum = i+j+p+q;
                        if sum~= 0 && sum<=1
                            step=step+1;
                            waitbar(step / steps)
                            modulation_coeffs=[i,j,p,q];
                            X_op = temp * eta_0;         % Hologram Specs 
                            initialize_structure;
                            [F_RHCP_log, F_LHCP_log] = calculate_FRLCP_log(freq, theta_0, phi_0, pol_flag, psi_slant, X_op, M, x_min, x_max, y_min, y_max, epsilon_r, h, tc, modulation_coeffs);
                            data = [temp, M, i, j, p, q, F_RHCP_log, F_LHCP_log];
                            main_data = [main_data; data];
                        end
                    end
                end
            end
        end
    end
end
close(h)
filename = 'main_data';
save(filename,'main_data')
