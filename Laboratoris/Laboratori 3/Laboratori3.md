# Desplegament d’una aplicació web amb alta disponibilitat amb AWS

## 1. Com milloraríeu els grups de seguretat, quins canvis faríeu?

No n'hi ha molta cosa a millorar pero podriem ser més restrictius a l'hora d'establir les normatives Outbound de per exemple les màquines "AMSA-WP"

## 2. Què caldria fer per connectar un client MySQL des de casa a la base de dades RDS? Expliqueu els passos.

1. Ens connectem amb la VPN que hem configurat. Això ens permetrà entrar a la xarxa privada.
2. Una vegada allà fem SSH a la màquina AMSA-Data-EC2.
3. Final executem el nostre client MySQL amb les creedencials establertes a la base de dades.

## 3. Prepara un script que faci una prova de càrrega al balancejador de càrrega i mostri com es distribueix el tràfic entre les instàncies EC2.

```
#!/bin/bash

# Configuració
URL="AMSA-ALB-544483207.us-east-1.elb.amazonaws.com"
PORT="80"
NUM_PETICIONS=10
IPS_REGISTRADES=()

echo "--- Iniciant proba de distribució de carrega ($NUM_PETICIONS peticions) ---"
echo "Target: $URL"
echo "--------------------------------------------------------------------------"

for i in $(seq 1 $NUM_PETICIONS); do
    IP_CONNEXIO=$(curl -s -o /dev/null -w "%{remote_ip}" "$URL:$PORT")

    IPS_REGISTRADES+=("$IP_CONNEXIO")

    echo "Petició $i: Connectat a IP $IP_CONNEXIO"
    sleep 0.5
done

echo "--------------------------------------------------------------------------"
echo "--- Resum de Distribució de Tráfic ---"

declare -A FREQUENCIES
for ip in "${IPS_REGISTRADES[@]}"; do
    ((FREQUENCIES[$ip]++))
done

for ip in "${!FREQUENCIES[@]}"; do
    COUNT="${FREQUENCIES[$ip]}"
    echo "Instancia EC2 (IP: $ip): $COUNT peticions ($((COUNT * 100 / NUM_PETICIONS))%)"
done

echo "------------------------------------------"
```
## 4. Genera un infra_v3.yaml que contingui tota la infraestructura com a codi.
[Fitxer YAML](<infra-v3.yaml>)