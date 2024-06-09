incsrc "../characterlist/characterlist.asm"

init:
    ;;; You can load a default starting character here if you like
    ;LDA #!mario : STA !player
    
    LDA !player
    STA !lastplayer
    
    JSL boostjump_init
    JSL float_init
    JSL flutterjump_init
    JSL groundpound_init
    JSL dash_init
    
    RTL
    
main:
    
    ;;; this line is the only difference from noswitchmode.asm
    JSL switch_Main

DetectSwitch:
    LDA !player
    CMP !lastplayer
    BEQ +
    
    STA !lastplayer
    CMP #!luigi
    BNE ++
    JSL moonjump_fix
++  
    
    LDA #$0B   ; character select sound
    STA $1DFC
    
+
    JSR Abilities

    JSL groundpound_main
    JSL flutterjump_main
    JSL float_main
    JSL dash_main
    JSL boostjump_main

    RTL


Abilities:

    LDA !player
    ASL A : TAX
    JMP.w (Players,X)

Players:
    dw Mario
    dw Luigi
    dw Peach
    dw Daisy
    dw Wario
    dw Waluigi


Mario:    
    JSL physicstables_default
    JSL names_mario
    RTS

Luigi:
    JSL physicstables_luigi    
    JSL luigiscuttle_main
    JSL names_luigi
    RTS

Daisy:    
    JSL physicstables_daisy
    JSL names_daisy
    RTS

Peach:
    JSL physicstables_peach
    JSL names_peach
    RTS

Wario:    
    JSL physicstables_wario
    JSL names_wario
    RTS  

Waluigi:
    JSL physicstables_waluigi
    JSL names_waluigi
    RTS
 
   