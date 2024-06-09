;; This file is the same as mario.asm level UberASM



;;; Character List
!mario = $00
!luigi = $01
!peach = $02
!daisy = $03
!wario = $04
!waluigi = $05
!NumCharacters = 6

;;; FreeRAM locations

!player = $7f9e10   ;FreeRAM
!lastplayer = $7f9e11    ;FreeRAM

init:
    LDA #$02 : STA $19
    ; Set default character to mario
    LDA #!mario : STA !player : STA !lastplayer
    ; Initialize physics tables
    JSL physicstables_default
    RTL
