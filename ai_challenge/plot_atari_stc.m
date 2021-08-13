%%%
close all
clear all
clc

%% Variables

load('results_atari_sta')
stacked_error_atari = stacked_error;

clear stacked_error

load('results_stc_sta')
stacked_error_stc = stacked_error;

clear stacked_error

load('results_netintels_sta')
stacked_error_net = stacked_error;

%%
% h1 = histogram(stacked_error_atari{1},50);
% hold on
% h2 = histogram(stacked_error_atari{2},50);
% h3 = histogram(stacked_error_atari{3},50);
% h4 = histogram(stacked_error_atari{4},50);
% 
% h5 = histogram(stacked_error_stc{1},50);
% hold on
% h6 = histogram(stacked_error_stc{2},50);
% h7 = histogram(stacked_error_stc{3},50);
% h8 = histogram(stacked_error_stc{4},50);
% 
% %
% p1 = histcounts(stacked_error_atari{1},50,'Normalization','pdf');
% p2 = histcounts(stacked_error_atari{2},50,'Normalization','pdf');
% p3 = histcounts(stacked_error_atari{3},50,'Normalization','pdf');
% p4 = histcounts(stacked_error_atari{4},50,'Normalization','pdf');
% p5 = histcounts(stacked_error_atari{1},50,'Normalization','pdf');
% p6 = histcounts(stacked_error_atari{2},50,'Normalization','pdf');
% p7 = histcounts(stacked_error_atari{3},50,'Normalization','pdf');
% p8 = histcounts(stacked_error_atari{4},50,'Normalization','pdf');
% % plot it
% figure
% subplot(1,2,1)
% binCenters = h1.BinEdges + (h1.BinWidth/2);
% plot(binCenters(1:end-1), p1,'linewidth',2.0)
% hold on
% plot(binCenters(1:end-1), p2,'linewidth',2.0)
% plot(binCenters(1:end-1), p3,'linewidth',2.0)
% plot(binCenters(1:end-1), p4,'linewidth',2.0)
% grid on
% grid minor
% subplot(1,2,2)
% binCenters = h5.BinEdges + (h5.BinWidth/2);
% plot(binCenters(1:end-1), p5,'linewidth',2.0)
% hold on
% plot(binCenters(1:end-1), p6,'linewidth',2.0)
% plot(binCenters(1:end-1), p7,'linewidth',2.0)
% plot(binCenters(1:end-1), p8,'linewidth',2.0)
% grid on
% grid minor

raw_data_atari = [];
raw_data_stc = [];
sce1_atari = stacked_error_atari{1};
sce1_stc = stacked_error_stc{1};
sce2_atari = stacked_error_atari{2};
sce2_stc = stacked_error_stc{2};
sce3_atari = stacked_error_atari{3};
sce3_stc = stacked_error_stc{3};
sce4_atari = stacked_error_atari{4};
sce4_stc = stacked_error_stc{4};

sce1_net = stacked_error_net{1};
sce2_net = stacked_error_net{2};
sce3_net = stacked_error_net{3};
sce4_net = stacked_error_net{4};

%%
thr = 10;
% ATARI
[f, x] = ecdf(sce1_atari);
n = sum(x<thr);
percentage_atari(1) = n/length(x);

[f, x] = ecdf(sce2_atari);
n = sum(x<thr);
percentage_atari(2) = n/length(x);

[f, x] = ecdf(sce3_atari);
n = sum(x<thr);
percentage_atari(3) = n/length(x);

[f, x] = ecdf(sce4_atari);
n = sum(x<thr);
percentage_atari(4) = n/length(x);

% STC
[f, x] = ecdf(sce1_stc);
n = sum(x<thr);
percentage_stc(1) = n/length(x);

[f, x] = ecdf(sce2_stc);
n = sum(x<thr);
percentage_stc(2) = n/length(x);

[f, x] = ecdf(sce3_stc);
n = sum(x<thr);
percentage_stc(3) = n/length(x);

[f, x] = ecdf(sce4_stc);
n = sum(x<thr);
percentage_stc(4) = n/length(x);

% Net Intels
[f, x] = ecdf(sce1_net);
n = sum(x<thr);
percentage_net(1) = n/length(x);

[f, x] = ecdf(sce2_net);
n = sum(x<thr);
percentage_net(2) = n/length(x);

[f, x] = ecdf(sce3_net);
n = sum(x<thr);
percentage_net(3) = n/length(x);

[f, x] = ecdf(sce4_net);
n = sum(x<thr);
percentage_net(4) = n/length(x);

percentage_atari
percentage_stc
percentage_net

%%
for i = 1 : size(stacked_error_atari,2)
    raw_data_atari = [raw_data_atari; stacked_error_atari{i}];
    raw_data_stc = [raw_data_stc; stacked_error_stc{i}];
end

