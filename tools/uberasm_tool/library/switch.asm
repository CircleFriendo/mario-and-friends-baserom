incsrc "../characterlist/characterlist.asm"

Main:

;; we use L/R for character switching so disable scrolling
    
    STZ $1401|!addr			;disable L/R scrolling

    CheckR:
	LDA $18				;check if controller button is newly pressed..
	AND #$10			;R button
	BEQ CheckL			;

	JSL Forward

CheckL:
	LDA $18				;check if controller button is newly pressed..
	AND #$20			;R button
	BEQ Continue			;

	JSL Backward
    
Continue:

    RTL

Forward:
    LDA !player			;current player
	INC              
    CMP #!NumCharacters
    BNE +
    LDA #$00
+   STA !player   
    RTL
    
Backward:
    LDA !player			
	DEC
    BPL +
    LDA #!NumCharacters-1
+   STA !player
    RTL
    
Timed:
    LDA $14
    AND #$7F
    BNE +
    JSL Forward
+   RTL
