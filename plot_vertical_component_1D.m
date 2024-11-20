F_theta = f_x * cos(phi)  +  f_y * sin(phi);
F_phi = cos(theta) .* (-f_x * sin(phi)  +  f_y * cos(phi));

F_theta_log = 10 * log10(abs(F_theta).^2);
F_phi_log = 10 * log10(abs(F_phi).^2);
F_abs_log = 10 * log10( abs(F_theta).^2  +  abs(F_phi).^2 );

delta_clim = 30;

%%
plot(theta * 180 / pi, F_abs_log - max(F_abs_log), 'LineWidth', 2);
xlabel('\theta (deg)');
ylabel('Normalized Pattern');

findpeaks(F_abs_log - max(F_abs_log));

