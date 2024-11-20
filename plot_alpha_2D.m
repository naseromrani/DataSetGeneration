clear;
close all;

freq = 18e9;
k = 2 * pi * freq / 2.9979e8;

epsilon_r = 3.55;
h = 1.524e-3;

theta0 = 0 * pi / 180;
phi0 = 0 * pi / 180;

tc = 1;

eta0 = 120 * pi;
mm_rho = linspace(0.2, 0.5, 100);

xx_op = linspace(0.5, 0.9, 100) * eta0;

[MM_rho, XX_op] = meshgrid(mm_rho, xx_op);

alpha_sw = zeros(size(MM_rho));
beta_sw = zeros(size(MM_rho));
alpha_beta = zeros(size(MM_rho));

for ii = 1:length(mm_rho)
    for jj = 1:length(xx_op)
        
        beta_sw(ii, jj) = k * sqrt(1 + (XX_op(ii, jj)/eta0)^2);
        alpha_sw(ii, jj) = calculate_alpha(freq, epsilon_r, h, XX_op(ii, jj), MM_rho(ii, jj), MM_rho(ii, jj), theta0, phi0, tc, 10e-3, 0);
        
        alpha_beta(ii, jj) = alpha_sw(ii, jj) / beta_sw(ii, jj);
        
    end
end

figure;
imagesc(mm_rho, xx_op/eta0, alpha_sw/k);
colorbar;
colormap jet;
xlabel('Modulation Index, m_{\rho}');
ylabel('X_{op}/\eta_0')
ax = gca;
ax.YDir = 'Normal';
axis square
caxis([0, 0.015])