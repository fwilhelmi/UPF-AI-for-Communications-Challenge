%%%
close all
clear all
clc

%% Variables

name_participants = {'atari','ramon','stc','netcom','net_intels_5'};

mean_error_all = [];
std_error_all = [];
rmse_all = [];
for i = 1 : length(name_participants)
    load(['results_' name_participants{i}])
    mean_error_all(i,:) = mean_error;
    std_error_all(i,:) = std_error;
    rmse_all(i,:) = rmse;
end

%% Plot average results
fig = figure('pos',[450 400 550 400]);
% subplot(1,2,1)
bar(mean_error_all')
%hold on
%errorbar(mean_error_all', std_error_all', 'r.','linewidth',2.0)
xlabel('Test scenario id.')
ylabel('MAE (Mbps)')
set(gca, 'FontSize', 18)
axis([0 5 0 100])
grid on
grid minor
ax = gca;
ax.GridAlpha = 0.5;
legend({'ATARI', 'RAMON', 'STC', 'NETCOM', 'NET INTELS'},'NumColumns',3)


