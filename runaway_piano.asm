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
	call Wait_E5

	btfsc PORTB,1
	call Wait_E4

	btfsc PORTB,2
	call Wait_D5s

	btfsc PORTB,3
	call Wait_D4s

	btfsc PORTB,4
	call Wait_C5s

	btfsc PORTB,5
	call Wait_C4s

	btfsc PORTB,6
	call Wait_A4

	btfsc PORTB,7
	call Wait_G4s

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

Wait_E5:				; 659Hz --- 7587 clocks
	movlw 4
	movwf CNT1

Loop1b:
	movlw 190
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

Wait_E4:				; 329Hz --- 15197 clocks
	movlw 7
	movwf CNT1

Loop1c:
	movlw 217
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

Wait_D5s:				; 622Hz --- 8038 clocks
	movlw 4
	movwf CNT1

Loop1d:
	movlw 201
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

Wait_D4s:				; 311Hz --- 16077 clocks
	movlw 7
	movwf CNT1

Loop1e:
	movlw 230
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

Wait_C5s:				; 554Hz --- 9025 clocks
	movlw 5
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

Wait_C4s:				; 277Hz --- 18050 clocks
	movlw 8
	movwf CNT1

Loop1g:
	movlw 226
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

Wait_A4:				; 440Hz --- 11363 clocks
	movlw 5
	movwf CNT1

Loop1a:
	movlw 227
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
Wait_G4s:				; 415Hz --- 12048 clocks
	movlw 5
	movwf CNT1

Loop1b2:
	movlw 241
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