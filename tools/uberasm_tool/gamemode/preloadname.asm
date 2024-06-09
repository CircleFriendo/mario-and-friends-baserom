incsrc "../characterlist/characterlist.asm"

main:
    
    LDA !player
    CMP #!mario
    BNE ++
    JSL names_mario
    
++  LDA !player
    CMP #!luigi
    BNE ++
    JSL names_luigi
    
++  LDA !player
    CMP #!daisy
    BNE ++
    JSL names_daisy
    
++  LDA !player
    CMP #!peach
    BNE ++
    JSL names_peach
    
++  LDA !player
    CMP #!wario
    BNE ++
    JSL names_wario
    
++  LDA !player
    CMP #!waluigi
    BNE ++
    JSL names_waluigi
    
++  
    RTL