# Desplegament d’una aplicació web amb alta disponibilitat amb AWS

## 1. Com milloraríeu els grups de seguretat, quins canvis faríeu?

No n'hi ha gaire cosa a millorar pero podriem ser més restrictius a l'hora d'establir les normatives Outbound de per exemple les màquines "AMSA-WP"

## 2. Què caldria fer per connectar un client MySQL des de casa a la base de dades RDS? Expliqueu els passos.

1. Ens connectem amb la VPN que hem configurat. Això ens permetrà entrar a la xarxa privada.
2. Una vegada allà fem SSH a la màquina AMSA-Data-EC2.
3. Finalment executem el nostre client MySQL amb les credencials establertes a la base de dades.

## 3. Prepara un script que faci una prova de càrrega al balancejador de càrrega i mostri com es distribueix el tràfic entre les instàncies EC2.

[Script bash](<prova_carrega.sh>)

## 4. Genera un infra_v3.yaml que contingui tota la infraestructura com a codi.
[Fitxer YAML](<infra-v3.yaml>)