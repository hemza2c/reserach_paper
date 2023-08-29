#!/bin/bash

start_time=$(date +%s%3N)  

function cleanup {
    end_time=$(date +%s%3N)  
    duration=$((end_time - start_time))  
    echo "Script stopped. Total duration: ${duration} milliseconds."
    exit 0
}

trap cleanup TERM

while true; do
    start_op_time=$(date +%s%3N) 

    # Operation starts here 
    ansible-playbook inc_res.yml

    end_op_time=$(date +%s%3N)  
    op_duration=$((end_op_time - start_op_time)) 

    echo "Operation duration: ${op_duration} milliseconds"

    sleep 5
done

