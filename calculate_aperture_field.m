x = linspace(x_min, x_max, 400);
y = linspace(y_min, y_max, 400);

[X, Y] = meshgrid(x, y);


Ex = calculate_E_ax(freq,  X,  Y,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0);
Ey = calculate_E_ay(freq,  X,  Y,  X_op,  M_x,  M_y,  theta_0,  phi_0,  epsilon_r,  h,  tc,  zeta_0);


% Ex
figure;
imagesc(x * 1000, y * 1000, real(Ex));
axis square;
colormap turbo;
colorbar;
xlabel('x (mm)');
ylabel('y (mm)');
caxis([0, 0.1]);
title('Real\{E_{ax}\}');

%Ey
figure;
imagesc(x * 1000, y * 1000, real(Ey));
axis square;
colormap turbo;
colorbar;
xlabel('x (mm)');
ylabel('y (mm)');
caxis([0, 0.1]);
title('Real\{E_{ay}\}');


% anglr(Ex)
figure;
imagesc(x * 1000, y * 1000, angle(Ex) * 180 / pi);
axis square;
colormap turbo;
colorbar;
xlabel('x (mm)');
ylabel('y (mm)');
% caxis([0, 0.1]);
title('Phase\{E_{ax}\}');

%angle(Ey)
figure;
imagesc(x * 1000, y * 1000, angle(Ey) * 180 / pi);
axis square;
colormap turbo;
colorbar;
xlabel('x (mm)');
ylabel('y (mm)');
% caxis([0, 0.1]);
title('Phase\{E_{ay}\}');