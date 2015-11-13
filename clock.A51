			org			0000
			ljmp		start
			org			0003h
			reti

			
			org 		30h
start:		setb		ex0
			setb		ea
			mov			r2,#00h		;min
			mov			r3,#00h		;hr
			mov			r4,#01h		;day
			mov			r5,#01h		;mon
			acall		setup
			mov			a,#00h
ad:			acall		show_all
			acall		D_1S
			cpl			p3.0
			acall		add_m
			acall		check_add
stop:		sjmp		ad

check_add:	jb			p1.0,ch_2
			acall		add_m
			acall		show_all
stop_1:		jnb			p1.0,stop_1
ch_2:		jb			p1.1,ch_3
			acall		add_h
			acall		show_all
stop_2:		jnb			p1.1,stop_2
ch_3:		jb			p1.2,ch_4
			acall		add_d
			acall		show_all
stop_3:		jnb			p1.2,stop_3
ch_4:		jb			p1.3,to_ret2
			acall		add_mo
			acall		show_all
stop_4:		jnb			p1.3,stop_4		
to_ret2:	ret

show_y:		mov			a,#"1"
			acall		dat
			acall		delay
			mov			a,#"5"
			acall		dat
			acall		delay
			ret


show_all:	acall		clear
			acall		show_d
			acall		show_bk
			acall		show_mo
			acall		show_bk
			acall		show_y
			mov 		a,#0C0h
		 	acall 		com
		  	acall 		delay
			acall		show_m
			cpl			p0.0
			ret

show_bk:	mov			a,#" "
			acall		dat
			acall		delay
			ret

show_d:		clr			a
			add			a,r4
			da			a
			anl			a,#0f0h
			swap		a	
			mov			dptr,#tb_n
			movc		a,@a+dptr
			acall		dat
			acall		delay
			clr			a
			add			a,r4
			da			a
			anl			a,#0fh	
			mov			dptr,#tb_n
			movc		a,@a+dptr
			cjne		r4,#32h,pass1
			acall		clr_d
pass1:		acall		dat
			acall		delay
			ret

clr_d:		mov			r4,#01h
			acall		add_mo
			ret

show_mo:	cjne		r5,#1,c_m_2
			acall		mo_jan
			ajmp		to_ret	
c_m_2:		cjne		r5,#2,c_m_3
			acall		mo_feb
			ajmp		to_ret
c_m_3:		cjne		r5,#3,c_m_4
			acall		mo_mar
			ajmp		to_ret
c_m_4:		cjne		r5,#4,c_m_5
			acall		mo_apr
			ajmp		to_ret
c_m_5:		cjne		r5,#5,c_m_6
			acall		mo_may
			ajmp		to_ret
c_m_6:		cjne		r5,#6,c_m_7
			acall		mo_jun
			ajmp		to_ret
c_m_7:		cjne		r5,#7,c_m_8
			acall		mo_jul
			ajmp		to_ret
c_m_8:		cjne		r5,#8,c_m_9
			acall		mo_aug
			ajmp		to_ret
c_m_9:		cjne		r5,#9,c_m_10
			acall		mo_sep
			ajmp		to_ret
c_m_10:		cjne		r5,#10,c_m_11
			acall		mo_oct
			ajmp		to_ret
c_m_11:		cjne		r5,#0,c_m_12
			acall		mo_nov
			ajmp		to_ret
c_m_12:		acall		mo_dec
			ajmp		to_ret
			ret

mo_jan:		mov			a,#"J"
			acall		dat
			acall		delay
			mov			a,#"A"
			acall		dat
			acall		delay
			mov			a,#"N"
			acall		dat
			acall		delay
			mov			a,#"U"
			acall		dat
			acall		delay
			mov			a,#"A"
			acall		dat
			acall		delay
			mov			a,#"R"
			acall		dat
			acall		delay
			mov			a,#"Y"
			acall		dat
			acall		delay
			ret

mo_feb:		mov			a,#"F"
			acall		dat
			acall		delay
			mov			a,#"E"
			acall		dat
			acall		delay
			mov			a,#"B"
			acall		dat
			acall		delay
			mov			a,#"R"
			acall		dat
			acall		delay
			mov			a,#"U"
			acall		dat
			acall		delay
			mov			a,#"A"
			acall		dat
			acall		delay
			mov			a,#"R"
			acall		dat
			acall		delay
			mov			a,#"Y"
			acall		dat
			acall 		delay
			ret

mo_mar:		mov			a,#"M"
			acall		dat
			acall		delay
			mov			a,#"A"
			acall		dat
			acall		delay
			mov			a,#"R"
			acall		dat
			acall		delay
			mov			a,#"C"
			acall		dat
			acall		delay
			mov			a,#"H"
			acall		dat
			acall		delay
			ret

mo_apr:		mov			a,#"A"
			acall		dat
			acall		delay
			mov			a,#"P"
			acall		dat
			acall		delay
			mov			a,#"R"
			acall		dat
			acall		delay
			mov			a,#"I"
			acall		dat
			acall		delay
			mov			a,#"L"
			acall		dat
			acall		delay
			ret

mo_may:		mov			a,#"M"
			acall		dat
			acall		delay
			mov			a,#"A"
			acall		dat
			acall		delay
			mov			a,#"Y"
			acall		dat
			acall		delay
			ret

