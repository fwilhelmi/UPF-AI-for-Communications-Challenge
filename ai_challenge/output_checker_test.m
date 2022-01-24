close all
clear all
clc

disp('Running the output checker of the 2021 dataset ...')

% Default result
test_result = 'SUCCESS';

sce_id = 2;

%% SCE 1 (M = 2)

% Path to folders containing output and input files
output_path = ['output_simulator_2021/output_11ax_sr_simulations_test.txt'];

% Convert the content of each file to an array 
data_output = fopen(output_path);
A = textscan(data_output,'%s','Delimiter',';');
B = str2double(A{:});    

% Store data to analyze the dataset
array_tpt = [];
array_interf = [];
array_rssi = [];
array_sinr = [];

array_ap_stas = [];

%%
% Iterate for each subscenario
for i = 1 : length(A{1})    
    % Read scenario id
    line = A{1}(i);
    if contains(line,'KOMONDOR')   
        row = 1;
        split1 = strsplit(line{1},'_');       
        split2 = strsplit(split1{5},'s');
        sceid = str2double(split2{2});
        split3 = strsplit(split1{6},'c'); 
        split4 = strsplit(split3{2},'.');
        obsspd = str2double(split4{1});
        
        % Process the input
        inputFileName = ['simulator_input_files_test/input_nodes_test_s'...
            num2str(sprintf('%03d', sceid)) '_c' num2str(obsspd) '.csv'];
        datatable2 = readtable(inputFileName, 'ReadVariableNames', false);  %or true if there is a header
        numRowsInput = height(datatable2);
        nAps = 0;
        nStas = 0;
        for j = 1 : numRowsInput
            if contains(datatable2{j,1},'AP')
                nAps = nAps + 1;
            elseif contains(datatable2{j,1},'STA') && nAps == 1
                nStas = nStas + 1;
            end
        end
        array_ap_stas = [array_ap_stas; [nAps, nStas]];
    else
        split1 = strsplit(line{1},',');
        val = str2double(split1);
        % Check NaN values
        if sum(isnan(val)) > 0
            disp(['NaN value in row ' num2str(i)]); 
        end
        % Check the length of each param
        if (row == 1) % per-STA throughput
            if length(val) ~= nStas
                disp(['Error with per-STA throughput in row ' num2str(i)]); 
                test_result = 'FAIL';
            else
                array_tpt = [array_tpt val];
            end
        elseif (row == 2) % AP interference
            if length(val) ~= nAps-1
                disp(['Error with AP interference in row ' num2str(i)]); 
                test_result = 'FAIL';
            else
                array_interf = [array_interf val];
            end
        elseif (row == 3) % per-STA RSSI
            if length(val) ~= nStas
                disp(['Error with per-STA RSSI in row ' num2str(i)]); 
                test_result = 'FAIL';
            else
                array_rssi = [array_rssi val];
            end
        elseif (row == 4) % per-STA SINR
            if length(val) ~= nStas
                disp(['Error with per-STA SINR in row ' num2str(i)]); 
                test_result = 'FAIL';
            else
                array_sinr = [array_sinr val];
            end
        end
        row = row + 1;
    end
end
fclose(data_output);
fclose('all');
%%

figure
subplot(2,2,1)
histogram(array_tpt)
xlabel('Throughput [Mbps]')
ylabel('# counts')
title('Throughput')
set(gca,'fontsize',16)
grid on
grid minor

subplot(2,2,2)
histogram(array_interf)
xlabel('AP interference [dBm]')
ylabel('# counts')
set(gca,'fontsize',16)
title('Inter-AP Interference')
grid on
grid minor

subplot(2,2,3)
histogram(array_rssi)
xlabel('RSSI [dBm]')
ylabel('# counts')
set(gca,'fontsize',16)
title('RSSI')
grid on
grid minor

subplot(2,2,4)
histogram(array_sinr)
xlabel('SINR [dB]')
ylabel('# counts')
set(gca,'fontsize',16)
title('SINR')
grid on
grid minor