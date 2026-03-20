% Plot the computational complexity (i.e. number of real operations) to compute the Kalman filter

clear; clc;

% Parameters
Ys = [256,512,1024,1024:1024:1024*8];
Xs = [1024,1024*8];

digital = zeros(length(Xs)+1,length(Ys));
analog = zeros(length(Xs)+1,length(Ys));
for iX = 1:length(Xs)
    X = Xs(iX);
    digital(iX,:) = 24*X.^3 + 16*X.^2.*Ys + 8*X.*Ys.^2 + 8*Ys.^3/3;
    analog(iX,:) = 26*X.^2 + 12*X*Ys;
end
digital(end,:) = 24*Ys.^3 + 16*Ys.^3 + 8*Ys.^3 + 8*Ys.^3/3;
analog(end,:) = 26*Ys.^2 + 12*Ys.^2;

%% Plot
figure('defaultaxesfontsize',12)
LineW = 1.8; MarkS = 8;
semilogy(Ys,digital(3,:),'-h','linewidth',LineW,'MarkerSize',MarkS,'DisplayName','Digital')
hold on;
semilogy(Ys,digital(2,:),'-s','linewidth',LineW,'MarkerSize',MarkS,'DisplayName','Digital')
semilogy(Ys,digital(1,:),'-^','linewidth',LineW,'MarkerSize',MarkS,'DisplayName','Digital')
set(gca,'ColorOrderIndex',1);
semilogy(Ys,analog(3,:),'--p','linewidth',LineW,'MarkerSize',MarkS,'DisplayName','MiLAC,{\it X = Y}')
semilogy(Ys,analog(2,:),'--o','linewidth',LineW,'MarkerSize',MarkS,'DisplayName','MiLAC,{\it X = 8192}')
semilogy(Ys,analog(1,:),'--v','linewidth',LineW,'MarkerSize',MarkS,'DisplayName','MiLAC,{\it X = 1024}')
grid on;
set(gca,'GridLineStyle',':','GridAlpha',0.5,'LineWidth',1.2);
xlabel('Observation vector size{\it Y}');
ylabel('Computational complexity');
legend('location','southeast','NumColumns',2,'FontSize',12);
ax = gca;
ax.XTick = 0:1024:1024*8;
ax.XLim = [0 max(Ys)];
ax.YTick = 10.^(1:2:20);
ax.YLim = [1e5 3e13];
set(gcf, 'Color', [1,1,1]);
set(gca, 'LineWidth',1.5);