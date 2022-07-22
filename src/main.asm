; 18i-0454		Maria Yasir

; 18i-0479		Sameet Asadullah

; 18i-0610		Syed Hamza

.model small
.stack 100h
.data
	mouseX db ?
	mouseY db ?
	file db "file.txt", 0
	buffer db 500 DUP('$')
	str1 db "PLAY"
	str2 db "INSTRUCTIONS"
	str3 db "EXIT"
	str4 db "BACK"
	str5 db "SCORE:"
	str6 db "HIGHSCORE:"
	str7 db "2019 (C) ALL RIGHTS RESERVED"
	str8 db "G A M E   0 V E R"
	NameStr db 30 DUP('$')
	enterName db "ENTER NAME:  "
	NameSize db 0
	PlayerName db "PLAYER NAME:  "
	X1 dw ?
	Y1 dw ?
	color db ?
	color1 db ?
	len dw ?
	wid dw ?
	modul db ?
	jumpconstant dw 0
	cpyconstant dw 7
	UpOrDownConstant dw 0
	fps db ?
	freq dw ?
	birdConstant dw 0
	roadConstant dw 0
	hurdleConstant dw 0
	cloudConstant dw 0
	sunConstant dw 0
	sunradius dw 0
	X2constant dw 0
	X5constant dw 0
	bool db -1
	bool1 db 0
	bool2 db 0
	bool3 db 0
	bool4 db 0
	bool5 db 0
	bool6 db 0
	bool7 db 0
	bool8 db 0
	bool9 db 0
	bool10 db 0
	bool0 db 0
	checkheart db 0
	checkX2  db 0
	checkX5  db 0
	randNoForHurdles db ?
	randNoForBirds db ?
	randNoForHearts db ?
	randNoForX2 db ?
	randNoForX5 db ?
	dividand dw ?
	speed dw 7500h
	check1 dw 1000
	
;=============Score Variables===================;
	ScoreRecord db "Score.txt",0
	HighScore db "0000"
	score db 0 
	check dw 0000
	rem db 0
	quo db 0 
	rem1 db 0
	quo1 db 0  
	rem2 db 0
	quo2  db 0  
	convert db "0000      Time:- 00:00:00"
	sc_bool db 0
	buffer1 db 10 DUP('$')
	
;=============Heart Variables===================;
	HeartConstant dw 0
	lives dw 5

;==============MoveStars Variables===============;
	MoveinCircle dw 0
	onlydrawVar  dw 0
	onlymovVar   dw 312
	starConstant dw 0

;==============Coloring Variables================;
	DayORNight db 1
	bgcolor   db  0
	roadcolor db  0FH
	Hurdlecolor db 25
	Wingscolor db 28
	Birdcolor db 23
	Dinocolor db  0FH
	Cloudcolor db 7
	x2color		db	9
	x5color 	db	14
;==============Timer Variables================;
	GameStartTime db 0
	seconds db ?

;==============Game Over Coordinate=============;
		
	CheckArray dw 264 DUP(0)
	check_X dw ?
	check_Y dw ?
	
