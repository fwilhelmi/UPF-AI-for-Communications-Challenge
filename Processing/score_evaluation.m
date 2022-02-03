%%%
close all
clear all
clc

%% Variables
scenarios = {'test_1', 'test_2', 'test_3', 'test_4'};
aps_per_scenario = [4 6 8 10];
num_deployments = 50;

absolute_error = cell(length(scenarios), num_deployments);
absolute_error_aps = cell(length(scenarios), num_deployments);

name_participant = 'atari';

% Path to folders containing output and input files
solution_path = 'output_simulator/test_data_set/';
% Path to files submitted by participants
proposals_path = ['solutions_participants/' name_participant '/'];
% Path to input files used in simulations
input_nodes_path = 'input_node_files_test/';

%% Process each file individually
for sceid=1:length(scenarios)
    
    %disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
    disp(['%          SCENARIO ' num2str(sceid) '          %'])
    %disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
        
    filesSolution = dir([solution_path 'solution_' scenarios{sceid} '/*.csv']);
    filesParticipant = dir([proposals_path name_participant '_' scenarios{sceid} '/*.csv']);
    filesInputNodes = dir([input_nodes_path scenarios{sceid} '/*.csv']);
    
    for k=1:length(filesParticipant)    
        
        %disp([' - Evaluating deployment ' num2str(k) '...'])
        
        % Convert the content of each file to an array 
        outputFileName = filesParticipant(k).name;
        % Process atari
        file_ok = true;
        if (strcmp(name_participant, 'atari'))
            B = [];
            tempB = [];
            a = readtable([proposals_path name_participant '_' scenarios{sceid} '/' outputFileName], ...
                'Delimiter', ',', 'ReadVariableNames', false);
            if (size(a,2) == 2)
                for i = 1 : length(a.Var2)
                    tempB(i) = a.Var2(i);
                end
                B = tempB';
                file_ok = true;
            else 
                file_ok = false;
            end
        else
            data_output = fopen([proposals_path name_participant '_' scenarios{sceid} '/' outputFileName]);
            A = textscan(data_output,'%s','Delimiter',',;');
            B = str2double(A{:});
        end
        
        % Find the deployment ID to compare with the input
        split1 = strsplit(outputFileName,'_');
        split2 = strsplit(split1{3},'.');
        deploymentId = str2double(split2{1});
        
        % Process the solution
        solutionFileName = filesSolution(k).name;
        data_solution = fopen([solution_path 'solution_' scenarios{sceid} '/' solutionFileName]);
        C = textscan(data_solution,'%s','Delimiter',',;');
        D = str2double(C{:});     
        
        % Process the input
        inputFileName = filesInputNodes(deploymentId).name;
        datatable2 = readtable(inputFileName, 'ReadVariableNames', false);  %or true if there is a header
        numRowsInput = height(datatable2);    
        % Get location of APs
        ap_locations = [];
        for i = 1:numRowsInput
            if contains(datatable2{i,1}, 'AP')
                ap_locations = [ap_locations i];
            end
        end

%         fclose(data_output);
%         fclose(data_solution);
        
        % Fill with 0s files that contain errors
        if ~file_ok
            disp(['Error with file ' outputFileName])
            B = zeros(numRowsInput,1);
        end

        if length(B) == aps_per_scenario(sceid) % Only throughput of APs is provided
            absolute_error_aps{sceid,deploymentId} = abs(B-D(ap_locations));
        elseif length(B) == numRowsInput % The throughput of all the devices is provided
            absolute_error{sceid,deploymentId} = abs(B-D);
            AUX1 = D;
            AUX1(ap_locations) = 0;
            MEAN_TPT_STA(sceid,k) = mean(AUX1(AUX1>0));
            STD_TPT_STA(sceid,k) = std(AUX1(AUX1>0));
            absolute_error_aps{sceid,deploymentId} = abs(B(ap_locations)-D(ap_locations));
        else % Unknown situation
            disp(['An issue occurred with file: ' outputFileName])            
        end

    end
end

%fclose('all');

