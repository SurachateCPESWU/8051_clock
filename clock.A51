		org 0000
start:	mov			a,#00h
		mov			r0,#00h
		mov			r1,#00h
		mov			p2,#00h
		mov			p1,#00h
		MOV 		TMOD,#06h
		MOV 		TL0,#-60
		MOV 		TH0,#-60
main:	add			a,r0
		da			a
		mov			p2,a
		lcall		inc_m
		sjmp		main

inc_m:	lcall		delay
		inc			a
		add			a,#0
		da			a
		mov			r0,a
		clr			a
		lcall		clr_m
		ret

inc_h:	add			a,r1
		inc			a
		da			a
		mov			p1,a
		mov			r1,a
		clr			a
		lcall		clr_h
		ret

clr_m:	cjne		r0,#60h,ret_a
		mov			r0,#00h
		lcall		inc_h
ret_a:	ret

clr_h:	cjne		r1,#23h,ret_b
		mov			r1,#00
ret_b:	ret

						
DELAY: 	SETB 		TR0
AGAIN: 	JNB 		TF0,AGAIN
		CLR 		TR0
		CLR 		TF0
		RET
		end