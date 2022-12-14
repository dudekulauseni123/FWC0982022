
.include "/home/hussain/Assignment-2_Asm/codes/m328Pdef.inc" ;your m328Pdef file location
ldi r16,0b11000011
out DDRD,r16
ldi r16,0b00100000
out DDRB,r16            ;declaring 13th pin as output
loop:                   ;loop for reading the input from pins 2,3,4,5 continously
        ldi r17, 0b00000100 ;

        ldi r24,0b00000100
        mov r18,r17
        and r18,r24
        ldi r25,0b00000010
        loop1:  lsr r18  ;U
        dec r25
        brne    loop1

        mov r19,r17
        ldi r24,0b00001000
        and r19,r24
        ldi r25,0b00000011
        loop2:  lsr r19   ;V
        dec r25
        brne    loop2

        ldi r24,0b00010000
        mov r20,r17
        and r20,r24
        ldi r25,0b00000100
        loop3:  lsr r20  ;W
        dec r25
        brne    loop3

        ldi r24,0b00000000
        mov r21,r17
        and r21,r24
        ldi r25,0b00000101
        loop4:  lsr r21  ;X
        dec r25
        brne    loop4
    
		ldi r31,0x00
		mov r31,r18
		com r31 ;U complement

		ldi r30,0x00
		mov r30,r19
		com r30 ;V complement
	
		ldi r29,0x00
		mov r29,r20
		com r29 ;W  complement
	
		ldi r28,0x00
		mov r28,r21
		com r28 ;X  complement

and r31,r19 ;U'V
and r30,r18 ;V'U
or r31,r30

and r29,r28 ;W'X'
and r20,r28 ;WX'
or r29,r20

and r31,r29
	ldi r26,0b00000101
        loop5:  lsl r31 
        dec r26
        brne    loop5
     out PORTB,r31
     rjmp loop

