el.include "m328pdef.inc"              ;Libreria en assembler para el micro ATmega8
.org $0000

        ldi     r16,low(ramend) 
        out     spl,r16             ;Inicializa el Stack Pointer
        ldi     r16,high(ramend) 
        out     sph,r16 

        ser     r16                 ;Coloca 0xFF en el registro R16
        out     ddrb,r16            ;Configura el Puerto B como SALIDAS 
;---------------------------------------------------
LOOP: 
        sbi     portb,5             ;Luz    Verde 1
		cbi     portb,4				;Luz Amarilla 1
		cbi     portb,3				;Luz     rojo 1
		cbi     portb,2				;Luz    Verde 2
		cbi     portb,1				;Luz Amarilla 2   
		sbi     portb,0				;Luz     rojo 2       
		rcall   DELAY
        rcall   DELAY  
		rcall   DELAY  
		rcall   DELAY             ; Llama a la rutina de Retardo
        cbi     portb,5             ;Luz    Verde 1
		sbi     portb,4				;Luz Amarilla 1
		cbi     portb,3				;Luz     rojo 1
		cbi     portb,2				;Luz    Verde 2
		cbi     portb,1				;Luz Amarilla 2   
		sbi     portb,0				;Luz     rojo 2       
    	rcall   DELAY   
		rcall   DELAY             ; Llama a la rutina de Retardo
        cbi     portb,5             ;Luz    Verde 1
		cbi     portb,4				;Luz Amarilla 1
		sbi     portb,3				;Luz     rojo 1
		sbi     portb,2				;Luz    Verde 2
		cbi     portb,1				;Luz Amarilla 2   
		cbi     portb,0				;Luz     rojo 2       
		rcall   DELAY
        rcall   DELAY  
		rcall   DELAY  
		rcall   DELAY             ; Llama a la rutina de Retardo
        cbi     portb,5             ;Luz    Verde 1
		cbi     portb,4				;Luz Amarilla 1
		sbi     portb,3				;Luz     rojo 1
		cbi     portb,2				;Luz    Verde 2
		sbi     portb,1				;Luz Amarilla 2   
		cbi     portb,0				;Luz     rojo 2       
    	rcall   DELAY   
		rcall   DELAY             ; Llama a la rutina de Retardo

        rjmp    LOOP                ; Salta a la etiqueta LOOP indefinidamente
;---------------------------------------------------
DELAY:                              ;Rutina de Retardo Llamada DELAY= 1 segundo 
; Delay 16 000 000 cycles
; 1s at 16 MHz

    ldi  r18, 82
    ldi  r19, 43
    ldi  r20, 0
L1: dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1
    lpm
    nop

          ret
