F_theta = f_x .* cos(phi)  +  f_y .* sin(phi);
F_phi = cos(theta) .* (-f_x .* sin(phi)  +  f_y .* cos(phi));

F_RHCP = F_theta + 1i * F_phi;
F_LHCP = F_theta - 1i * F_phi;

F_RHCP_log = 10 * log10(abs(F_RHCP).^2);
F_LHCP_log = 10 * log10(abs(F_LHCP).^2);
F_abs_log = 10 * log10( abs(F_RHCP).^2  +  abs(F_LHCP).^2 );




u = sin(theta) .* cos(phi);
v = sin(theta) .* sin(phi);

delta_clim = 30;

%% F_theta
figure;
surf(   u, v, F_RHCP_log-max(max(F_RHCP_log))   );
title('F_{RHCP} - Normalized');
colormap jet;
shading interp;
axis square;
colorbar;
caxis([-delta_clim, 0]);

%% F_phi
% F_phi
figure
surf(   u, v, F_LHCP_log-max(max(F_RHCP_log))   );
title('F_{LHCP} - Normalized');
colormap jet;
shading interp;
axis square;
colorbar;
caxis([-delta_clim, 0]);

%% F_abs
% F_abs
figure
surf(   u, v, F_abs_log-max(max(F_abs_log))   );
title('F_{abs} - Normalized');
colormap jet;
shading interp;
axis square;
colorbar;
caxis([-delta_clim, 0]);