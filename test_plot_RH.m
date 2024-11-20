clc
clear
close all

%====================================================================================================

eta_0 = 120 * pi;
theta = linspace(-90, 90, 500) * pi / 180;
phi = 0;

pol_flag = 'r';     % Polarization State
bc_flag = 't';      % Polarization State
 
temp=0.541;
M=0.537;
i=0.195;
j=0.203;
p=0.195;
q=0.204;

%====================================================================================================

modulation_coeffs=[i,j,p,q];
X_op = temp * eta_0;         % Hologram Specs 
initialize_structure;
[F_RHCP_log, F_LHCP_log] = calculate_FRLCP_log(freq, theta_0, phi_0, pol_flag, psi_slant, X_op, M, x_min, x_max, y_min, y_max, epsilon_r, h, tc, modulation_coeffs);
data = [temp, M, i, j, p, q, F_RHCP_log, F_LHCP_log];

figure(1)
    plot(theta,data(7:506)-max(data(7:506)),'r','linewidth',3.5,'markersize',30)
    hold on
    plot(theta,data(507:1006)-max(data(507:1006)),'magenta --','linewidth',3.5,'markersize',30)
    hold on
    %====================================================================================================    
temp=0.5;
M=0.4;
i=0.1;
j=0.5;
p=0.2;
q=0.3;
modulation_coeffs=[i,j,p,q];
X_op = temp * eta_0;         % Hologram Specs 
initialize_structure;
[F_RHCP_log, F_LHCP_log] = calculate_FRLCP_log(freq, theta_0, phi_0, pol_flag, psi_slant, X_op, M, x_min, x_max, y_min, y_max, epsilon_r, h, tc, modulation_coeffs);
data = [temp, M, i, j, p, q, F_RHCP_log, F_LHCP_log];

%====================================================================================================

load('D:\My works\Deep Learning Design of OAM\CST model\GainRH.txt')
load('D:\My works\Deep Learning Design of OAM\CST model\GainRH1.txt')
load('D:\My works\Deep Learning Design of OAM\CST model\GainLH.txt')
S=size(GainRH1);
N=S(1);
R=zeros(1,N+1);
% L=zeros(1,N-1);
L=zeros(1,N);
theta2=(-90:90).*pi/180;
for n=1:N+1
    R(n)=GainRH(n,6);
end
% for n=1:N-1
%     L(n)=R(N+1-n);
% end
for n=1:N
    L(n)=GainRH1(N+1-n,6);
end
G=[L,R];%// Normalized Gain

    %====================================================================================================    
     plot(theta,data(7:506)-max(data(7:506)),'b','linewidth',3.5,'markersize',30)
    hold on
    plot(theta,data(507:1006)-max(data(507:1006)),'k --','linewidth',3.5,'markersize',30)
    hold on
    plot(theta2,G-max(G),'g','linewidth',3.5,'markersize',20)
    hold on
    plot(theta2,GainLH(:,4)-max(GainLH(:,4)),'cyan --','linewidth',3.5,'markersize',30)
    hold off
    box on
%     grid on
%     ax = gca; % current axes
%     ax.FontSize = 12;
%     ax.LineWidth=1.1;
%     ax.TickDir = 'out';
    ax = gca; % current axes
    set(ax,'FontSize',13,'FontName','Times')
    ax.LineWidth=1.3;
    ax.TickLength = [0.02 0.02];
    xlim([theta(1) theta(end)])
    ylim([-55 0])
    xlabel('\theta(rad)','color','k','fontsize',25,'linewidth',3.5)
    ylabel('Normalized Gain(dBi)','color','k','fontsize',25,'linewidth',3.5)
    legend('DL-RH','DL-LH','Exact-RH','Exact-LH','Full Wave-RH', 'Full Wave-LH','Location','best','Orientation','vertical')
%     title('RH')