;==========Arrays to store coordinates==========;

	MenuLOGO dw 108,30,13,1,	110,30,13,1,	114,30,1,8,		114,28,1,8,		
				132,32,5,1,		130,32,5,1,		114,42,1,8,		114,44,1,8,	
				132,44,6,1,		130,44,6,1,		144,28,1,9,		144,30,1,9
			 dw	144,30,13,1,	146,30,13,1,	146,40,1,6,		146,42,1,6,
				146,52,1,8,		146,54,1,8,		188,40,1,4,		188,42,1,4,
				182,36,1,4,		182,38,1,4,		176,32,1,4,		176,34,1,4
			 dw 170,28,1,4,		170,30,1,4,		194,36,1,4,		194,38,1,4,
				200,32,1,4,		200,34,1,4,		206,28,1,4,		206,30,1,4,
				182,44,1,4,		182,46,1,4,		176,48,1,4,		176,50,1,4
			 dw 170,52,1,4,		170,54,1,4,		194,44,1,4,		194,46,1,4,
				200,48,1,4,		200,50,1,4,		206,52,1,4,		206,54,1,4

	DinoDownCoordArray  dw	61,154,1,9,		19,154,1,1,		65,156,1,8,		59,156,1,2,		
							33,156,1,10,	19,156,1,3,		19,158,1,31,	21,160,1,30,
							23,162,1,24,	25,164,1,26,	27,166,1,17,	59,168,1,1
						dw	29,168,1,13,	31,170,1,8,		29,172,1,3,		37,172,1,4,
							29,174,1,2,		39,174,1,2,		29,176,1,1,		39,176,1,1,
							29,178,1,2,		39,178,1,2

	DinoCoordArray dw	39,140,1,9,		37,142,1,2,		43,142,1,8,		37,144,1,11,
						37,146,1,11,	37,148,1,6,		37,150,1,9,		37,152,1,5,
						35,154,1,6,		19,154,1,1,		33,156,1,9,		19,156,1,1
				   dw	31,158,1,8,		19,158,1,1,		21,158,1,1,		49,158,1,1,
						19,160,1,1,		21,160,1,1,		23,160,1,1,		29,160,1,9,
						19,162,1,14,	19,164,1,13,	21,166,1,12,	23,168,1,10
				   dw	25,170,1,8,		27,172,1,4,		37,172,1,2,		29,174,1,2,
						39,174,1,1,		29,176,1,1,		39,176,1,1,		29,178,1,2,
						39,178,1,2
	
	EraseLegs      dw   39,178,1,2,		29,178,1,2,		39,176,1,1,		29,176,1,1,  
						39,174,1,1,		37,172,1,1,		33,172,1,1,		41,172,1,1,
						33,174,1,1
	
	DrawLeftLegsUp1 dw	39,174,1,1,		39,176,1,1,		33,174,1,1, 	39,178,1,2,
						37,172,1,1	
						
	DrawRightLegsUp1 dw	29,176,1,1,		29,178,1,2,  	41,172,1,1,		33,172,1,1
	
	DrawLeftLegsUp2 dw	39,174,1,1,		39,176,1,1,		33,174,1,1, 	39,178,1,2,
						37,172,1,1,		41,172,1,2,		43,174,1,2	
						
	DrawRightLegsUp2 dw	29,176,1,1,		29,178,1,2,  	41,172,1,1,		33,172,1,1,
						39,174,1,4,		43,172,1,1
	
	
	
	SunCoordArray  dw	154,32,1,6,		152,34,1,8,		150,36,1,10,	148,38,1,12,
						146,40,1,14,	144,42,1,16,	144,44,1,16,	144,46,1,16,
						144,48,1,16,	144,50,1,16,	146,52,1,14,	148,54,1,12
					dw	150,56,1,10,	152,58,1,8,		154,60,1,6
						
				   
	MoonCoordArray  dw	154,32,1,3,		156,34,1,4,		158,36,1,4,		160,38,1,4,
						160,40,1,5,		162,42,4,5,		160,50,1,5,		158,52,1,6,
						156,54,1,5,		144,56,1,11
					dw	146,58,1,9,		148,60,1,6,		142,54,1,2,		140,52,1,2,
						138,50,1,1
						

	CloudCoordArray dw	296,30,1,5,		286,32,1,5,		282,34,1,2,		272,36,1,5,
						268,38,1,2,		272,40,1,23,	306,32,1,2,		310,34,1,4,
						318,36,2,1,

	RoadCoordArray  dw	10,190,1,2,		20,185,1,1,		40,188,1,2,		54,184,1,2,
						75,192,1,1,		90,188,1,2,		103,195,1,3,	117,185,1,2,
						127,192,1,1,	140,190,1,2,	155,195,1,3,	165,190,1,2
					dw	175,185,1,1,	195,188,1,2,	104,184,1,2,	220,192,1,1,
						230,188,1,2,	243,195,1,3,	257,185,1,2,	267,192,1,1,
						280,190,1,2,	295,195,1,3	

	Hurdle1CoordArray dw	310,160,10,2,	304,164,5,1,	318,164,5,1,	294,160,10,2,
							288,164,5,1,	288,172,1,15

	Hurdle2CoordArray dw	306,154,13,2,	302,158,7,2,	298,162,3,2,	310,158,7,2,
							314,162,3,2

	Hurdle3CoordArray dw 	307,154,13,2,	300,160,7,1,	318,160,7,1,	300,172,1,10
	
	WingsUp1CoordArray dw	296,116,1,7,	296,114,1,7,	296,112,1,6,	296,110,1,5,
							296,108,1,4,	296,106,1,3,	296,104,1,2,
							296,102,1,1
	
	WingsDown1CoordArray dw 296,116,1,7,	296,118,1,7,	296,120,1,6,	296,122,1,5,
							296,124,1,4,	296,126,1,3,	296,128,1,2,	296,130,1,1
	
	Bird1CoordArray dw  286,102,1,3,	284,104,1,4,	282,106,1,2,	288,106,1,3,
						280,108,1,7,	278,110,1,8,	286,112,1,4,	286,114,1,5,
						288,116,1,12,	290,118,1,15,	292,120,1,11,	294,122,1,12
					dw	296,124,1,9	

	Bird2CoordArray  dw  286,150,1,3,	284,152,1,4,	282,154,1,2,	288,154,1,3,
						280,156,1,7,	278,158,1,8,	286,160,1,4,	286,162,1,5,
						288,164,1,12,	290,166,1,15,	292,168,1,11,	294,170,1,12
					dw	296,172,1,9	
					
	WingsUp2CoordArray dw	296,164,1,7,	296,162,1,7,	296,160,1,6,	296,158,1,5,
							296,156,1,4,	296,154,1,3,	296,152,1,2,
							296,150,1,1
	
	WingsDown2CoordArray dw 296,164,1,7,	296,166,1,7,	296,168,1,6,	296,170,1,5,
						   296,172,1,4,		296,174,1,3,	296,176,1,2,	296,178,1,1
					
	
	WingsUp3CoordArray dw	296,136,1,7,	296,134,1,7,	296,132,1,6,	296,130,1,5,
							296,128,1,4,	296,126,1,3,	296,124,1,2,
							296,122,1,1
	
	WingsDown3CoordArray dw 296,136,1,7,	296,138,1,7,	296,140,1,6,	296,142,1,5,
							296,144,1,4,	296,146,1,3,	296,148,1,2,	296,150,1,1
	
	Bird3CoordArray dw  286,122,1,3,	284,124,1,4,	282,126,1,2,	288,126,1,3,
						280,128,1,7,	278,130,1,8,	286,132,1,4,	286,134,1,5,
						288,136,1,12,	290,138,1,15,	292,140,1,11,	294,142,1,12
					dw	296,144,1,9
	
	HeartCoordArray dw	5,5,1,2,	15,5,1,2,	3,6,1,4,	13,6,1,4,
						3,8,1,9,	5,10,1,7,	7,12,1,5,	9,14,1,3,
						11,16,1,1

	HeartPowerUpArray dw 	307,144,1,3,1,	311,144,1,3,1, 	307,145,1,7,1,  308,146,1,5,1,
							309,147,1,3,1,	310,148,1,1,1
	
	StarsArray dw	100,30,1,3,		101,31,1,1,		101,29,1,1,		120,40,1,3,
					121,41,1,1,		121,39,1,1,		150,45,1,3,		151,46,1,1,
					151,44,1,1,		200,30,1,3,		201,31,1,1,		201,29,1,1
			   dw	170,35,1,3,     171,36,1,1,     171,34,1,1,		50,37,1,3,
					51,38,1,1,     	51,36,1,1,		130,35,1,3,		131,36,1,1,
					131,34,1,1,		70,47,1,3,		71,48,1,1,     	71,46,1,1
			   dw	92,37,1,3,		93,38,1,1,     	93,36,1,1,		220,41,1,3,
					221,42,1,1,     221,40,1,1,		30,50,1,3,		31,51,1,1,
					31,49,1,1
	X2Array			  dw    307,144,1,1,	309,144,1,1,	308,145,1,1,	307,146,1,1,
							309,146,1,1,	311,142,1,3,	313,142,3,1,	311,144,1,3,
							311,144,3,1,	311,146,1,3
	X5Array			  dw    307,144,1,1,	309,144,1,1,	308,145,1,1,	307,146,1,1,
							309,146,1,1,	311,142,1,3,	311,142,3,1,	311,144,1,3,
							313,144,3,1,	311,146,1,3

.code
main proc
	mov ax,@data
	mov ds,ax
	
	mov ah,0
	mov al,13h
	int 10h
	
	CALL DisplayMenu
	
	mov ah,04ch
	int 21h
main ENDP

;==========Proc to draw a a box of 2x2 pixels==========;

pixel proc

	mov cx,2
	L1:
		PUSH cx
		
		mov cx,X1
		mov dx,Y1
		mov al,color
		mov ah,0CH
		int 10h
		
		INC X1
		POP cx
	LOOP L1
	
	INC Y1
	SUB X1,2
	
	mov cx,2
	L2:
		PUSH cx
		
		mov cx,X1
		mov dx,Y1
		mov al,color
		mov ah,0CH
		int 10h
		
		INC X1
		POP cx
	LOOP L2

	SUB Y1,1

	RET
pixel ENDP

;==========Proc to draw a 1x1 box======;

smallpixel proc

	mov cx,1
	L1:
		PUSH cx
		
		mov cx,X1
		mov dx,Y1
		mov al,color
		mov ah,0CH
		int 10h
		
		INC X1
		POP cx
	LOOP L1
	
	INC Y1

	SUB Y1,1

	RET
smallpixel ENDP

;==========Procs to draw boxes==========;

