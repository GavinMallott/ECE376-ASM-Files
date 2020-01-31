; -- Basic_Timing.asm --
;Inputs: RB0 - RB7
;Outputs: RC0, RC1

#include <p18f4620.inc>

CNT0 EQU 1
CNT1 EQU 2

;Program Start

	org 0x800
	call Init

Loop:
	movf PORTB,W
	btfss STATUS,Z
	call Toggle

	btfsc PORTB,0
	call Wait_D4

	goto Loop

;Subroutines
Init:
	clrf TRISA
	clrf TRISB
	clrf TRISC
	clrf TRISD
	clrf TRISE
	movlw 15
	movwf ADCON1		;Make everything binary
	return

Toggle:
	btg PORTC, 0
	return

Wait_D4:			;Wait 17,064 clocks
	movlw 7
	movwf CNT1

Loop1:
	movlw 243
	movwf CNT0
Loop0:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	decfsz CNT0,F
	goto Loop0
	
	decfsz CNT1,F
	goto Loop1

	return
