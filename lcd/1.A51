			org 		0000h
			mov			r2,#00h		;min
			mov			r3,#00h		;min
start:		acall		setup
			mov			a,#00h
ad:			acall		clear
			acall		show_m
			acall		D_1S
stop:		sjmp		ad


show_m:		clr			a
			add			a,r2
			da			a
			anl			a,#0f0h
			swap		a	
			mov			dptr,#tb_n
			movc		a,@a+dptr
			acall		dat
			acall		delay
			clr			a
			add			a,r2
			da			a
			anl			a,#0fh	
			mov			dptr,#tb_n
			movc		a,@a+dptr
			acall		dat
			acall		delay
			clr			a
			add			a,r2
			da			a
			inc			a
			mov			r2,a
			ret


setup:		mov			r0,#30h
			mov 		a,#38h
			acall 		com
			acall 		delay  
			mov 		a,#0eh
			acall 		com
			acall 		delay  
			mov 		a,#0ch
			acall 		com
			acall 		delay
			mov			a,#" "
			acall		dat
			acall		delay
			ret

clear:		mov 		a,#01h
		 	acall 		com
		  	acall 		delay
			mov			a,#" "
			acall		dat
			acall		delay
			ret

com: 		mov 		p2,a
		    clr 		p3.0
			clr 		p3.1
			setb 		p3.2
			acall 		delay
			clr 		p3.2
			ret

dat: 		mov 		p2,a
		    setb 		p3.0
			clr 		p3.1
			setb 		p3.2
			call 		delay
			clr 		p3.2
			ret

delay: 		mov 		r0,#04h
b2: 		mov 		r1,#0ffh
b3: 		djnz 		r0,b2
			ret

tb_n:		db			"0","1","2","3","4","5","6","7","8","9"

D_1S:		push		0
			mov			r0,#15
HERE:		MOV 		TMOD,#01
	 		MOV 		TL0,#00H
			MOV 		TH0,#00H
			ACALL 		DELAY1s
			djnz		r0,here
			pop			0
			ret				
DELAY1s: 	SETB 		TR0
AGAIN: 		JNB 		TF0,AGAIN
			CLR 		TR0
			CLR 		TF0
			RET

			end