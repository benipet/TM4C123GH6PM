    .global add_fun
	.global sub_fun
	.global str_cpy
	.global cal_asm
	.global str_len
	.global fun
	.global	str_cat
	.global str_cmp

add_fun:
		 ADDS.W R2, R0, R1
		 MOV R0, R2
	     BX LR

sub_fun:
		 SUB.W R4, R0,R1
	     BX LR

str_cpy:
		  LDRB R6, [R0],#1  ;load byte and update address
		  STRB R6, [R1],#1  ;store byte and update address
		  CMP R6, #0        ;continue until null termination
		  BNE str_cpy
		  BX LR

cal_asm:
		 PUSH {LR}
		 BL fun
		 POP {LR}
	     BX LR

str_len:
		MOV R1,#-1
loop:	ADD R1,#1
		LDRB R6, [R0],#1  ;load byte and update address
		CMP R6, #0        ;continue until null termination
		BNE loop
		MOV R0,R1
		BX LR

str_cat:
loop0:	LDRB R6, [R0],#1  ;load byte and update address
		CMP R6, #0        ;continue until null termination
		BNE loop0
		LDRB R6, [R0],#-1
loop1:	LDRB R6, [R1],#1  ;load byte and update address
		STRB R6, [R0],#1  ;store byte and update address
		CMP R6, #0        ;continue until null termination
		BNE loop1
		BX LR

str_cmp:
loo:	LDRB R6, [R0],#1
		LDRB R7, [R1],#1
		CMP R6,R7
		BNE RE
		ADD R6,R7
		CMP R6,#0
		BNE loo
RE:		SUB R6,R7
		MOV R0,R6
		BX LR
