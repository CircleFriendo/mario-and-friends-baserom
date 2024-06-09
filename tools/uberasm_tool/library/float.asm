
;; Peach float parameters
!floatcharge = $7f9e04    ;FreeRAM
!floattimer = $7f9e05     ;FreeRAM
!floattime = $30     ; actual length of float
!floatvspeed = $00

Init:
    LDA #$00 : STA !floattimer 
    LDA #$01 : STA !floatcharge  
    RTL

Main:
   

active:
  ; check falling
    lda $7d  ; rising
    bmi .end
    LDA $74  ; climbing
    ORA $75			;Swimming?
    ORA $9D  ; lock animation
    ORA $13d4|!addr   ; pause
    bne .end
    

           ; if charge and A and falling
    lda !floatcharge
    beq .zerotimer
    lda $17
    and #$80  ; A only
    beq .dectimer

    ; start float     
    lda #$00 : sta !floatcharge
    lda #!floattime : sta !floattimer
    
    

.zerotimer

    ; if not charge and not A and falling
    lda $17
    and #$80  ; A only
    bne .dectimer

    ; zero timer
    lda #$00
    sta !floattimer


.dectimer
    lda !floattimer
    beq .end
    
    dec
    sta !floattimer
    
    cmp #!floattime-2 ;; massive cheat
    bne +
    LDA #$10     ;What sound to play		
	STA $1DF9|!addr	;Sound Bank to use
    +
    
    lda #!floatvspeed     ; set vertical speed
    sta $7d

.end
    
    JSL always
    
    rtl
    
clear:
    LDA #$00 : STA !floattimer 
    RTL

always:
    lda $72              ; Refresh charges if grounded
    beq .refreshcharges

    lda $75              ; Refresh charges in water
    bne .refreshcharges
    
    RTL

.refreshcharges
    lda #$01
    STA !floatcharge
    LDA #$00
    STA !floattimer    

   RTL