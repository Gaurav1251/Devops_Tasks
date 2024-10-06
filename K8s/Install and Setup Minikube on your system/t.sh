#!/bin/bash

# Run the database pod
minikube kubectl -- run db1 --image=gaurav1251/movie:tdatabase --port=3306

# Run the backend pod
minikube kubectl -- run be --image=gaurav1251/movie:tbackend --port=8080

# Expose the database pod as a ClusterIP service
minikube kubectl -- expose pod db1 --name=db --port=3306 --target-port=3306 --type=ClusterIP

# Expose the backend pod as a NodePort service
minikube kubectl -- expose pod be --name=be --port=8080 --target-port=8080 --type=NodePort

# Display message with the NodePort URL
node_port=$(minikube kubectl -- get service be -o jsonpath='{.spec.ports[0].nodePort}')

ip=$(minikube ip)
app_url="http://$ip:$node_port/ticketbooking2"


sudo ufw allow 30000:32767/tcp


echo -e "\n\nClick the below link to access the application:\n"

echo -e "\e]8;;$app_url\e\\$app_url\e]8;;\e\\"
# Open the application URL in the default web browser
sleep 3
xdg-open "$app_url"  # Use `open` on macOS
