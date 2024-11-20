mm_rho = linspace(0, 0.3, 400);
alpha_sw_1D = zeros(size(mm_rho));

for ii = 1:length(mm_rho)
    
    alpha_sw_1D(ii) = calculate_alpha(freq, eps_r, h, X_op, mm_rho(ii), mm_rho(ii), theta0, phi0, tc, 10e-3, pi/7);
    
end

figure;
p1 = plot(mm_rho, alpha_sw_1D / k, 'LineWidth', 2, 'color', 'r');
grid on;
txt_legend = strcat('X_{op}/\eta_0 = ', num2str(X_op/eta0));
legend(txt_legend);
xlabel('m_{\rho} = m_{\phi}');
ylabel('\alpha_{sw}/k');
