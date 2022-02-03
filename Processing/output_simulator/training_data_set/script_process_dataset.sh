##################
#### Scenario 1
##################

NUM_APS=12

#### Sce1a
DEPLOYMENT_ID=0
output_folder="sce1a_output"
input="script_output_sce1a.txt"
sce_id="sce1a"
if [ -d "$output_folder" ]; then rm -Rf $output_folder; fi
mkdir -p $output_folder
while IFS= read -r line
do
  if [[ $line == *"KOMONDOR SIMULATION"* ]]; then
    DEPLOYMENT_ID=$((DEPLOYMENT_ID+1))
    line_id=1
  else
    # Remove separators
    line="${line//\{}"
    line="${line//\}}"
    last_line=$((3+$NUM_APS))
    # Throughput (label 1)
    if [[ $line_id -eq 1 ]]; then
	printf $line | paste -sd ',' >> $output_folder/throughput_$sce_id_$DEPLOYMENT_ID.csv
    # Airtime (label 2)    
    elif [[ $line_id -eq 2 ]]; then
        printf $line | paste -sd ',' >> $output_folder/airtime_$sce_id_$DEPLOYMENT_ID.csv    
    # RSSI list (feature 1)    
    elif [[ $line_id -eq 3 ]]; then    
        printf $line | paste -sd ',' >> $output_folder/rssi_$sce_id_$DEPLOYMENT_ID.csv 
    # Interference map (feature 2)   
    elif [[ $line_id -gt 3 && $line_id -le $last_line ]]; then
	echo $line >> $output_folder/interference_$sce_id_$DEPLOYMENT_ID.csv
    # Average SINR (feature 3)
    elif [[ $line_id -gt $last_line ]]; then
	printf $line | paste -sd ',' >> $output_folder/sinr_$sce_id_$DEPLOYMENT_ID.csv 
    fi
    line_id=$((line_id+1))
  fi
done < "$input"

#### Sce1b
DEPLOYMENT_ID=0
output_folder="sce1b_output"
input="script_output_sce1b.txt"
sce_id="sce1b"
if [ -d "$output_folder" ]; then rm -Rf $output_folder; fi
mkdir -p $output_folder
while IFS= read -r line
do
  if [[ $line == *"KOMONDOR SIMULATION"* ]]; then
    DEPLOYMENT_ID=$((DEPLOYMENT_ID+1))
    line_id=1
  else
    # Remove separators
    line="${line//\{}"
    line="${line//\}}"
    last_line=$((3+$NUM_APS))
    # Throughput (label 1)
    if [[ $line_id -eq 1 ]]; then
	printf $line | paste -sd ',' >> $output_folder/throughput_$sce_id_$DEPLOYMENT_ID.csv
    # Airtime (label 2)    
    elif [[ $line_id -eq 2 ]]; then
        printf $line | paste -sd ',' >> $output_folder/airtime_$sce_id_$DEPLOYMENT_ID.csv    
    # RSSI list (feature 1)    
    elif [[ $line_id -eq 3 ]]; then    
        printf $line | paste -sd ',' >> $output_folder/rssi_$sce_id_$DEPLOYMENT_ID.csv 
    # Interference map (feature 2)   
    elif [[ $line_id -gt 3 && $line_id -le $last_line ]]; then
	echo $line >> $output_folder/interference_$sce_id_$DEPLOYMENT_ID.csv
    # Average SINR (feature 3)
    elif [[ $line_id -gt $last_line ]]; then
	printf $line | paste -sd ',' >> $output_folder/sinr_$sce_id_$DEPLOYMENT_ID.csv 
    fi
    line_id=$((line_id+1))
  fi
done < "$input"

#### Sce1c
DEPLOYMENT_ID=0
output_folder="sce1c_output"
input="script_output_sce1c.txt"
sce_id="sce1c"
if [ -d "$output_folder" ]; then rm -Rf $output_folder; fi
mkdir -p $output_folder
while IFS= read -r line
do
  if [[ $line == *"KOMONDOR SIMULATION"* ]]; then
    DEPLOYMENT_ID=$((DEPLOYMENT_ID+1))
    line_id=1
  else
    # Remove separators
    line="${line//\{}"
    line="${line//\}}"
    last_line=$((3+$NUM_APS))
    # Throughput (label 1)
    if [[ $line_id -eq 1 ]]; then
	printf $line | paste -sd ',' >> $output_folder/throughput_$sce_id_$DEPLOYMENT_ID.csv
    # Airtime (label 2)    
    elif [[ $line_id -eq 2 ]]; then
        printf $line | paste -sd ',' >> $output_folder/airtime_$sce_id_$DEPLOYMENT_ID.csv    
    # RSSI list (feature 1)    
    elif [[ $line_id -eq 3 ]]; then    
        printf $line | paste -sd ',' >> $output_folder/rssi_$sce_id_$DEPLOYMENT_ID.csv 
    # Interference map (feature 2)   
    elif [[ $line_id -gt 3 && $line_id -le $last_line ]]; then
	echo $line >> $output_folder/interference_$sce_id_$DEPLOYMENT_ID.csv
    # Average SINR (feature 3)
    elif [[ $line_id -gt $last_line ]]; then
	printf $line | paste -sd ',' >> $output_folder/sinr_$sce_id_$DEPLOYMENT_ID.csv 
    fi
    line_id=$((line_id+1))
  fi
