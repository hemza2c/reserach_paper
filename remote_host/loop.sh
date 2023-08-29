#!/bin/bash

start_time=$(date +%s%3N)  # Get start timestamp in milliseconds since epoch

function cleanup {
    end_time=$(date +%s%3N)  # Get end timestamp in milliseconds since epoch
    duration=$((end_time - start_time))  # Calculate duration in milliseconds
    echo "Script stopped. Total duration: ${duration} milliseconds."
    exit 0
}

trap cleanup TERM

while true; do
    start_op_time=$(date +%s%3N)  # Get start timestamp for the operation

    # Your operation here (e.g., Ansible playbook)
    ansible-playbook inc_res.yml

    end_op_time=$(date +%s%3N)  # Get end timestamp for the operation
    op_duration=$((end_op_time - start_op_time))  # Calculate operation duration

    echo "Operation duration: ${op_duration} milliseconds"

    sleep 5
done

