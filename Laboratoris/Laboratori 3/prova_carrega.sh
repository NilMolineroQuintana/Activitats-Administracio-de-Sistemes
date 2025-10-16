#!/bin/bash

# Configuració
URL="AMSA-ALB-544483207.us-east-1.elb.amazonaws.com"
PORT="80"
NUM_PETICIONS=10
IPS_REGISTRADES=()

echo "--- Iniciant prova de distribució de càrrega ($NUM_PETICIONS peticions) ---"
echo "Target: $URL"
echo "--------------------------------------------------------------------------"

for i in $(seq 1 $NUM_PETICIONS); do
    IP_CONNEXIO=$(curl -s -o /dev/null -w "%{remote_ip}" "$URL:$PORT")

    IPS_REGISTRADES+=("$IP_CONNEXIO")

    echo "Petició $i: Connectat a IP $IP_CONNEXIO"
    sleep 0.5
done

echo "--------------------------------------------------------------------------"
echo "--- Resum de Distribució de Tràfic ---"

declare -A FREQUENCIES
for ip in "${IPS_REGISTRADES[@]}"; do
    ((FREQUENCIES[$ip]++))
done

for ip in "${!FREQUENCIES[@]}"; do
    COUNT="${FREQUENCIES[$ip]}"
    echo "Instancia EC2 (IP: $ip): $COUNT peticions ($((COUNT * 100 / NUM_PETICIONS))%)"
done

echo "------------------------------------------"