% h1 = histogram(raw_data_atari(:),50);
% hold on
% h2 = histogram(raw_data_stc(:),50);
% 
% p1 = histcounts(raw_data_atari(:), 50,'Normalization','pdf');
% p2 = histcounts(raw_data_stc(:), 50,'Normalization','pdf');
% figure
% plot(p1,'x--','linewidth',2.0)
% hold on
% plot(p2,'o-','linewidth',2.0)
% xlabel('Prediction error in STAs (Mbps)')
% ylabel('Empirical PDF')
% legend({'ATARI','STC'})
% grid on
% grid minor
% set(gca,'fontsize',16)

%%
p1 = histcounts(sce1_atari(:), 50,'Normalization','pdf');
p2 = histcounts(sce1_stc(:), 50,'Normalization','pdf');
p3 = histcounts(sce2_atari(:), 50,'Normalization','pdf');
p4 = histcounts(sce2_stc(:), 50,'Normalization','pdf');
p5 = histcounts(sce3_atari(:), 50,'Normalization','pdf');
p6 = histcounts(sce3_stc(:), 50,'Normalization','pdf');
p7 = histcounts(sce4_atari(:), 50,'Normalization','pdf');
p8 = histcounts(sce4_stc(:), 50,'Normalization','pdf');
figure
subplot(2,2,1)
h1 = histogram(sce1_atari(:),50);
%plot(p1,'o--','linewidth',2.0,'markersize',5)
hold on
h5 = histogram(sce1_stc(:),50);
h9 = histogram(sce1_net(:),50);
%plot(p2,'o-','linewidth',2.0,'markersize',5)
grid on
grid minor
set(gca,'fontsize',16)
title('test1')
xlabel('Prediction error (Mbps)')
ylabel('# Counts')
legend({'ATARI','STC','NET INTELS'})
axis([0 100 0 2000])
%axis([0 60 0 0.14])
subplot(2,2,2)
h2 = histogram(sce2_atari(:),50);
%plot(p3,'x--','linewidth',2.0,'markersize',5)
hold on
h6 = histogram(sce2_stc(:),50);
h10 = histogram(sce2_net(:),50);
%plot(p4,'x-','linewidth',2.0,'markersize',5)
grid on
grid minor
set(gca,'fontsize',16)
title('test2')
xlabel('Prediction error (Mbps)')
ylabel('# Counts')
legend({'ATARI','STC','NET INTELS'})
axis([0 100 0 2000])
%axis([0 60 0 0.14])
subplot(2,2,3)
h3 = histogram(sce3_atari(:),50);
%plot(p5,'s--','linewidth',2.0,'markersize',5)
hold on
h7 = histogram(sce3_stc(:),50);
h11 = histogram(sce3_net(:),50);
%plot(p6,'s-','linewidth',2.0,'markersize',5)
grid on
grid minor
set(gca,'fontsize',16)
title('test3')
xlabel('Prediction error (Mbps)')
ylabel('# Counts')
legend({'ATARI','STC','NET INTELS'})
axis([0 100 0 2000])
%axis([0 60 0 0.14])
subplot(2,2,4)
h4 = histogram(sce4_atari(:),50);
%plot(p7,'d--','linewidth',2.0,'markersize',5)
hold on
h8 = histogram(sce4_stc(:),50);
h12 = histogram(sce4_net(:),50);
alpha(.5)
%plot(p8,'d-','linewidth',2.0,'markersize',5)
grid on
grid minor
set(gca,'fontsize',16)
axis([0 100 0 2000])
%axis([0 60 0 0.14])
title('test4')
xlabel('Prediction error (Mbps)')
%ylabel('Empirical PDF')
ylabel('# Counts')
legend({'ATARI','STC','NET INTELS'})

   
% fig = figure('pos',[450 400 500 350]);
% subplot(1,2,1)
% histfit(stacked_error_atari{1})
% hold on
% histfit(stacked_error_atari{2})
% histfit(stacked_error_atari{3})
% histfit(stacked_error_atari{4})
% xlabel('Error [Mbps]')
% ylabel('# Counts')
% set(gca, 'FontSize', 18)
% grid on
% grid minor
% legend({'Sce1', 'Sce2', 'Sce3', 'Sce4'})
% subplot(1,2,2)
% histogram(stacked_error_stc{1})
% hold on
% histogram(stacked_error_stc{2})
% histogram(stacked_error_stc{3})
% histogram(stacked_error_stc{4})
% xlabel('Error [Mbps]')
% ylabel('# Counts')
% set(gca, 'FontSize', 18)
% grid on
% grid minor

% %% Boxplot error
% fig = figure('pos',[450 400 500 350]);
% 
% x = [stacked_error{1}; stacked_error{2}; stacked_error{3}; stacked_error{4}];
% 
% g = [ones(length(stacked_error{1}), 1); 2*ones(length(stacked_error{2}), 1); ...
%     3*ones(length(stacked_error{3}), 1); 4*ones(length(stacked_error{4}), 1)];
% boxplot(x, g)
% xlabel('Scenario ID')
% ylabel('Error [Mbps]')
% set(gca, 'FontSize', 18)
% grid on
% grid minor

