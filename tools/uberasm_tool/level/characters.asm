incsrc "../characterlist/characterlist.asm"

init:
    ;;; You can load a default starting character here if you like
    ;LDA #!mario : STA !player
    
    LDA !player
    STA !lastplayer
    
    JSL boostjump_Init
    JSL float_Init
    JSL flutterjump_Init
    JSL groundpound_Init
    JSL dash_Init
    
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
    
    JSL flutterjump_clear
    JSL boostjump_clear
    JSL float_clear
    JSL groundpound_clear
    JSL dash_clear
    
+
    JSR Abilities

    RTL


Abilities:

    JSL boostjump_always
    JSL flutterjump_always
    JSL float_always
    JSL dash_always

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
    JSL groundpound_main
    JSL luigiscuttle_main
    JSL names_luigi
    RTS

Daisy:    
    JSL physicstables_daisy
    JSL flutterjump_active
    JSL names_daisy
    RTS

Peach:
    JSL physicstables_peach
    JSL float_active
    JSL names_peach
    RTS

Wario:    
    JSL physicstables_wario
    JSL dash_active
    JSL names_wario
    RTS  

Waluigi:
    JSL physicstables_waluigi
    JSL boostjump_active
    JSL names_waluigi
    RTS
 
   