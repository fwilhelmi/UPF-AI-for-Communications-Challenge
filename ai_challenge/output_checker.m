%%%
close all
clear all
clc

test_result = 'SUCCESS';

%%%% SCE 1a

num_aps = 12;

% Path to folders containing output and input files
output_path = 'output_simulator/processed_output/sce1a_output';
filesOutput = dir([output_path '/*.csv']); 
input_path = 'input_node_files/sce1a/';
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
    if contains(outputFileName,"throughput") || contains(outputFileName,"rssi")
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

%%%% SCE 1b

num_aps = 12;

% Path to folders containing output and input files
output_path = 'output_simulator/processed_output/sce1b_output';
filesOutput = dir([output_path '/*.csv']); 
input_path = 'input_node_files/sce1b/';
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
    if contains(outputFileName,"throughput") || contains(outputFileName,"rssi")
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

%%%% SCE 1c

num_aps = 12;

% Path to folders containing output and input files
output_path = 'output_simulator/processed_output/sce1c_output';
filesOutput = dir([output_path '/*.csv']); 
input_path = 'input_node_files/sce1c/';
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
    if contains(outputFileName,"throughput") || contains(outputFileName,"rssi")
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

%%%% SCE 2a

num_aps = 8;

% Path to folders containing output and input files
%output_path = 'output_simulator/sce2c_output';
output_path = 'output_simulator/processed_output/sce2a_output';
filesOutput = dir([output_path '/*.csv']); 
input_path = 'input_node_files/sce2a/';
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

%%%% SCE 2b

num_aps = 8;

% Path to folders containing output and input files
output_path = 'output_simulator/processed_output/sce2ba_output';
filesOutput = dir([output_path '/*.csv']); 
input_path = 'input_node_files/sce2b/';
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

%%%% SCE 2c

num_aps = 8;

% Path to folders containing output and input files
%output_path = 'output_simulator/sce2c_output';
output_path = 'output_simulator/processed_output/sce2ca_output';
filesOutput = dir([output_path '/*.csv']); 
input_path = 'input_node_files/sce2c/';
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