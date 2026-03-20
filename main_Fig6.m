% Plot the computational complexity (i.e. number of real operations) to invert a matrix N X N

clear; clc;

% Parameters
Ns = [256,512,1024,1024:1024:1024*8];

digital = 8*Ns.^3/3;
analog = 4*Ns.^2;

%% Plot
figure('defaultaxesfontsize',12)
LineW = 1.8; MarkS = 8;
semilogy(Ns,digital,'-h','linewidth',LineW,'MarkerSize',MarkS,'DisplayName','Digital')
hold on;
semilogy(Ns,analog,'-p','linewidth',LineW,'MarkerSize',MarkS,'DisplayName','MiLAC')
grid on;
set(gca,'GridLineStyle',':','GridAlpha',0.5,'LineWidth',1.2);
xlabel('Matrix size{\it N}');
ylabel('Computational complexity');
legend('location','southeast','NumColumns',1,'FontSize',12);
ax = gca;
ax.XTick = 0:1024:1024*8;
ax.XLim = [0 max(Ns)];
ax.YTick = 10.^(1:2:20);
ax.YLim = [1e5 3e13];
set(gcf, 'Color', [1,1,1]);
set(gca, 'LineWidth',1.5);