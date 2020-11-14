%%%
close all
clear all
clc

test_result = 'SUCCESS';

%%%% SCE 1

num_aps = 4;

% Path to folders containing output and input files
output_path = 'output_simulator/processed_output/test_output_sce1';
filesOutput = dir([output_path '/*.csv']); 
input_path = 'input_node_files_test/test_1/';
filesInput = dir([input_path '/*.csv']); 

% Process each output file individually
for k=1:length(filesOutput)    
    
    % Convert the content of each file to an array 
    outputFileName = filesOutput(k).name;
    data_output = fopen([output_path '/' outputFileName]);
    A = textscan(data_output,'%s','Delimiter',',;');
    B = str2double(A{:});    
    datatable1 = readtable([output_path '/' outputFileName], 'ReadVariableNames', false);  %or true if there is a header
    numRowsOutput = height(datatable1);
    numColsOutput = width(datatable1); 
            
    % Find the deployment ID to compare with the input
    split1 = strsplit(outputFileName,'_');
    split2 = strsplit(split1{2},'.');
    deploymentId = str2double(split2{1});
    
    % Process the input
    inputFileName = filesInput(deploymentId).name;
    datatable2 = readtable(inputFileName, 'ReadVariableNames', false);  %or true if there is a header
    numRowsInput = height(datatable2) - 1;
    
    fclose(data_output);
    
    % Sanity checks
    if contains(outputFileName,"throughput") || contains(outputFileName,"rssi") || contains(outputFileName,"sinr")
        if length(B) ~= numRowsInput
            disp("ALERT!")
            disp(inputFileName)
            disp(outputFileName)
            test_result = 'FAIL';
        end
    elseif contains(outputFileName,"interference")
        if numRowsOutput ~= num_aps || numColsOutput ~= num_aps
            disp("ALERT!")
            disp(inputFileName)
            disp(outputFileName)
            test_result = 'FAIL';
        end
    end       
    
end

fclose('all');

%%%% SCE 2

num_aps = 6;

% Path to folders containing output and input files
output_path = 'output_simulator/processed_output/test_output_sce2';
filesOutput = dir([output_path '/*.csv']); 
input_path = 'input_node_files_test/test_2/';
filesInput = dir([input_path '/*.csv']);  

% Process each output file individually
for k=1:length(filesOutput)    
    
    % Convert the content of each file to an array 
    outputFileName = filesOutput(k).name;
    data_output = fopen([output_path '/' outputFileName]);
    A = textscan(data_output,'%s','Delimiter',',;');
    B = str2double(A{:});    
    datatable1 = readtable([output_path '/' outputFileName], 'ReadVariableNames', false);  %or true if there is a header
    numRowsOutput = height(datatable1);
    numColsOutput = width(datatable1); 
            
    % Find the deployment ID to compare with the input
    split1 = strsplit(outputFileName,'_');
    split2 = strsplit(split1{2},'.');
    deploymentId = str2double(split2{1});
    
    % Process the input
    inputFileName = filesInput(deploymentId).name;
    datatable2 = readtable(inputFileName, 'ReadVariableNames', false);  %or true if there is a header
    numRowsInput = height(datatable2) - 1;    
    
    fclose(data_output);
    
    % Sanity checks
    if contains(outputFileName,"throughput") || contains(outputFileName,"rssi") || contains(outputFileName,"sinr")
        if length(B) ~= numRowsInput
            disp("ALERT!")
            disp(inputFileName)
            disp(outputFileName)
            disp(length(B))
            disp(numRowsInput)
            test_result = 'FAIL';
        end
    elseif contains(outputFileName,"interference")
        if numRowsOutput ~= num_aps || numColsOutput ~= num_aps
            disp("ALERT!")
            disp(inputFileName)
            disp(outputFileName)
            test_result = 'FAIL';
        end
    end       
    
end

fclose('all');

%%%% SCE 3

num_aps = 8;

% Path to folders containing output and input files
output_path = 'output_simulator/processed_output/test_output_sce3';
filesOutput = dir([output_path '/*.csv']); 
input_path = 'input_node_files_test/test_3/';
filesInput = dir([input_path '/*.csv']);  

% Process each output file individually
for k=1:length(filesOutput)    
    
    % Convert the content of each file to an array 
    outputFileName = filesOutput(k).name;
    data_output = fopen([output_path '/' outputFileName]);
    A = textscan(data_output,'%s','Delimiter',',;');
    B = str2double(A{:});    
    datatable1 = readtable([output_path '/' outputFileName], 'ReadVariableNames', false);  %or true if there is a header
    numRowsOutput = height(datatable1);
    numColsOutput = width(datatable1); 
            
    % Find the deployment ID to compare with the input
    split1 = strsplit(outputFileName,'_');
    split2 = strsplit(split1{2},'.');
    deploymentId = str2double(split2{1});
    
    % Process the input
    inputFileName = filesInput(deploymentId).name;
    datatable2 = readtable(inputFileName, 'ReadVariableNames', false);  %or true if there is a header
    numRowsInput = height(datatable2) - 1;
    
    fclose(data_output);
    
    % Sanity checks
    if contains(outputFileName,"throughput") || contains(outputFileName,"rssi") || contains(outputFileName,"sinr")
        if length(B) ~= numRowsInput
            disp("ALERT!")
            disp(inputFileName)
            disp(outputFileName)
            test_result = 'FAIL';
        end
    elseif contains(outputFileName,"interference")
        if numRowsOutput ~= num_aps || numColsOutput ~= num_aps
            disp("ALERT!")
            disp(inputFileName)
            disp(outputFileName)
            test_result = 'FAIL';
        end
    end       
    
end

fclose('all');

%%%% SCE 4

num_aps = 10;

% Path to folders containing output and input files
output_path = 'output_simulator/processed_output/test_output_sce4';
filesOutput = dir([output_path '/*.csv']); 
input_path = 'input_node_files_test/test_4/';
filesInput = dir([input_path '/*.csv']);  

% Process each output file individually
for k=1:length(filesOutput)    
    
    % Convert the content of each file to an array 
    outputFileName = filesOutput(k).name;
    data_output = fopen([output_path '/' outputFileName]);
    A = textscan(data_output,'%s','Delimiter',',;');
    B = str2double(A{:});    
    datatable1 = readtable([output_path '/' outputFileName], 'ReadVariableNames', false);  %or true if there is a header
    numRowsOutput = height(datatable1);
    numColsOutput = width(datatable1); 
            
    % Find the deployment ID to compare with the input
    split1 = strsplit(outputFileName,'_');
    split2 = strsplit(split1{2},'.');
    deploymentId = str2double(split2{1});
    
    % Process the input
    inputFileName = filesInput(deploymentId).name;
    datatable2 = readtable(inputFileName, 'ReadVariableNames', false);  %or true if there is a header
    numRowsInput = height(datatable2) - 1;
    
    fclose(data_output);
    
    % Sanity checks
    if contains(outputFileName,"throughput") || contains(outputFileName,"rssi") || contains(outputFileName,"sinr")
        if length(B) ~= numRowsInput
            disp("ALERT!")
            disp(inputFileName)
            disp(outputFileName)
            test_result = 'FAIL';
        end
    elseif contains(outputFileName,"interference")
        if numRowsOutput ~= num_aps || numColsOutput ~= num_aps
            disp("ALERT!")
            disp(inputFileName)
            disp(outputFileName)
            test_result = 'FAIL';
        end
    end       
    
end

fclose('all');

%%%% RESULTS
disp(['Test result = ' test_result])