box proc

	mov cx,len
	L3:
		PUSH cx
		mov ax,X1
		PUSH ax
		
		mov cx,wid
		L4:
			PUSH cx
			CALL pixel
			POP cx
		LOOP L4
		
		ADD Y1,2
		POP ax
		mov X1,ax
		POP cx
	LOOP L3
	
	RET
box ENDP

smallBox proc

	mov cx,len
	L3:
		PUSH cx
		mov ax,X1
		PUSH ax
		
		mov cx,wid
		L4:
			PUSH cx
			CALL smallpixel
			POP cx
		LOOP L4
		
		ADD Y1,1
		POP ax
		mov X1,ax
		POP cx
	LOOP L3
	
	RET
smallBox ENDP

;==========Proc to draw coordinates of arrays==========;

Draw proc
	mov si,0
	J1:
		mov ax,[bx+si]
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax	
		
		CALL box 
		
		add si,8
		cmp si,di
	JB J1
	
	RET
Draw ENDP

;==========Procs to draw Powerups=========;

SmallheartDraw proc
	mov si,0
	J1:
		mov ax,[bx+si]
		sub ax,HeartConstant
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax	
		
		CALL smallbox 
		.if (bool6 != 1)
			PUSH si
			PUSH bx
			PUSH di
			mov checkheart,1
			CALL LevelUp
			mov checkheart,0
			POP di
			POP bx
			POP si
		.endif
		
		add si,10
		cmp si,di
	JB J1
	
	RET
SmallheartDraw ENDP

SmallX2Draw proc
	mov si,0
	J1:
		mov ax,[bx+si]
		sub ax,X2constant
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax	
		
		CALL smallbox 
		.if (bool8 != 1)
			PUSH si
			PUSH bx
			PUSH di
			mov checkX2,1
			CALL LevelUp
			mov checkX2,0
			POP di
			POP bx
			POP si
		.endif
		
		add si,8
		cmp si,di
	JB J1
	
	RET

SmallX2Draw endp

SmallX5Draw proc
	mov si,0
	J1:
		mov ax,[bx+si]
		sub ax,X5constant
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax	
		
		CALL smallbox 
		.if (bool10 != 1)
			PUSH si
			PUSH bx
			PUSH di
			mov checkX5,1
			CALL LevelUp
			mov checkX5,0
			POP di
			POP bx
			POP si
		.endif
		
		add si,8
		cmp si,di
	JB J1
	
	RET

SmallX5Draw endp

;==========Proc to print strings==========;

PrintString proc
	L5:
		PUSH cx
		
		mov  ah, 02h	  ;SetCursorPosition
		mov  dh, bl		  ;Row num
		mov  dl, bh		  ;Col num
		PUSH bx
		mov  bh, 0    	  ;Display page
		int  10h

		mov al,[si]
		INC si
	
		mov  ah, 09h  ;Teletype
		mov cx,1
		mov  bl, color
		int  10h
	
		POP bx
		INC bh
		POP cx
	LOOP L5
	
	RET
PrintString ENDP

;==========Proc to display menu==========;

DisplayMenu proc
	CALL DrawLogo
	
	mov color,0FH	
	mov bl,9
	mov bh,18
	LEA si,str1
	mov cx,4
	CALL PrintString
	
	mov bl,11
	mov bh,14
	LEA si,str2
	mov cx,12
	CALL PrintString
		
	mov bl,13
	mov bh,18
	LEA si,str3
	mov cx,4
	CALL PrintString
	
	mov color,12
	mov X1,144
	mov Y1,80
	mov len,1
	mov wid,15
	CALL box
	
	mov X1,113
	mov Y1,96
	mov len,1
	mov wid,47
	CALL box
	
	mov X1,144
	mov Y1,112
	mov len,1
	mov wid,15
	CALL box
	
	mov bl,20
	mov bh,6
	LEA si,str7
	mov cx,28
	mov color,0Fh
	CALL PrintString
	
	CALL MenuClick
	
	RET
DisplayMenu ENDP

;==========Proc to Play Sound==========;

JumpSound Proc
	mov freq,4831
	CALL Sound

	RET
JumpSound endp

PlaySound PROC

	mov freq,1292
	CALL Sound
	mov freq,1355
	CALL Sound
	mov freq,1436
	CALL Sound
	mov freq,1521
	CALL Sound
	mov freq,1612
	CALL Sound
	mov freq,1715
	CALL Sound
	mov freq,1809
	CALL Sound
	mov freq,1917
	CALL Sound
	mov freq,2031
	CALL Sound
	mov freq,2152
	CALL Sound
	mov freq,2280
	CALL Sound
	mov freq,2415
	CALL Sound
	mov freq,2559
	CALL Sound
	mov freq,2711
	CALL Sound
	mov freq,2873
	CALL Sound
	mov freq,3043
	CALL Sound
	mov freq,3225
	CALL Sound
	mov freq,3619
	CALL Sound
	mov freq,3834
	CALL Sound
	mov freq,4063
	CALL Sound
	; mov freq,3043
	; CALL Sound
	; mov freq,2280
	; CALL Sound
	; mov freq,3043
	; CALL Sound
	; mov freq,3619
	; CALL Sound
	; mov freq,2711
	; CALL Sound
	; mov freq,2415
	; CALL Sound
	; mov freq,2559
	; CALL Sound
	; mov freq,2711
	; CALL Sound
	; mov freq,3043
	; CALL Sound
	; mov freq,1809
	; CALL Sound
	; mov freq,1521
	; CALL Sound
	; mov freq,1621
	; CALL Sound
	; mov freq,1521
	; CALL Sound
	; mov freq,1809
	; CALL Sound
	; mov freq,2280
	; CALL Sound
	; mov freq,2031
	; CALL Sound
	; mov freq,2415
	; CALL Sound
	
	RET
PlaySound endp

;==========Proc to check mouse clicks on menu==========;

MenuClick proc
	MouseCheck:
		mov ax,01
		int 33h
	
		mov ax,03
		int 33h
	
		CMP bl,1
		JNE MouseCheck
	
		mov ax, cx
		mov bl,8
		div bl
		mov mouseX, al
		mov ax, dx
		div bl
		mov mouseY, al
		
		.if (mouseX >= 35 && mouseX <=43 && mouseY >= 8 && mouseY <= 9)
			CALL DisplayGameArea
			 
		.elseif (mouseX >= 28 && mouseX <=51 && mouseY == 11)
			CALL instructions
			
		.elseif (mouseX >= 35 && mouseX <=43 && mouseY == 13)
			mov al,03
			mov ah,0
			int 10h
			
		.else
			JMP MouseCheck
		.endif
		 	
		RET
MenuClick ENDP

;==========Proc to draw hearts==========;

DrawHeart proc
	LEA bx,HeartCoordArray
	mov color,12
	mov di,72
	mov dx,0
	
	mov cx,lives
	L6:
		PUSH cx
		mov si,0
		
		J2:
			mov ax,[bx+si]
			add ax,dx
			mov X1,ax
			mov ax,[bx+si+2]
			mov Y1,ax
			mov ax,[bx+si+4]
			mov len,ax
			mov ax,[bx+si+6]
			mov wid,ax	
			
			PUSH dx
			CALL box 
			POP dx
			
			add si,8
			cmp si,di
		JB J2
		
		add dx,20
		POP cx
	LOOP L6
	
	RET
