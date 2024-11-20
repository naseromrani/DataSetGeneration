clc
clear
close all

%====================================================================================================

eta_0 = 120 * pi;
theta = linspace(-90, 90, 500) * pi / 180;
phi = 0;

pol_flag = 'r';     % Polarization State
bc_flag = 't';      % Polarization State
 
temp=0.05;
M=0.5;
i=0.05;
j=0.0;
p=0.0;
q=0.0;

%====================================================================================================

modulation_coeffs=[i,j,p,q];
X_op = temp * eta_0;         % Hologram Specs 
initialize_structure;
[F_RHCP_log, F_LHCP_log] = calculate_FRLCP_log(freq, theta_0, phi_0, pol_flag, psi_slant, X_op, M, x_min, x_max, y_min, y_max, epsilon_r, h, tc, modulation_coeffs);
data = [temp, M, i, j, p, q, F_RHCP_log, F_LHCP_log];


%====================================================================================================

%     n=1:500;
    plot(theta,data(7:506)-max(data(7:506)),'b','linewidth',2.5,'markersize',30)
%     plot(n,data(7:506)-max(data(7:506)),'b','linewidth',4)
    box on
%     grid on
%     ax = gca; % current axes
%     ax.FontSize = 12;
%     ax.LineWidth=1.1;
%     ax.TickDir = 'out';
    ax = gca; % current axes
    set(ax,'FontSize',12,'FontName','Times')
    ax.LineWidth=1.3;
    ax.TickLength = [0.02 0.02];
    xlim([theta(1) theta(end)])
    ylim([-55 0])
    xlabel('\theta(rad)','color','k','fontsize',25,'linewidth',3.5)
    ylabel('Normalized Gain(dBi)','color','k','fontsize',25,'linewidth',3.5)
%     legend('DL-RH','DL-LH','Exact-RH','Exact-LH','Full Wave-RH','Location','northwest','Orientation','vertical')
%     title('RH')


