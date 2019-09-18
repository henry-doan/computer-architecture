;
; NotGate.asm
;
; Created: 10/9/2018 8:14:48 PM
; Author : hmoykwan
;


 .include "m328pdef.inc"              ;Libary/ Libreria en assembler para el micro ATmega8
.org $0000

 .def var = r16

 rjmp INIT

 INIT:
 ldi var,0xf0   ;High level Output- Low level Input/ salida nivel alto - entradas nivel bajo
 out DDRD,var   
 sbi PORTD,0
 ldi var,0x0f   ;High level input-Low level output/ entradas nivel alto - salidas nivel bajo
 out DDRB,var
 sbi PORTD,2

 start:
 ;turn off or turn on the output PB2 GATE NOT Input in PIN 0 (PD0) and OUT in PIN 10 (PB2)/ apaga o prende la salida PB2 COMPUERTA NOT ENTRADA EN PIN 0 (PD0) Y SALIDA EN PIN 10 (PB2)
  sbis PIND,0            ;test if the input is pressed otherwise the following statement is made/ prueba si esta presionada la entrada de no ser así realiza la sentencia siguiente
  sbi    PORTB,2
  sbic PIND,0           ;test if the input is pressed otherwise the following statement is made/ prueba si esta presionada la entrada de ser así realiza la sentencia siguiente
  cbi PORTB,2
 ;turn off or turn on the output PD4 GATE YES Input in PIN 2 (PD2) and OUT in PIN 10 (PD4)/ apaga o prende la salida PD4 COMPUERTA YES ENTRADA EN PIN 2 (PD2) Y SALIDA EN PIN 10 (PD4)
  sbic PIND,2           ;test if the input is pressed otherwise the following statement is made/ prueba si esta presionada la entrada de ser así realiza la sentencia siguiente
  sbi    PORTD,4
  sbis PIND,2           ;test if the input is pressed otherwise the following statement is made/ prueba si esta presionada la entrada de no ser así realiza la sentencia siguiente
  cbi PORTD,4
  rjmp start 