DrawHeart ENDP

;==========Proc to draw stars=========;

DrawStars proc
	LEA bx,StarsArray
	mov color,0FH
	mov di,264
	mov dx,0
	mov si,0

	mov cx,3
	J2:
	PUSH cx
		J1:
			mov ax,[bx+si]
			add ax,starConstant
			mov X1,ax
			mov ax,[bx+si+2]
			mov Y1,ax
			mov ax,[bx+si+4]
			mov len,ax
			mov ax,[bx+si+6]
			mov wid,ax	
			
			CALL smallbox 
			
			add si,8
			cmp si,di
		JB J1
		mov si,0
		sub starConstant,1
		POP cx
	loop J2
	
	RET	
DrawStars endp

;==========Proc to update current score==========;

NewScore proc
	mov ax,check     
	mov bx,100
	div bl
	
	mov rem,ah
	mov quo,al 
	mov ax,0
	mov al,rem
	mov bl,10
	div bl 
	mov rem1,ah
	mov quo1,al 
	mov ax,0
	mov al,quo
	mov bl,10
	div bl 
	mov rem2,ah
	mov quo2,al 
	           
	mov si,0   
	mov al,quo2
	add al,48
	mov convert[si],al 
	mov al,rem2
	add al,48
	mov convert[si+1],al  
	mov al,quo1
	add al,48
	mov convert[si+2],al 
    mov al,rem1
	add al,48
	mov convert[si+3],al 
	
	RET
NewScore Endp

;==========Proc to compare score==========;

CompareScore proc
	mov cx,0
	mov cl,4
	mov si,0
	h:
		mov ax,0
		mov al,buffer1[si]
		mov bl,convert[si]
		cmp buffer1[si],bl
		ja two
		cmp bl,buffer1[si]
		jbe next 
		cmp bl,buffer1[si]
		ja yes     
		           
		     two:
				    mov sc_bool,2	 ;2 means prev is greater 
					mov ah,02h
				    jmp return
		
			yes:
				mov sc_bool,1		;1 means new score is greater
				jmp return 
		
			next:        
			     
				mov sc_bool,0		;0 means they both equal
				jmp cont
			
		cont: 
	 
		inc si
	loop h
	return:
				
	RET
CompareScore ENDP

;==========Proc to write highscore and time==========;

EnterNewScore proc
	;=====File opening(Getting handle of file)=====;
	
	mov al,2		;opening in writing mode
	LEA dx,ScoreRecord
	mov ah,3DH
	int 21h
	
;=====Writing into file=====;
	
	mov cx,4
	mov bx,ax		;moving handle of file from ax(default) into bx	
	LEA dx,convert
	mov ah,40h
	int 21h

;=====Closing File=====;

	mov ah,3EH
	int 21h
;----------------------;
RET
EnterNewScore ENDP

;==========Proc to display score and lives==========;

DisplayScoreAndLives proc	
	mov bl,1
	mov bh,14
	LEA si,str5
	mov cx,6
	mov color,36h
	CALL PrintString
	
	mov bl,1
	mov bh,20
	LEA si,convert
	mov cx,4
	mov color,36h
	CALL PrintString
	
	mov bl,1
	mov bh,25
	LEA si,str6
	mov cx,10
	CALL PrintString
	
	mov bl,1
	mov bh,35
	LEA si,HighScore
	mov cx,4
	mov color,36h
	CALL PrintString
	
	.if(lives!=0)
		CALL DrawHeart
	.endif

	RET

DisplayScoreAndLives ENDP

;==========Proc to Input name=========;

InputName Proc
	mov ah,06h
	mov al,0
	mov cx,0
	mov dh,80
	mov dl,80
	mov bh,0
	int 10h
	
	LEA si,enterName
	mov bl,11
	mov bh,9
	mov cx,13
	mov color,0FH
	CALL PrintString
	
	mov si,0
	J1:
		mov ah,01h			;Taking first string as an input
		int 21h
		
		.if (al != 13)
			mov NameStr[si],al
			inc si
			inc NameSize
		
		.elseif (al == 13)
			RET
		.endif
		
	JMP J1
	
	RET
InputName Endp


;==========Proc to display play screen==========;

DisplayGameArea proc
	mov ah,0
	mov al,13h
	int 10h

	CALL InputName

	mov ah,06h
	mov al,0
	mov cx,0
	mov dh,80
	mov dl,80
	mov bh,0
	int 10h
	
	LEA si,PlayerName
	mov bl,11
	mov bh,9
	mov cx,14
	mov color,0FH
	CALL PrintString
	
	LEA si,NameStr
	mov bl,11
	mov bh,22
	mov cx,5
	mov cl,NameSize
	mov color,36h
	CALL PrintString
	
	mov color,0
	
	mov X1,0
	mov Y1,0
	mov len,10
	mov wid,160
	CALL box
	
	mov color,22
	
	mov X1,0
	mov Y1,180
	mov len,1
	mov wid,160
	CALL box
	
	CALL DrawCloud
	CALL DrawStellar
	CALL CheckScore
	CALL DisplayScoreAndLives
	LEA bx,Hurdle1CoordArray
	mov di,48
	CALL DrawHurdle
	CALL DrawRoad
	CALL DrawDino
	CALL DrawStars
	CALL Play
	RET
DisplayGameArea ENDP

checkLives Proc
	.if(lives==0)
		CALL GameOverDisplay
	.endif
	ret
checkLives endp
	
;==========Proc to display gameover screen=========;
		
GameOverDisplay Proc
	mov ah,0	
	mov al,13h
	int 10h
	
	mov bl,7
	mov bh,11
	LEA si,str8
	mov cx,17
	mov color,0FH
	CALL PrintString
	
	mov color,12
	mov X1,105
	mov Y1,70
	mov len,1
	mov wid,55
	
	CALL box
	CALL CheckScore
	
	LEA si,PlayerName
	mov bl,11
	mov bh,11
	mov cx,14
	mov color,0FH
	CALL PrintString
	
	LEA si,NameStr
	mov bl,11
	mov bh,24
	mov cx,5
	mov cl,NameSize
	mov color,36h
	CALL PrintString
	
	mov bl,13
	mov bh,11
	LEA si,str5
	mov cx,6
	mov color,0FH
	CALL PrintString
	
	mov bl,13
	mov bh,24
	LEA si,convert
	mov cx,4
	mov color,36h
	CALL PrintString
	
	mov color,0FH
	mov bl,15
	mov bh,11
	LEA si,str6
	mov cx,10
	CALL PrintString
	
	mov bl,15
	mov bh,24
	LEA si,HighScore
	mov cx,4
	mov color,36h
	CALL PrintString
	
	mov ah,04ch
	int 21h
GameOverDisplay endp

;==========Procs to check score==========;