done < "$input"

##################
#### Scenario 2
##################

NUM_APS=8

#### Sce2a
DEPLOYMENT_ID=0
output_folder="sce2a_output"
input="script_output_sce2a.txt"
sce_id="sce2a"
if [ -d "$output_folder" ]; then rm -Rf $output_folder; fi
mkdir -p $output_folder
while IFS= read -r line
do
  if [[ $line == *"KOMONDOR SIMULATION"* ]]; then
    DEPLOYMENT_ID=$((DEPLOYMENT_ID+1))
    line_id=1
  else
    # Remove separators
    line="${line//\{}"
    line="${line//\}}"
    last_line=$((3+$NUM_APS))
    # Throughput (label 1)
    if [[ $line_id -eq 1 ]]; then
	printf $line | paste -sd ',' >> $output_folder/throughput_$sce_id_$DEPLOYMENT_ID.csv
    # Airtime (label 2)    
    elif [[ $line_id -eq 2 ]]; then
        printf $line | paste -sd ',' >> $output_folder/airtime_$sce_id_$DEPLOYMENT_ID.csv    
    # RSSI list (feature 1)    
    elif [[ $line_id -eq 3 ]]; then    
        printf $line | paste -sd ',' >> $output_folder/rssi_$sce_id_$DEPLOYMENT_ID.csv 
    # Interference map (feature 2)   
    elif [[ $line_id -gt 3 && $line_id -le $last_line ]]; then
	echo $line >> $output_folder/interference_$sce_id_$DEPLOYMENT_ID.csv
    # Average SINR (feature 3)
    elif [[ $line_id -gt $last_line ]]; then
	printf $line | paste -sd ',' >> $output_folder/sinr_$sce_id_$DEPLOYMENT_ID.csv 
    fi
    line_id=$((line_id+1))
  fi
done < "$input"

#### Sce2b
DEPLOYMENT_ID=0
output_folder="sce2b_output"
input="script_output_sce2b.txt"
sce_id="sce2b"
if [ -d "$output_folder" ]; then rm -Rf $output_folder; fi
mkdir -p $output_folder
while IFS= read -r line
do
  if [[ $line == *"KOMONDOR SIMULATION"* ]]; then
    DEPLOYMENT_ID=$((DEPLOYMENT_ID+1))
    line_id=1
  else
    # Remove separators
    line="${line//\{}"
    line="${line//\}}"
    last_line=$((3+$NUM_APS))
    # Throughput (label 1)
    if [[ $line_id -eq 1 ]]; then
	printf $line | paste -sd ',' >> $output_folder/throughput_$sce_id_$DEPLOYMENT_ID.csv
    # Airtime (label 2)    
    elif [[ $line_id -eq 2 ]]; then
        printf $line | paste -sd ',' >> $output_folder/airtime_$sce_id_$DEPLOYMENT_ID.csv    
    # RSSI list (feature 1)    
    elif [[ $line_id -eq 3 ]]; then    
        printf $line | paste -sd ',' >> $output_folder/rssi_$sce_id_$DEPLOYMENT_ID.csv 
    # Interference map (feature 2)   
    elif [[ $line_id -gt 3 && $line_id -le $last_line ]]; then
	echo $line >> $output_folder/interference_$sce_id_$DEPLOYMENT_ID.csv
    # Average SINR (feature 3)
    elif [[ $line_id -gt $last_line ]]; then
	printf $line | paste -sd ',' >> $output_folder/sinr_$sce_id_$DEPLOYMENT_ID.csv 
    fi
    line_id=$((line_id+1))
  fi
done < "$input"

#### Sce2c
DEPLOYMENT_ID=0
output_folder="sce2c_output"
input="script_output_sce2c.txt"
sce_id="sce2c"
mkdir -p $output_folder
while IFS= read -r line
do
  if [[ $line == *"KOMONDOR SIMULATION"* ]]; then
    DEPLOYMENT_ID=$((DEPLOYMENT_ID+1))
    line_id=1
  else
    # Remove separators
    line="${line//\{}"
    line="${line//\}}"
    last_line=$((3+$NUM_APS))
    # Throughput (label 1)
    if [[ $line_id -eq 1 ]]; then
	printf $line | paste -sd ',' >> $output_folder/throughput_$sce_id_$DEPLOYMENT_ID.csv
    # Airtime (label 2)    
    elif [[ $line_id -eq 2 ]]; then
        printf $line | paste -sd ',' >> $output_folder/airtime_$sce_id_$DEPLOYMENT_ID.csv    
    # RSSI list (feature 1)    
    elif [[ $line_id -eq 3 ]]; then    
        printf $line | paste -sd ',' >> $output_folder/rssi_$sce_id_$DEPLOYMENT_ID.csv 
    # Interference map (feature 2)   
    elif [[ $line_id -gt 3 && $line_id -le $last_line ]]; then
	echo $line >> $output_folder/interference_$sce_id_$DEPLOYMENT_ID.csv
    # Average SINR (feature 3)
    elif [[ $line_id -gt $last_line ]]; then
	printf $line | paste -sd ',' >> $output_folder/sinr_$sce_id_$DEPLOYMENT_ID.csv 
    fi
    line_id=$((line_id+1))
  fi
done < "$input"
