mm_rho = linspace(0, 0.3, 400);

xx_op = linspace(0.5, 1.5, 400) * eta0;

[MM_rho, XX_op] = meshgrid(mm_rho, xx_op);

alpha_sw = zeros(size(MM_rho));
beta_sw = zeros(size(MM_rho));
alpha_beta = zeros(size(MM_rho));

for ii = 1:length(mm_rho)
    for jj = 1:length(xx_op)
        
        beta_sw(ii, jj) = k * sqrt(1 + (XX_op(ii, jj)/eta0)^2);
        alpha_sw(ii, jj) = calculate_alpha(freq, eps_r, h, XX_op(ii, jj), MM_rho(ii, jj), MM_rho(ii, jj), theta0, phi0, tc, 10e-3, 0);
        
        alpha_beta(ii, jj) = alpha_sw(ii, jj) / beta_sw(ii, jj);
        
    end
end

figure;
imagesc(mm_rho, xx_op/eta0, alpha_beta);
colorbar;
colormap jet;
ax = gca;
ax.YDir = 'Normal';