TwoDigitNo proc
	mov bl,10
	DIV bl
	
	add al,48
	mov convert[si],al
	inc si
	add ah,48
	mov convert[si],ah
	add si,2
	
	RET
TwoDigitNo ENDP

StoreTime proc
	mov si,17
	
	mov ah,2ch				;Interrupt for checking current time 
	int 21h
	
	mov ax,0
	mov al,ch				;Hours in ch
	CALL TwoDigitNo
		
	mov ax,0
	mov al,cl				;Minutes in cl
	CALL TwoDigitNo			
	
	mov ax,0
	mov al,dh				;Seconds in dh
	CALL TwoDigitNo			
	
	RET
StoreTime Endp

ReadFromFile proc
;=====Opening File=====;

	mov al,0
	LEA dx,ScoreRecord
	mov ah,3DH
	int 21h

;=====Reading from file=====;

	mov cx,4
	mov bx,ax
	LEA dx,buffer1
	mov ah,3FH
	int 21h
	
;=====Closing File=====;

	mov ah,3EH
	int 21h
	
	RET
ReadFromFile Endp

CheckScore proc
	CALL ReadFromFile
	CALL CompareScore

	.if(sc_bool == 1)
		CALL StoreTime
		CALL EnterNewScore
	.endif

	CALL ReadFromFile

	mov cx,4
	mov si,0
	L1:
		mov al,buffer1[si]
		mov HighScore[si],al
		INC si
	LOOP L1

	RET
CheckScore Endp

;==========Proc to ReDraw==========;

DrawScreen proc
	CALL checkLives
	mov ah,06h
	mov al,0
	mov cx,0
	mov dh,80
	mov dl,80
	mov bh,bgcolor
	int 10h
	
	mov color,0
	
	mov X1,0
	mov Y1,0
	mov len,10
	mov wid,160
	CALL box
	
	mov color,22
	
	mov X1,0
	mov Y1,180
	mov len,1
	mov wid,160
	CALL box
	.if(DayORNight==0)
		CALL MoveCloud
		mov	bgcolor , 0Fh
		mov roadcolor , 0
		mov Hurdlecolor , 22
		mov Wingscolor , 25
		mov	Birdcolor , 21
		mov	Dinocolor , 19
		mov	Cloudcolor , 30
		mov x2color	,	1
		mov x5color	, 	6
	.else
		CALL DrawStars
		mov	bgcolor , 0
		mov roadcolor , 0Fh
		mov Hurdlecolor , 25
		mov Wingscolor , 28
		mov	Birdcolor , 23
		mov	Dinocolor ,	0Fh
		mov	Cloudcolor , 7
		mov x2color	,	9
		mov x5color	, 	14
	.endif
	
	.if(bool2==1)
		mov bool2,0
		sub lives,1
		mov Dinocolor,4
		CALL DrawCheckDino
	.endif

	.if(bool6==1)
		mov bool6,0
		.if(lives<5)
			add lives,1
		.endif
	.endif
	.if(bool8==1)
		add check,200
		mov bool8,0
	.endif
	.if(bool10==1)
		add check,500
		mov bool10,0
	.endif
	
	mov ax,check1
	mov bx,check1
	add bx,1000
	.if(check >= ax && check <= bx)
		SUB speed,2500
		ADD check1,1000
	.endif
	
	CALL MoveStellar
	CALL DisplayScoreAndLives
	RET
DrawScreen Endp

generateRandomNumber proc
	MOV AH, 00h  ; interrupts to get system time        
	INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

	mov  ax, dx
	xor  dx, dx
	mov  cx, dividand  
	div  cx       ; here dx contains the remainder of the division - from 0 to 9 

	RET
generateRandomNumber ENDP

ReDraw proc
	.if(lives==0)
		CALL GameOverDisplay
		mov ah ,04ch
		int 21h
	.endif

	CALL DrawDino
	CALL MoveRoad
	.if(bool3 == 1)
		CALL MoveBird
	.elseif(bool3 == 0)
		CALL MoveHurdle
	.endif

	inc check
	CALL NewScore
	CALL CheckScore
	CALL Timer
	CALL MoveX2PowerUp
	CALL MoveX5PowerUp
	CALL MoveHeart

	RET
ReDraw ENDP

;==========Proc to Play==========;

Play PROC

	KeyCheck:
		mov ah,0h
		int 16h
	
		KeyBuffer:
			mov ah,01h
			int 16h
			JZ MoveLegs
			
			.if(al==32 || ax==4800h)
				;CALL JumpSound
				CALL JumpDino
				
			.elseif(ax == 4D00h)
				CALL moveDinoToRight
			
			.elseif(ax == 4B00h)
				CALL moveDinoToLeft
			
			.elseif(ax == 5000h)
				mov bool4,15
				J3:
					inc check
					CALL NewScore
					CALL CheckScore
					CALL DrawScreen
					CALL CrouchDino
					CALL MoveRoad
					CALL MoveX2PowerUp
					CALL MoveX5PowerUp
					CALL MoveHeart
					.if(bool3 == 1)
						CALL MoveBird
					.elseif(bool3 == 0)
						CALL MoveHurdle
					.endif
				
					CALL Delay
					dec bool4
					CMP bool4,1
				JNE J3
			.endif
			JMP KeyCheck

		MoveLegs:
			CALL DrawScreen
			CALL ReDraw
			CALL Delay
			JMP KeyBuffer
	
	RET
Play ENDP

;==========Proc to draw dino==========;

moveDinoToRight proc
	mov ax,DinoCoordArray[0]
	.if(ax < 299)
		mov si,0
		J1:	
			.if(si<72)
				add EraseLegs[si],4
			.endif
			
			.if(si<56)
				add DrawLeftLegsUp2[si],4
			.endif
			
			.if(si<40)
				add DrawLeftLegsUp1[si],4
			.endif
			
			.if(si<48)
				add DrawRightLegsUp2[si],4
			.endif
			
			.if(si<32)
				add DrawRightLegsUp1[si],4
			.endif
			
			.if(si<176)
				add DinoDownCoordArray[si],4
			.endif
			
			add DinoCoordArray[si],4
				
			add si,8
			cmp si,264
		JB J1
	.endif
	RET
moveDinoToRight ENDP

moveDinoToLeft proc
	mov ax,DinoCoordArray[0]
	.if(ax > 24)
		mov si,0
		J1:	
			.if(si<72)
				sub EraseLegs[si],4
			.endif
			
			.if(si<56)
				sub DrawLeftLegsUp2[si],4
			.endif
			
			.if(si<40)
				sub DrawLeftLegsUp1[si],4
			.endif
			
			.if(si<48)
				sub DrawRightLegsUp2[si],4
			.endif
			
			.if(si<32)
				sub DrawRightLegsUp1[si],4
			.endif
			
			.if(si<176)
				sub DinoDownCoordArray[si],4
			.endif
			
			sub DinoCoordArray[si],4
				
			add si,8
			cmp si,264
		JB J1
	.endif
	RET
