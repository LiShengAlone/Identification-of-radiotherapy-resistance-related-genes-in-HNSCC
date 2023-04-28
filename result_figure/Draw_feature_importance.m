clc
clear
[a,text]=xlsread("../result_data/sortedImp_60.xlsx")
geneNum = 40
expNum = 20
frontsize = 24
t=1:geneNum
b=a(2:geneNum + 1,1:expNum)

main=figure(1);
main.WindowState = 'maximized';
b = bar3(b, 0.7);
hXLabel = xlabel('Experiments');
hYLabel = ylabel('');
hZLabel = zlabel('Feature importance');
ylim([0 geneNum+1])
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end
colormap("jet")
view(270, 90)

set(gca,'XAxisLocation','bottom')
set(gca,'XDir','normal')
set(gca,'YAxisLocation','left')
set(gca,'YDir','reverse')

set(gca, 'Box', 'off', ...                                                         
         'LineWidth', 1,'GridLineStyle', '-',...                                   
         'XGrid', 'off', 'YGrid', 'off','ZGrid', 'off', ...                          
         'TickDir', 'out', 'TickLength', [0.01 0.01], 'YTickLabelRotation',-60,...                     
         'XMinorTick', 'off', 'YMinorTick', 'off',  'ZMinorTick', 'off',...         
         'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1], 'ZColor', [.1 .1 .1])    
xlim([0 expNum+1])

% axis tight

set([hXLabel, hYLabel,hZLabel], 'FontName', 'Times New Roman') % AvantGarde
set([hXLabel, hYLabel,hZLabel], 'FontSize', frontsize)

set(gca, 'FontName', 'Times New Roman') % Helvetica
set(gca, 'FontSize', frontsize)

xticks([0 5 10 15 20 25 30 35 40 45 50 55 60])
xticklabels([0 5 10 15 20 25 30 35 40 45 50 55 60])     
yticks([t])
yticklabels(text')
% yticklabelsRotation(90)
zticks([0 0.0002 0.0004 0.0006 0.0008 0.001 0.0012 0.0014 0.0016 0.0018])
zlim([0 0.0018])
% zticklabels([0 2])
pbaspect([2.5 5 1.5])

colorbar('position',[0.94 0.17 0.015 0.78]);
set (gca,'Position',[0.05 0.17 0.9 0.82])
