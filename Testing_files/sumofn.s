b L
sum:
xor $t0,$t0
bz $a0,ret
add $t0,$a0
sw $a0,0($sp)
sw $ra,1($sp)
sw $t0,2($sp)
addi $sp,3
addi $a0,-1
bl sum
addi $sp,-3
lw $ra,1($sp)
lw $a0,0($sp)
lw $t0,2($sp)
add $v0,$t0
br $ra
ret:
xor $v0,$v0
br $ra
L:
xor $a0,$a0
xor $sp,$sp
addi $a0,10
addi $sp,1
bl sum
xor $sp,$sp
sw $v0,0($sp)
L1:
b L1
