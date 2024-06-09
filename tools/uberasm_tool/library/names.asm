!StatusName = $7e0ef9

mario:
    LDX #$04 ; 5 bytes
    - LDA MarioName,x
    STA !StatusName,x
    DEX
    BPL -
    RTL

luigi:
    LDX #$04 ; 5 bytes
    - LDA LuigiName,x
    STA !StatusName,x
    DEX
    BPL -
    RTL
    
daisy:
    LDX #$04 ; 5 bytes
    - LDA DaisyName,x
    STA !StatusName,x
    DEX
    BPL -
    RTL
    
peach:
    LDX #$04 ; 5 bytes
    - LDA PeachName,x
    STA !StatusName,x
    DEX
    BPL -
    RTL
wario:
    LDX #$04 ; 5 bytes
    - LDA WarioName,x
    STA !StatusName,x
    DEX
    BPL -
    RTL
waluigi:
    LDX #$04 ; 5 bytes
    - LDA WaluigiName,x
    STA !StatusName,x
    DEX
    BPL -
    RTL

MarioName:
    ;;   M     A     R     I     O 
    db $16,  $0A,  $1B,  $12,  $18

LuigiName:
    ;;   L     U     I     G     I 
    db $15,  $1E,  $12,  $10,  $12


PeachName:
    ;;   P     E     A     C     H 
    db $19,  $0E,  $0A,  $0C,  $11
    
DaisyName:
    ;;   D     A     I     S     Y 
    db $0D,  $0A,  $12,  $1C,  $22

WarioName:
    ;;     W    A     R     I     O 
    db   $20, $0A,  $1B,  $12,  $18

WaluigiName:
    ;;   W    A    L     U     I     G     I 
    db $20, $0A, $15,  $1E,  $12,  $10,  $12