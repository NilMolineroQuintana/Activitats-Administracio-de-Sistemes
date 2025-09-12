# Activitat 2

## Pregunta 1

Totes les arquitectures soportades per QEMU:

```
qemu-aarch64       qemu-loongarch64   qemu-mipsn32el     qemu-sh4
qemu-aarch64_be    qemu-m68k          qemu-nios2         qemu-sh4eb
qemu-alpha         qemu-microblaze    qemu-or1k          qemu-sparc
qemu-arm           qemu-microblazeel  qemu-ppc           qemu-sparc32plus
qemu-armeb         qemu-mips          qemu-ppc64         qemu-sparc64
qemu-cris          qemu-mips64        qemu-ppc64le       qemu-x86_64
qemu-hexagon       qemu-mips64el      qemu-riscv32       qemu-xtensa
qemu-hppa          qemu-mipsel        qemu-riscv64       qemu-xtensaeb
qemu-i386          qemu-mipsn32       qemu-s390x         
```

He compilat `hello.c` amb l'arquitectura MIPS amb la matèixa configuració que a l'ARM i executat i funciona.

### Captura

![captura_execució](captura_execució.png)

## Pregunta 2

La compilació estàtica és important amb QEMU perquè el binari ja incorpora totes les biblioteques i no depèn de tenir-les instal·lades per a l’arquitectura guest, cosa que facilita molt l’execució en emulació.

A la compilació normal, les biblioteques dinàmiques del sistema ja són compatibles i disponibles, i l’enllaç dinàmic funciona sense problemes. Per això no cal afegir -static.

**Compilació dinàmica**

- **Avantatges**: binari més petit, reutilitza biblioteques del sistema i s’actualitzen automàticament.

- **Inconvenients**: depèn de tenir les biblioteques adequades instal·lades i és més difícil en entorns d’emulació.

## Explicació detallada desenvolupament

He seguit tots els passos tal i com descrivia la guia i després mitjançant l'autocompletat de QEMU he esbrinat quines arquitectures hi donava suport. He instalat en aquest cas una eina de compilació MIPS i he executat mitjançant QEMU.