moveDinoToLeft ENDP

CrouchDino proc
	LEA bx,DinoDownCoordArray
	mov al,Dinocolor
	mov color,al
	
	mov si,0
	mov di,0
	J1:
		mov ax,[bx+si]
		mov X1,ax
		mov CheckArray[di],ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov CheckArray[di+2],ax
		mov ax,[bx+si+4]
		mov len,ax
		mov CheckArray[di+4],ax
		mov ax,[bx+si+6]
		mov wid,ax
		mov CheckArray[di+6],ax			
		CALL box 	
			
		add si,8
		add di,8
		
		.if(si == 176)
			mov si,0
		.endif
		
		cmp di,264
	JB J1
	
	.if (bool <= 2)
		CALL NoLegs
		LEA bx,DrawRightLegsUp2
		mov di,40
		CALL DrawDinoLeftLegs
		
		mov ax,[bx+si]
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax
		
		.if(DayORNight==0)
			mov color,0Fh
		.else
			mov color,00h
		.endif
		CALL box
		
		INC bool
	.elseif (bool <= 6)
		CALL NoLegs
		LEA bx,DrawLeftLegsUp2
		mov di,48
		CALL DrawDinoRightLegs
		
		mov ax,[bx+si]
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax
		
		.if(DayORNight==0)
			mov color,0Fh
		.else
			mov color,00h
		.endif
		CALL box
		
		INC bool
	.else
		mov bool,0
	.endif
	
	RET
CrouchDino ENDP

JumpDino Proc
	J0:
		CALL DrawScreen
		
		.if (UpOrDownConstant==0)
			add jumpconstant,6
		.else
			sub jumpconstant,6
		.endif
		mov al,Dinocolor
		mov color,al
		LEA bx,DinoCoordArray
		mov si,0
		J2:
			mov ax,[bx+si]
			mov X1,ax
			mov CheckArray[si],ax
			mov ax,[bx+si+2]
			sub ax,jumpconstant
			mov Y1,ax
			mov CheckArray[si+2],ax
			mov ax,[bx+si+4]
			mov len,ax
			mov CheckArray[si+4],ax
			mov ax,[bx+si+6]
			mov wid,ax
			mov CheckArray[si+6],ax			
			CALL box 

			add si,8
			cmp si,264
		JB J2
		
		INC check
		CALL NewScore
		CALL CheckScore
		CALL MoveRoad
		.if(bool3 == 1)
			CALL MoveBird
		.elseif(bool3 == 0)
			CALL MoveHurdle
		.endif
		CALL MoveX2PowerUp
		CALL MoveX5PowerUp
		CALL MoveHeart
		CALL Delay 
		
		.if(jumpconstant<48 && UpOrDownConstant==0)
			mov UpOrDownConstant,0
			jmp J0
		.elseif(cpyconstant==0)
			mov UpOrDownConstant,0
			mov cpyconstant,7
			RET
		.elseif(jumpconstant==48 || UpOrDownConstant==1)
			mov UpOrDownConstant,1
			dec cpyconstant
	JMP J0
	.endif
	
JumpDino endp

DrawDino proc
	LEA bx,DinoCoordArray
	mov al,Dinocolor
	mov color,al   
	mov di,264
	
	mov si,0
	J1:
		mov ax,[bx+si]
		mov X1,ax
		mov CheckArray[si],ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov CheckArray[si+2],ax
		mov ax,[bx+si+4]
		mov len,ax
		mov CheckArray[si+4],ax
		mov ax,[bx+si+6]
		mov wid,ax
		mov CheckArray[si+6],ax			
		CALL box 	
				
		add si,8
		cmp si,di
	JB J1
	
	.if (bool != -1)
		CALL NoLegs
		
		.if (bool <= 2)
			LEA bx,DrawRightLegsUp1
			mov di,32
			CALL DrawDinoLeftLegs
			INC bool
		.elseif (bool <= 6)
			LEA bx,DrawLeftLegsUp1
			mov di,40
			CALL DrawDinoRightLegs
			INC bool
		.else
			mov bool,0
		.endif
	
	.else
		INC bool
	.endif
	
	RET
DrawDino ENDP
	
DrawCheckDino proc
	LEA bx,CheckArray
	mov al,Dinocolor
	mov color,al  
	
	mov si,0
	J1:
		mov ax,[bx+si]
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax			
		CALL box 	
			
		add si,8
		cmp si,di
	JB J1
	
	RET
DrawCheckDino ENDP

PowerUpScoreX5Genertor proc

	CALL Timer
	mov dl,seconds
	mov randNoForX5,dl
	RET
PowerUpScoreX5Genertor endp

PowerUpScoreX2Genertor proc

	CALL Timer
	mov dl,seconds
	mov randNoForX2,dl
	RET
PowerUpScoreX2Genertor endp

PowerUpLiveGenertor proc

	CALL Timer
	mov dl,seconds
	mov randNoForHearts,dl
	RET
PowerUpLiveGenertor endp

DrawPowerHeartUp proc

	LEA bx,HeartPowerUpArray
	mov color,12
	mov di,50
	CALL SmallheartDraw

	RET
DrawPowerHeartUp endp

DrawPowerX5Up proc

	LEA bx,X5Array
	mov al,x5color
	mov color,al
	mov di,80
	CALL SmallX5Draw

	RET
DrawPowerX5Up endp	

MoveX5PowerUp	proc

.if(bool9==0)

		CALL PowerUpScoreX5Genertor	

	.endif
	.if(randNoForX5==50)
		mov bool9,1
		.if(X5constant<285)
			add X5constant,5
			CALL DrawPowerX5Up
		.else
			mov X5Constant,0
			mov randNoForX5,0
			mov bool9,0
		.endif
		
	.if(bool10==1)
			mov X5Constant,0
			mov randNoForX5,0
			mov bool9,0
	.endif
	.endif
	
	RET

MoveX5PowerUp  endp

DrawPowerX2Up proc

	LEA bx,X2Array
	mov al,x2color
	mov color,al
	mov di,80
	CALL SmallX2Draw

	RET
DrawPowerX2Up endp	

MoveX2PowerUp	proc

.if(bool7==0)

		CALL PowerUpScoreX2Genertor	

	.endif
	.if(randNoForX2==10)
		mov bool7,1
		.if(X2constant<285)
			add X2constant,5
			CALL DrawPowerX2Up
		.else
			mov X2Constant,0
			mov randNoForX2,0
			mov bool7,0
		.endif
		
	.if(bool8==1)
			mov X2Constant,0
			mov randNoForX2,0
			mov bool7,0
	.endif
	.endif
	
	RET

MoveX2PowerUp  endp

MoveHeart proc

	.if(bool5==0)
		CALL PowerUpLiveGenertor	
	.endif
	
	.if(randNoForHearts==30)
		mov bool5,1
		.if(HeartConstant<285)
			add HeartConstant,5
			CALL DrawPowerHeartUp
		.else
			mov HeartConstant,0
			mov randNoForHearts,0
			mov bool5,0
		.endif
		
	.if(bool6==1)
		mov HeartConstant,0
		mov randNoForHearts,0
		mov bool5,0
	.endif
	.endif
	
	RET
