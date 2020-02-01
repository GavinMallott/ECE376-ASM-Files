; -- Basic_Timing.asm --
;Inputs: RB0 - RB7
;Output: RC0

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
	call Wait_B4

	btfsc PORTB,1
	call Wait_C5

	btfsc PORTB,2
	call Wait_D5

	btfsc PORTB,3
	call Wait_E5

	btfsc PORTB,4
	call Wait_F5

	btfsc PORTB,5
	call Wait_G5

	btfsc PORTB,6
	call Wait_A5

	btfsc PORTB,7
	call Wait_B5

	goto Loop

;Subroutines
Init:
	clrf TRISA
	movlw 255
	movf TRISB
	clrf TRISC
	clrf TRISD
	clrf TRISE
	movlw 15
	movwf ADCON1		;Make everything binary
	goto Loop

Toggle:
	btg PORTC, 0
	return

Wait_B4:				; 493Hz --- 10,141 clocks --- Actually ~10,118 clocks
	movlw 10
	movwf CNT1

Loop1b:
	movlw 101
	movwf CNT0
Loop0b:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	decfsz CNT0,F
	goto Loop0b
	
	decfsz CNT1,F
	goto Loop1b

	return

Wait_C5:				; 523Hz --- 9,560 clocks --- Actually ~9560 clocks
	movlw 4
	movwf CNT1

Loop1c:
	movlw 239
	movwf CNT0
Loop0c:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	decfsz CNT0,F
	goto Loop0c
	
	decfsz CNT1,F
	goto Loop1c

	return

Wait_D5:				; 587Hz --- 8517 clocks --- Actually ~8520 clocks
	movlw 4
	movwf CNT1

Loop1d:
	movlw 213
	movwf CNT0
Loop0d:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	decfsz CNT0,F
	goto Loop0d
	
	decfsz CNT1,F
	goto Loop1d

	return

Wait_E5:				; 659Hz --- 7587 clocks --- Actually ~7600 clocks
	movlw 4
	movwf CNT1

Loop1e:
	movlw 190
	movwf CNT0
Loop0e:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	decfsz CNT0,F
	goto Loop0e
	
	decfsz CNT1,F
	goto Loop1e

	return

Wait_F5:				; 693Hz --- 7215 clocks --- Actually ~7200 clocks
	movlw 4
	movwf CNT1

Loop1f:
	movlw 180
	movwf CNT0
Loop0f:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	decfsz CNT0,F
	goto Loop0f
	
	decfsz CNT1,F
	goto Loop1f

	return

Wait_G5:				; 784Hz --- 6377 clocks --- Actually ~6360 clocks
	movlw 4
	movwf CNT1

Loop1g:
	movlw 159
	movwf CNT0
Loop0g:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	decfsz CNT0,F
	goto Loop0g
	
	decfsz CNT1,F
	goto Loop1g

	return

Wait_A5:				; 880Hz --- 5681 clocks --- Actually ~5680 clocks
	movlw 4
	movwf CNT1

Loop1a:
	movlw 142
	movwf CNT0
Loop0a:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	decfsz CNT0,F
	goto Loop0a
	
	decfsz CNT1,F
	goto Loop1a

	return
Wait_B5:				; 987Hz --- 5065 clocks --- Actually ~5050 clocks
	movlw 5
	movwf CNT1

Loop1b2:
	movlw 101
	movwf CNT0
Loop0b2:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	decfsz CNT0,F
	goto Loop0b2
	
	decfsz CNT1,F
	goto Loop1b2

	return

end