close all
clear all
clc

team_names = {'predictions', 'FederationS', 'fedipc', 'WirelessAI'};

figure
for i = 1 : length(team_names)
    load(['error_' team_names{i} '.mat'])
    bss_error{i} = err;
    cdfplot(abs(bss_error{i}))
    hold on
end
ylabel('CDF')
xlabel('Error (Mbps)')
set(gca,'fontsize',16)
grid on
grid minor
legend(team_names)