MoveHeart endp
	
DrawDinoLeftLegs proc

	mov al,Dinocolor
	mov color,al  
	CALL Draw
	
	RET
DrawDinoLeftLegs endp	

DrawDinoRightLegs proc

	mov al,Dinocolor
	mov color,al   
	CALL Draw
	
	RET
DrawDinoRightLegs endp

NoLegs proc
	LEA bx,EraseLegs
	.if(DayORNight==0)
	mov color,0Fh
	.else
	mov color,00h
	.endif
	mov di,72
	CALL Draw

	RET
NoLegs endp

LevelUp PROC
	mov bx,Y1
	mov check_Y,bx
	mov bx,X1
	mov check_X,bx
	
	LEA bx,CheckArray
	mov si,0		
	L1:
		LEA bx,CheckArray
		PUSH bx
		mov ax,wid
		mov bl,1
		mul bl
		add ax,check_X
		mov dx,check_X
		POP bx
		
		.if(([bx+si] >= dx) && ([bx+si] <= (ax)))
			mov ax,len
			PUSH bx
			mov bl,1
			mul bl
			add ax,check_Y
			mov dx,check_Y
			POP bx
			.if (([bx+si+2]>=dx) && ([bx+si+2]<=(ax)))
				.if(checkheart==1)
				mov bool6,1
				.elseif(checkX2==1)
				mov bool8,1
				.elseif(checkX5==1)
				mov bool10,1
				.endif
				RET
			.endif
		.endif
		
		PUSH bx
		mov ax,[bx + si + 6]
		mov bl,1
		mul bl
		POP bx
		add ax,[bx + si]
		mov dx,[bx + si]
		mov cx,check_X
		.if((cx >= dx) && (cx <= ax))
			mov ax,[bx + si + 4]
			PUSH bx
			mov bl,1
			mul bl
			POP bx
			add ax,[bx + si + 2]
			mov dx,[bx + si + 2]
			mov bx,check_Y
			.if ((bx>=dx) && (bx <=ax))
			.if(checkheart==1)
				mov bool6,1
				.elseif(checkX2==1)
				mov bool8,1
				.elseif(checkX5==1)
				mov bool10,1
				.endif
				RET
			.endif
		.endif
		add si,8
		cmp si,264
	JB L1
RET
LevelUp endp

;=============Proc to Game Over==============;

GameOver PROC
	mov bx,Y1
	mov check_Y,bx
	mov bx,X1
	mov check_X,bx
	
	LEA bx,CheckArray
	mov si,0		
	L1:
		LEA bx,CheckArray
		PUSH bx
		mov ax,wid
		mov bl,2
		mul bl
		add ax,check_X
		mov dx,check_X
		POP bx
		
		.if(([bx+si] >= dx) && ([bx+si] <= (ax)))
			mov ax,len
			PUSH bx
			mov bl,2
			mul bl
			add ax,check_Y
			mov dx,check_Y
			POP bx
			.if (([bx+si+2]>=dx) && ([bx+si+2]<=(ax)))
				mov bool2,1
				RET
			.endif
		.endif
		
		PUSH bx
		mov ax,[bx + si + 6]
		mov bl,2
		mul bl
		POP bx
		add ax,[bx + si]
		mov dx,[bx + si]
		mov cx,check_X
		.if((cx >= dx) && (cx <= ax))
			mov ax,[bx + si + 4]
			PUSH bx
			mov bl,2
			mul bl
			POP bx
			add ax,[bx + si + 2]
			mov dx,[bx + si + 2]
			mov bx,check_Y
			.if ((bx>=dx) && (bx <=ax))
				mov bool2,1
				RET
			.endif
		.endif
		
		add si,8
		cmp si,264
	JB L1
RET
GameOver endp

;==========Proc to draw bird's body==========;

DrawBird proc
	mov al,Birdcolor
	mov color,al   ;Birdcolor db 21
	mov di,104
	mov si,0
	J1:
		mov ax,[bx+si]
		sub ax,birdConstant
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax	
		 
		CALL box
		 
		.if (bool2 != 1)
			PUSH si
			PUSH bx
			PUSH di
			CALL GameOver
			POP di
			POP bx
			POP si
		.endif
		
		add si,8
		cmp si,di
	JB J1

	.if (bool1 <= 25)
		.if(randNoForBirds == 0)
			LEA bx, WingsUp1CoordArray
			CALL DrawWingsUp
		
		.elseif(randNoForBirds == 1)
			LEA bx, WingsUp2CoordArray
			CALL DrawWingsUp
		.else
			LEA bx,WingsUp3CoordArray
			CALL DrawWingsUp
		.endif
		INC bool1
		
	.elseif (bool1 <= 50)
		.if(randNoForBirds == 0)
			LEA bx, WingsDown1CoordArray
			CALL DrawWingsDown
		
		.elseif(randNoForBirds == 1)
			LEA bx, WingsDown2CoordArray
			CALL DrawWingsDown
		
		.else
			LEA bx,WingsDown3CoordArray
			CALL DrawWingsDown
		.endif
		 INC bool1
		
	.else
		mov bool1,0
	.endif

	RET
DrawBird ENDP

MoveBird Proc
	.if (birdConstant < 280 && bool3== 1)
		.if(randNoForBirds == 0)
			LEA bx,Bird1CoordArray
			CALL DrawBird
			
		.elseif(randNoForBirds == 1)
			LEA bx,Bird2CoordArray
			CALL DrawBird
		.else
			LEA bx,Bird3CoordArray
			CALL DrawBird
		.endif
		ADD birdConstant,7
	.else
		mov bool3,0
		mov birdConstant,0
		mov dividand,3
		CALL generateRandomNumber
		mov randNoForBirds,dl
	.endif
	
	.if(bool2==1)
		mov birdConstant,0
		mov dividand,2
		CALL generateRandomNumber
		mov randNoForBirds,dl
		.endif
	
	RET 
MoveBird endp

;==========Proc to draw bird's upper wings==========;

DrawWingsUp PROC
	mov al,Wingscolor
	mov color,al   ;Wingscolor db 25
	mov di,64
	mov si,0
	J1:
		mov ax,[bx + si]
		sub ax,birdConstant
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax	
		
		CALL box 
		
		.if (bool2 != 1)
			PUSH si
			PUSH bx
			PUSH di
			CALL GameOver
			POP di
			POP bx
			POP si
		.endif
		
		add si,8
		cmp si,di
	JB J1

	RET
DrawWingsUp Endp

;==========Proc to draw bird's lower wings==========;

DrawWingsDown PROC
	mov al,Wingscolor
	mov color,al 
	mov di,64
	mov si,0
	J1:
		mov ax,[bx + si]
		sub ax,birdConstant
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax	
		
		CALL box 
		
		.if (bool2 != 1)
			PUSH si
			PUSH bx
			PUSH di
			CALL GameOver
			POP di
			POP bx
			POP si
		.endif
		
		add si,8
		cmp si,di
	JB J1
	
	RET
