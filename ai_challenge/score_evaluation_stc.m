%%%
close all
clear all
clc

warning('off')
rmpath('folderthatisnotonpath')

%% Variables
scenarios = {'test_1', 'test_2', 'test_3', 'test_4'};
aps_per_scenario = [4 6 8 10];
num_deployments = 50;

absolute_error = cell(length(scenarios), num_deployments);
absolute_error_aps = cell(length(scenarios), num_deployments);

name_participant = 'stc';

% Path to folders containing output and input files
solution_path = 'output_simulator/test_data_set/';
% Path to files submitted by participants
proposals_path = ['solutions_participants/' name_participant '/'];
% Path to input files used in simulations
input_nodes_path = 'input_node_files_test/';

%% Process each file individually
for sceid=1:1%length(scenarios)
    
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
    disp(['%          SCENARIO ' num2str(sceid) '          %'])
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
        
    filesSolution = dir([solution_path 'solution_' scenarios{sceid} '/*.csv']);
    filesInputNodes = dir([input_nodes_path scenarios{sceid} '/*.csv']);
    ix = 1;
    B = [];
    for k=1:1%50   
        
        file_ok = true;
        
        disp([' - Evaluating deployment ' num2str(k) '...'])
        
        % Process the input
        inputFileName = filesInputNodes(k).name;
        datatable2 = readtable(inputFileName, 'ReadVariableNames', false);  %or true if there is a header
        numRowsInput = height(datatable2) - 1;    
        % Get location of APs
        ap_locations = [];
        sta_locations = [];
        for i = 1:numRowsInput+1
            if contains(datatable2{i,1}, 'AP')
                ap_locations = [ap_locations i];
            elseif contains(datatable2{i,1}, 'STA')
                sta_locations = [sta_locations i];
            end
        end
        
        % Process rows of the output belonging to the analyzed scenario
        T = readtable([proposals_path 'stc_sce' num2str(sceid) '.csv'], ...
            'Delimiter', ';');
        preprocessed_data  = T(ix:ix+numRowsInput-aps_per_scenario(sceid)-1,1);
        B = zeros(aps_per_scenario(sceid),1);
        for i = 1:size(preprocessed_data)
            tmp = preprocessed_data(i,1);
            tmp2 = tmp{1,1};
            split1 = strsplit(tmp2{1},',');
            if(contains(split1{1},'_A'))
                B(1) = B(1) + str2double(split1{2});
            elseif(contains(split1{1},'_B'))
                B(2) = B(2) + str2double(split1{2});
            elseif(contains(split1{1},'_C'))
                B(3) = B(3) + str2double(split1{2});
            elseif(contains(split1{1},'_D'))
                B(4) = B(4) + str2double(split1{2});
            elseif(contains(split1{1},'_E'))
                B(5) = B(5) + str2double(split1{2});
            elseif(contains(split1{1},'_F'))
                B(6) = B(6) + str2double(split1{2});
            elseif(contains(split1{1},'_G'))
                B(7) = B(7) + str2double(split1{2});
            elseif(contains(split1{1},'_H'))
                B(8) = B(8) + str2double(split1{2});
            elseif(contains(split1{1},'_I'))
                B(9) = B(9) + str2double(split1{2});
            elseif(contains(split1{1},'_J'))
                B(10) = B(10) + str2double(split1{2});
            end
        end  
                           
        % Process the solution
        solutionFileName = ['throughput_' num2str(k) '.csv'];
        data_solution = fopen([solution_path 'solution_' scenarios{sceid} '/' solutionFileName]);
        C = textscan(data_solution,'%s','Delimiter',',;');
        D = str2double(C{:});     

        % Fill with 0s files that contain errors
        if ~file_ok
            disp(['Error with file ' outputFileName])
            B = zeros(numRowsInput,1);
        end

        if length(B) == aps_per_scenario(sceid) % Only throughput of APs is provided
            absolute_error_aps{sceid,k} = abs(B-D(ap_locations));
        else % Unknown situation
            disp(['An issue occurred with file: ' outputFileName])            
        end
        
        ix = ix+numRowsInput-aps_per_scenario(sceid);

    end
end

fclose('all');

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
    length(stacked_error{sceid});
    mean_error(sceid) = abs(mean(stacked_error{sceid}));
    std_error(sceid) = std(stacked_error{sceid});
    rmse(sceid) = sqrt(mean(stacked_error{sceid}.^2));
end

%% Display table with average results
disp('-----------------------------------')
disp('| SCE_ID |MAE [Mbps]|RMSE [Mbps^2]|')
disp('-----------------------------------')
disp(['|  Sce1  |  ' num2str(mean_error(1)) '  |   ' num2str(rmse(1)) '    |'])
disp('-----------------------------------')
disp(['|  Sce2  |  ' num2str(mean_error(2)) '  |   ' num2str(rmse(2)) '    |'])
disp('-----------------------------------')
disp(['|  Sce3  |  ' num2str(mean_error(3)) '  |   ' num2str(rmse(3)) '    |'])
disp('-----------------------------------')
disp(['|  Sce4  |  ' num2str(mean_error(4)) '  |   ' num2str(rmse(4)) '    |'])
disp('-----------------------------------')

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

%% Histiogram error
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

%% Boxplot error
fig = figure('pos',[450 400 500 350]);

x = [stacked_error{1}; stacked_error{2}; stacked_error{3}; stacked_error{4}];

g = [ones(length(stacked_error{1}), 1); 2*ones(length(stacked_error{2}), 1); ...
    3*ones(length(stacked_error{3}), 1); 4*ones(length(stacked_error{4}), 1)];
boxplot(x, g)
xlabel('Scenario ID')
ylabel('Error [Mbps]')
set(gca, 'FontSize', 18)
grid on
grid minor

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