mo_jun:		mov			a,#"J"
			acall		dat
			acall		delay
			mov			a,#"U"
			acall		dat
			acall		delay
			mov			a,#"N"
			acall		dat
			acall		delay
			mov			a,#"E"
			acall		dat
			acall		delay
			ret

mo_jul:		mov			a,#"J"
			acall		dat
			acall		delay
			mov			a,#"U"
			acall		dat
			acall		delay
			mov			a,#"L"
			acall		dat
			acall		delay
			mov			a,#"Y"
			acall		dat
			acall		delay
			ret

mo_aug:		mov			a,#"A"
			acall		dat
			acall		delay
			mov			a,#"U"
			acall		dat
			acall		delay
			mov			a,#"G"
			acall		dat
			acall		delay
			mov			a,#"U"
			acall		dat
			acall		delay
			mov			a,#"S"
			acall		dat
			acall		delay
			mov			a,#"T"
			acall		dat
			acall		delay
			ret

mo_sep:		mov			a,#"S"
			acall		dat
			acall		delay
			mov			a,#"E"
			acall		dat
			acall		delay
			mov			a,#"P"
			acall		dat
			acall		delay
			mov			a,#"T"
			acall		dat
			acall		delay
			mov			a,#"E"
			acall		dat
			acall		delay
			mov			a,#"M"
			acall		dat
			acall		delay
			mov			a,#"B"
			acall		dat
			acall		delay
			mov			a,#"E"
			acall		dat
			acall		delay
			mov			a,#"R"
			acall		dat
			acall		delay
			ret

mo_oct:		mov			a,#"O"
			acall		dat
			acall		delay
			mov			a,#"C"
			acall		dat
			acall		delay
			mov			a,#"T"
			acall		dat
			acall		delay
			mov			a,#"O"
			acall		dat
			acall		delay
			mov			a,#"B"
			acall		dat
			acall		delay
			mov			a,#"E"
			acall		dat
			acall		delay
			mov			a,#"R"
			acall		dat
			acall       delay
			ret

mo_nov:		mov			a,#"N"
			acall		dat
			acall		delay
			mov			a,#"O"
			acall		dat
			acall		delay
			mov			a,#"V"
			acall		dat
			acall		delay
			mov			a,#"E"
			acall		dat
			acall		delay
			mov			a,#"M"
			acall		dat
			acall		delay
			mov			a,#"B"
			acall		dat
			acall		delay
			mov			a,#"E"
			acall		dat
			acall		delay
			mov			a,#"R"
			acall		dat
			acall		delay
			ret

mo_dec:		mov			a,#"D"
			acall		dat
			acall		delay
			mov			a,#"E"
			acall		dat
			acall		delay
			mov			a,#"C"
			acall		dat
			acall		delay
			mov			a,#"E"
			acall		dat
			acall		delay
			mov			a,#"M"
			acall		dat
			acall		delay
			mov			a,#"B"
			acall		dat
			acall		delay
			mov			a,#"E"
			acall		dat
			acall		delay
			mov			a,#"R"
			acall		dat
			acall		delay
			ret
					
show_m:		clr			a
			add			a,r3
			da			a
			anl			a,#0f0h
			swap		a	
			mov			dptr,#tb_n
			movc		a,@a+dptr
			acall		dat
			acall		delay
			clr			a
			add			a,r3
			da			a
			anl			a,#0fh	
			mov			dptr,#tb_n
			movc		a,@a+dptr
			acall		dat
			acall		delay
			mov			a,#":"
			acall		dat
			acall		delay
			clr			a
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
			ret

add_m:		clr			a
			add			a,r2		
			da			a
			inc			a
			mov			r2,a
			cjne		r2,#5ah,to_ret		;check 60 sec
			acall		clr_m
to_ret:		ret

clr_m:		mov			r2,#00h
			acall		add_h
			ret

add_h:		clr			a
			add			a,r3		
			da			a
			inc			a
			mov			r3,a
			cjne		r3,#24h,to_ret		;check 24 hz
			acall		clr_h
			ret

clr_h:		mov			r3,#00h
			acall		add_d
			ret

add_d:		clr			a
			add			a,r4		
			da			a
			inc			a
			mov			r4,a
			ret

add_mo:		clr			a
			add			a,r5		
			da			a
			inc			a
			mov			r5,a
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
			ret

clear:		mov 		a,#01h
		 	acall 		com
		  	acall 		delay
			mov			a,#" "
			acall		dat
			acall		delay
			mov			a,#10h
			acall		com
			acall		delay
			ret

com: 		mov 		p2,a
		    clr 		p3.5
			clr 		p3.6
			setb 		p3.7
			acall 		delay
			clr 		p3.7
			ret

dat: 		mov 		p2,a
		    setb 		p3.5
			clr 		p3.6
			setb 		p3.7
			call 		delay
			clr 		p3.7
			ret

delay: 		mov 		r0,#04h
b2: 		mov 		r1,#0ffh
b3: 		djnz 		r0,b2
			ret

tb_n:		db			"0","1","2","3","4","5","6","7","8","9"

D_1S:		push		0
			mov			r0,#20				  ;15 to 1 sec	 900 to 1 min
HERE:		MOV 		TMOD,#01
	 		MOV 		TL0,#-250
			MOV 		TH0,#-200
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