!destroy	= 1				;1 = destroy after use, 0 = don't destroy
!power 		= $7F			;how much the block will boost you, possible values are $01-$7F
!sfx		= $09			;sfx to play
!sfx_bank	= $1DFC			;sfx bank to use
db $37
JMP Mario : JMP Mario : JMP Mario : JMP Return
JMP Return : JMP Return : JMP Return : JMP Mario
JMP Mario : JMP Mario : JMP Mario : JMP Mario
Mario:
	LDA #!power
	STA $7D
	LDA #!sfx
	STA !sfx_bank|!addr
if !destroy == 1
	%create_smoke()
	%erase_block()
endif
Return:
RTL
print "This block boosts the player downwards."