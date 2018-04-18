.data
numero: .word 7
.text
main:
	addi $t0, $t0,1
	addi $t1, $zero,2
	addi $t2, $zero,1
	beq $t0,$t2,step1		#beq
	bne $t0,$t2,step2		#bne
	addi $s0,$zero,10
step1:	addi $a1,$zero,268500992
	lw $a0, 0($a1)			#lw
	addi $a0, $a0, 3
	sw $a0, 0($a1)			#sw
	j main


step2:	jal suma			#jal
	j exit				#j

suma:	add $t0,$t2,$t0			#add
	jr $ra				#jr
	
exit:	j exit
	
	
	
