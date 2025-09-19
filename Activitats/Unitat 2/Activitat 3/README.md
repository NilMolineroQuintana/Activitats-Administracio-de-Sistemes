## Activitat 3

Inicialment vaig haver de reinstal·lar tant la màquina virtual de **Debian** com la d’**AlmaLinux** perquè funcionessin amb **UEFI**. Aquesta configuració la vaig aplicar en el moment de crear les màquines noves, sense necessitat d’entrar després a la configuració de la màquina virtual.

En el cas d’**AlmaLinux** vaig trobar diversos problemes, ja que **VMware** em mostrava contínuament que la màquina no era compatible amb UEFI. Finalment ho vaig solucionar afegint manualment aquestes línies al fitxer de configuració de la màquina virtual:

```
firmware = "efi"
efi.secureBoot.enabled = "FALSE"
```

Un cop vaig tenir les dues màquines virtuals configurades amb el **firmware UEFI**, per poder incloure la màquina de **Debian** a l’arrencada d’**AlmaLinux** primer vaig inserir el disc virtual corresponent. Després, amb l’eina `lsblk`, vaig comprovar que el sistema el detectava correctament.

![alt text](<Lsblk.png>)

Vaig reiniciar la màquina i vaig accedir a la **UEFI de VMware**. Allà vaig comprovar quin disc corresponia a Debian, que en el meu cas era `fs1`. Un cop confirmat que efectivament es tractava de la partició de Debian, vaig intentar executar la comanda `bcfg` per afegir-lo com a sistema bootejable. No obstant això, vaig descobrir que la meva versió de la UEFI Shell era massa antiga i no disposava d’aquesta comanda.

![alt text](<Captura UEFI Shell.png>)

Com que no ho podia fer des de la **UEFI Shell**, vaig iniciar de nou el sistema i vaig executar un conjunt de comandes des de la **terminal** que em permetien completar el procés. Totes aquestes comandes es poden veure a la captura de pantalla adjunta. En concret, vaig modificar les entrades d’arrencada amb `efibootmgr` i vaig reordenar-les amb el paràmetre `-o` per tal de facilitar la selecció del sistema operatiu en iniciar la màquina.

![alt text](<Comandes.png>)

Després de reiniciar, em van aparèixer correctament les dues opcions d’arrencada i vaig poder iniciar sense problemes tant **AlmaLinux** com **Debian**.

![alt text](<UEFI.png>)

Finalment, també vaig intentar afegir l’opció d’escollir l’entrada directament des del GRUB d’AlmaLinux utilitzant comandes com `os-prober` i `grub2-mkconfig`. El procés va funcionar correctament i vaig aconseguir que s’afegís l’entrada de Debian, tal com es mostra a la captura de pantalla.

![alt text](<Captura Grub.png>)