%% Process results and display score (plot results)
mean_error = zeros(1, length(scenarios));
std_error = zeros(1, length(scenarios));
stacked_error = cell(1, length(scenarios));
for sceid=1:length(scenarios)
    % absolute_error
    % absolute_error_aps
    stacked_error{sceid} = [];
    for k=1:num_deployments
        stacked_error{sceid} = [stacked_error{sceid}; absolute_error_aps{sceid,k}];
    end
    mean_error(sceid) = abs(mean(stacked_error{sceid}));
    std_error(sceid) = std(stacked_error{sceid});
    rmse(sceid) = sqrt(mean(stacked_error{sceid}.^2));
    mse(sceid) = mean(stacked_error{sceid}.^2);
end

save(['results_' name_participant], 'mean_error', 'std_error', 'rmse', 'mse')

%save('results_atari_sta','stacked_error')

%% Plot CDFs
fig = figure('pos',[450 400 500 350]);
ecdf(abs(stacked_error{1}))%,'Bounds','on')
hold on
ecdf(abs(stacked_error{2}))%,'Bounds','on')
ecdf(abs(stacked_error{3}))%,'Bounds','on')
ecdf(abs(stacked_error{4}))%,'Bounds','on')
axis([0 max([max(stacked_error{1}) max(stacked_error{2}) ...
    max(stacked_error{3}) max(stacked_error{4})]) 0 1])
xlabel('Prediction error [Mbps]')
ylabel('Empirical CDF(err)')
set(gca, 'FontSize', 18)
grid on
grid minor
ax = gca;
ax.GridAlpha = 0.5;
legend({'Sce1', 'Sce2', 'Sce3', 'Sce4'})

%%
fig = figure('pos',[450 400 500 350]);
histogram(stacked_error{1})
hold on
histogram(stacked_error{2})
histogram(stacked_error{3})
histogram(stacked_error{4})
xlabel('Error [Mbps]')
ylabel('# Counts')
set(gca, 'FontSize', 18)
grid on
grid minor
legend({'Sce1', 'Sce2', 'Sce3', 'Sce4'})

%% Display table with average results
disp('-----------------------------------')
disp('| SCE_ID |MAE [Mbps]|RMSE [Mbps^2]|MSE [Mbps^2]|')
disp('-----------------------------------')
disp(['|  Sce1  |  ' num2str(mean_error(1)) '  |   ' num2str(rmse(1)) '    |'  num2str(mse(1)) '    |'])
disp('-----------------------------------')
disp(['|  Sce2  |  ' num2str(mean_error(2)) '  |   ' num2str(rmse(2)) '    |'  num2str(mse(2)) '    |'])
disp('-----------------------------------')
disp(['|  Sce3  |  ' num2str(mean_error(3)) '  |   ' num2str(rmse(3)) '    |'  num2str(mse(3)) '    |'])
disp('-----------------------------------')
disp(['|  Sce4  |  ' num2str(mean_error(4)) '  |   ' num2str(rmse(4)) '    |'  num2str(mse(4)) '    |'])
disp('-----------------------------------')

%% Plot average results
fig = figure('pos',[450 400 550 400]);
subplot(1,2,1)
bar(mean_error)
hold on
errorbar(mean_error, std_error, 'r.','linewidth',2.0)
xlabel('Scenario ID')
ylabel('MAE (Mbps)')
set(gca, 'FontSize', 18)
axis([0 5 0 max(max(mean_error)+max(std_error), max(rmse))])
grid on
grid minor
ax = gca;
ax.GridAlpha = 0.5;
subplot(1,2,2)
bar(rmse)
xlabel('Scenario ID')
ylabel('RMSE (Mbps^2)')
set(gca, 'FontSize', 18)
axis([0 5 0 max(max(mean_error)+max(std_error), max(rmse))])
grid on
grid minor
ax = gca;
ax.GridAlpha = 0.5;


fig = figure('pos',[450 400 550 400]);
boxplot(MEAN_TPT_STA');
grid on
grid minor
xlabel('Test scenario ID')
ylabel('Mean throughput (Mbps)')
set(gca, 'FontSize', 18)