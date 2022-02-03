tbl = readtable('Final_combined_data_with_SINR.csv', 'PreserveVariableNames', 1);
%head(tbl,5)

X = tbl{:,:};

xvalues = {'node\_type','x\_coordinate','y\_coordinate','primary\_channel',...
     'min\_channel','max\_channel','RSSI','SINR'};
 
C = corrcoef(X);

fig = figure;
h = heatmap(C,'Colormap', jet(30),'ColorbarVisible', 'on');
%h.FontSize = 16;
set(gca, 'FontSize', 14);
h.XData = xvalues;
h.YData = xvalues;

% h = heatmap(xvalues,yvalues);

%corrplot(tbl)