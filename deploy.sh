#!/bin/bash

# Apply the YAML file
kubectl apply -f MultiContainer.yaml

# Wait for the pod to be running and all containers within it to be running
echo "Waiting for the pod and all containers within it to be running..."
while true; do
    pod_name=$(kubectl get pods --sort-by=.metadata.creationTimestamp -o=jsonpath='{.items[-1].metadata.name}')
    if [[ -n "$pod_name" ]]; then
        pod_status=$(kubectl get pod $pod_name -o jsonpath='{.status.phase}')
        container_statuses=$(kubectl get pod $pod_name -o jsonpath='{.status.containerStatuses[*].state}')

        # Check if all containers are running
        all_containers_running=true
        for container_status in $container_statuses; do
            startedAt=$(echo $container_status | jq -r '.running.startedAt')
            if [[ "$startedAt" == "null" ]]; then
                all_containers_running=false
                break
            fi
        done

        if [[ "$pod_status" == "Running" && "$all_containers_running" == "true" ]]; then
            echo "Pod $pod_name and all containers within it are running."
            break
        fi
    fi
    sleep 5
done

# Run the command on the most recently created pod
echo "Running command on the most recently created pod: $pod_name"
kubectl exec $pod_name -c foundry -- forge script script/Setup.s.sol:Setup --rpc-url http://0.0.0.0:8545 --broadcast --code-size-limit 30000
