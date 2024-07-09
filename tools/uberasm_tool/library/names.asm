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
    ;; M   A   R   I   O
    db $30,$31,$32,$33,$34

LuigiName:
    ;; L   U   I   G   I
    db $40,$41,$42,$43,$44


PeachName:
    ;; P   E   A   C   H
    db $65,$66,$67,$68,$69

DaisyName:
    ;; D   A   I   S   Y
    db $55,$56,$57,$58,$59

WarioName:
    ;; W   A   R   I   O
    db $38,$39,$32,$33,$34

WaluigiName:
    ;; W   A   L   U   I   G   I
    db $48,$49,$40,$41,$42,$43,$44