DrawWingsDown Endp

Delay Proc
	MOV CX, 00h
	MOV DX, speed
	MOV AH, 86H      ;BIOS Wait/Delay function
	INT 15H
	
	RET
Delay endp

Timer proc
		mov ah,2ch
		int 21h
		mov seconds,dh 
		
		RET
Timer endp

Modulus proc
		mov ax,0
		mov dx,0
		mov al,fps
		mov bl,modul
		div bl
		mov fps,ah
		
		RET
Modulus endp

;==========Proc to produce sound==========;

Sound proc
 
 mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 4560        ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 25          ; Pause for duration of note.
pause1:
        mov     cx, 6550
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al         ; Send new value.
RET
Sound endp
	
;==========Proc to draw sun==========;
		
DrawStellar proc
	.if(DayORNight==0)
	LEA bx,SunCoordArray
	mov di,120
	mov color,14
	mov si,0
	.else
	LEA bx,MoonCoordArray
	mov di,120
	mov color,0Fh
	mov si,0
	.endif
	S1:
		mov ax,[bx+si]
		sub ax,sunConstant
		mov X1,ax
		mov ax,[bx+si+2]
		sub ax,sunradius
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax	
		
		CALL box 
		
		add si,8
		cmp si,di
	JB S1
	.if(onlydrawVar==312)
	add onlymovVar,6
	.else
	mov onlymovVar,0
	add onlydrawVar,6
	.endif
	RET
DrawStellar ENDP

MoveStellar proc
	.if(onlymovVar>0)
		.if(sunConstant >=0 && sunConstant<162)
			ADD sunConstant,6
			SUB sunradius,1
		
		.elseif(sunConstant >= 162 && sunConstant<312)
			.if(sunConstant==162)
					.if(DayORNight==1)
						mov DayORNight,0
					.else
						mov DayORNight,1
					.endif
			.endif
			ADD sunConstant,6
			ADD sunradius,1
		.endif
		.if(onlymovVar==312)
		mov onlydrawVar,0
		.endif
		CALL DrawStellar
		ret
	.endif
	.if(onlydrawVar<=312 && onlydrawVar>=0)
		mov onlymovVar,0
		mov sunConstant,0
		mov sunradius,0
		CALL DrawStellar
		.endif
		RET
MoveStellar ENDP
;==========Proc to draw hurdles==========;

DrawHurdle proc
	mov al,Hurdlecolor
	mov color,al	;db Hurdlecolor 22
	mov si,0
	J1:
		mov ax,[bx+si]
		sub ax,hurdleConstant
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax	
		
		.if (bool2 != 1)
			PUSH si
			PUSH bx
			PUSH di
			CALL GameOver
			POP di
			POP bx
			POP si
		.endif 
		
		CALL box
		
		add si,8
		cmp si,di
	JB J1

	RET
DrawHurdle ENDP

MoveHurdle proc
	.if(hurdleConstant < 290 && bool3 == 0)
		.if(randNoForHurdles == 0)
			LEA bx,Hurdle1CoordArray
			mov di,48
			CALL DrawHurdle
		
		.elseif(randNoForHurdles == 1)
			LEA bx,Hurdle2CoordArray
			mov di,40
			CALL DrawHurdle
			
		.elseif(randNoForHurdles == 2)
			LEA bx,Hurdle3CoordArray
			mov di,32
			CALL DrawHurdle
		.endif
		ADD hurdleConstant,7
	
	.else
		mov bool3,1
		mov hurdleConstant,0
		mov dividand,3
		CALL generateRandomNumber
		mov randNoForHurdles,dl
	.endif
		
	.if(bool2==1)
		mov hurdleConstant,0
		mov dividand,3
		CALL generateRandomNumber
		mov randNoForHurdles,dl
	.endif
		
	RET
MoveHurdle ENDP

;==========Proc to draw logo on menu screen==========;

DrawLogo PROC
	mov color,12
	LEA bx,MenuLOGO
	mov di,352
	CALL Draw
	RET
DrawLogo endp

;==========Proc to draw road==========;

DrawRoad PROC
	mov al,roadcolor
	mov color,al
	LEA bx,RoadCoordArray
	mov di,176
	mov si,0
	J1:
		mov ax,[bx+si]
		sub ax,roadConstant
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax	
		
		CALL box 
		
		add si,8
		cmp si,di
	JB J1
	
	RET
DrawRoad ENDP

MoveRoad proc
	.if(roadConstant < 250)
		ADD roadConstant,7
	.else
		mov roadConstant,0
	.endif
	
	CALL DrawRoad
	
	RET
MoveRoad ENDP

;==========Proc to draw clouds==========;

DrawCloud proc
	mov al,Cloudcolor
	mov color,al
	LEA bx,CloudCoordArray
	mov di,72
	mov si,0
	cloud:
		mov ax,[bx+si]
		sub ax,cloudConstant
		mov X1,ax
		mov ax,[bx+si+2]
		mov Y1,ax
		mov ax,[bx+si+4]
		mov len,ax
		mov ax,[bx+si+6]
		mov wid,ax	
		
		CALL box 
		
		add si,8
		cmp si,72
	JB cloud
	
	RET
DrawCloud ENDP

MoveCloud proc

	.if(cloudConstant < 268)
		ADD cloudConstant,1
	.else
		mov cloudConstant,0
	.endif
	
	CALL DrawCloud

	RET
MoveCloud ENDP

;==========Proc to display instruction screen and check mouse clicks==========;

Instructions proc
	mov ah,0
	mov al,13h
	int 10h
	
	mov al,0
	LEA dx,file
	mov ah,3DH
	int 21h
	
	mov bx,ax
	LEA dx,buffer
	mov ah,3FH
	int 21h
	
	LEA dx,buffer
	mov ah,09h
	int 21h
	
	mov ah,3EH
	int 21h
	
	
	mov bl,13
	mov bh,7
	LEA si,str4
	mov cx,4
	mov color,12
	
	CALL PrintString
	
	mov bl,13
	mov bh,27
	LEA si,str3
	mov cx,4
	
	CALL PrintString
	
	MouseCheck1:
		mov ax,01
		int 33h
	
		mov ax,03
		int 33h
	
		CMP bl,1
		JNE MouseCheck1
	
		mov ax, cx
		mov bl,8
		div bl
		mov mouseX, al
		mov ax, dx
		div bl
		mov mouseY, al
		
		.if (mouseX >= 14 && mouseX <=21 && mouseY == 13)
			mov ah,0
			mov al,13h
			int 10h
			CALL DisplayMenu
			 
		.elseif (mouseX >= 54 && mouseX <=61 && mouseY == 13)
			mov al,3
			mov ah,0
			int 10h
		
		.else
			JMP MouseCheck1
		.endif
Instructions ENDP

end main