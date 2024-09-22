;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module joypadMgmt
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _subPixCalc
	.globl _joypad
	.globl _gravityGhost
	.globl _pcFacing
	.globl _joypadMgr
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_activeBones:
	.ds 1
_boneCounter:
	.ds 1
_frameCounter:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_ghostySpeedX:
	.ds 2
_ghostySpeedY:
	.ds 2
_ghostyY:
	.ds 2
_ghostyX:
	.ds 2
_pcFacing::
	.ds 1
_gravityGhost::
	.ds 2
_pghostyX:
	.ds 2
_pghostyY:
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:39: void joypadMgr(void){
;	---------------------------------
; Function joypadMgr
; ---------------------------------
_joypadMgr::
	add	sp, #-5
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:50: joypadCurrent = joypad();
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:70: if(ghostySpeedY > MAX_SPD_UP){            
	ld	hl, #_ghostySpeedY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:71: ghostySpeedY -= SPD_CHANGE;
	ld	a, c
	add	a, #0xf8
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ldhl	sp,	#1
	ld	(hl), e
	inc	hl
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:61: if(joypadCurrent & J_UP){
	push	hl
	dec	hl
	dec	hl
	bit	2, (hl)
	pop	hl
	jr	Z, 00118$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:70: if(ghostySpeedY > MAX_SPD_UP){            
	ld	e, b
	ld	d, #0xfc
	ld	a, #0x18
	cp	a, c
	ld	a, #0xfc
	sbc	a, b
	bit	7, e
	jr	Z, 00365$
	bit	7, d
	jr	NZ, 00366$
	cp	a, a
	jr	00366$
00365$:
	bit	7, d
	jr	Z, 00366$
	scf
00366$:
	jp	NC, 00119$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:71: ghostySpeedY -= SPD_CHANGE;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_ghostySpeedY),a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_ghostySpeedY + 1),a
	jp	00119$
00118$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:76: ghostySpeedY += SPD_CHANGE;
	ld	hl, #0x0008
	add	hl, bc
	ld	e, l
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), e
	inc	hl
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:73: } else if(joypadCurrent & J_DOWN){
	push	hl
	ldhl	sp,	#2
	bit	3, (hl)
	pop	hl
	jr	Z, 00115$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:75: if(ghostySpeedY < MAX_SPD_DOWN){
	ld	a, c
	sub	a, #0xe8
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x83
	jr	NC, 00119$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:76: ghostySpeedY += SPD_CHANGE;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedY),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_ghostySpeedY + 1),a
	jr	00119$
00115$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:79: if(ghostySpeedY > 0){
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00368$
	bit	7, d
	jr	NZ, 00369$
	cp	a, a
	jr	00369$
00368$:
	bit	7, d
	jr	Z, 00369$
	scf
00369$:
	jr	NC, 00112$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:81: ghostySpeedY -= SPD_CHANGE;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_ghostySpeedY),a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_ghostySpeedY + 1
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:83: if(ghostySpeedY < 0){
	ld	(hl-), a
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00119$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:84: ghostySpeedY = 0;
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00119$
00112$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:86: } else if(ghostySpeedY < 0){
	bit	7, b
	jr	Z, 00119$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:88: ghostySpeedY += SPD_CHANGE;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedY),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	hl, #_ghostySpeedY + 1
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:90: if (ghostySpeedY > 0){
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00370$
	bit	7, d
	jr	NZ, 00371$
	cp	a, a
	jr	00371$
00370$:
	bit	7, d
	jr	Z, 00371$
	scf
00371$:
	jr	NC, 00119$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:91: ghostySpeedY = 0;
	xor	a, a
	ld	hl, #_ghostySpeedY
	ld	(hl+), a
	ld	(hl), a
00119$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:98: if(ghostySpeedX > MAX_SPD_LEFT){
	ld	hl, #_ghostySpeedX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:99: ghostySpeedX -= SPD_CHANGE;
	ld	a, c
	add	a, #0xf8
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ldhl	sp,	#1
	ld	(hl), e
	inc	hl
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:96: if(joypadCurrent & J_LEFT){
	push	hl
	dec	hl
	dec	hl
	bit	1, (hl)
	pop	hl
	jr	Z, 00142$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:98: if(ghostySpeedX > MAX_SPD_LEFT){
	ld	e, b
	ld	d, #0xfc
	ld	a, #0x18
	cp	a, c
	ld	a, #0xfc
	sbc	a, b
	bit	7, e
	jr	Z, 00373$
	bit	7, d
	jr	NZ, 00374$
	cp	a, a
	jr	00374$
00373$:
	bit	7, d
	jr	Z, 00374$
	scf
00374$:
	jr	NC, 00122$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:99: ghostySpeedX -= SPD_CHANGE;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_ghostySpeedX + 1),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:102: while(pcFacing!=0){
00122$:
	ld	hl, #_pcFacing
	ld	a, (hl)
	or	a, a
	jp	Z, 00143$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:103: pcFacing = 0;
	ld	(hl), #0x00
	jr	00122$
00142$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:110: ghostySpeedX += SPD_CHANGE;
	ld	hl, #0x0008
	add	hl, bc
	ld	e, l
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), e
	inc	hl
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:106: } else if(joypadCurrent & J_RIGHT){
	push	hl
	ldhl	sp,	#2
	bit	0, (hl)
	pop	hl
	jr	Z, 00139$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:108: if(ghostySpeedX < MAX_SPD_RIGHT){
	ld	a, c
	sub	a, #0xe8
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x83
	jr	NC, 00126$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:110: ghostySpeedX += SPD_CHANGE;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_ghostySpeedX + 1),a
00126$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:113: if(pcFacing==0){
	ld	hl, #_pcFacing
	ld	a, (hl)
	or	a, a
	jr	NZ, 00143$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:114: pcFacing = 1;
	ld	(hl), #0x01
	jr	00143$
00139$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:117: if(ghostySpeedX > 0){
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00376$
	bit	7, d
	jr	NZ, 00377$
	cp	a, a
	jr	00377$
00376$:
	bit	7, d
	jr	Z, 00377$
	scf
00377$:
	jr	NC, 00136$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:119: ghostySpeedX -= SPD_CHANGE;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_ghostySpeedX + 1
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:121: if(ghostySpeedX < 0){
	ld	(hl-), a
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00143$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:122: ghostySpeedX = 0;
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00143$
00136$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:124: } else if(ghostySpeedX < 0){
	bit	7, b
	jr	Z, 00143$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:126: ghostySpeedX += SPD_CHANGE;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	hl, #_ghostySpeedX + 1
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:128: if (ghostySpeedX > 0){
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00378$
	bit	7, d
	jr	NZ, 00379$
	cp	a, a
	jr	00379$
00378$:
	bit	7, d
	jr	Z, 00379$
	scf
00379$:
	jr	NC, 00143$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:129: ghostySpeedX = 0;
	xor	a, a
	ld	hl, #_ghostySpeedX
	ld	(hl+), a
	ld	(hl), a
00143$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:143: subPixCalc(pghostyX,pghostyY,ghostySpeedX,ghostySpeedY);
	ld	hl, #_ghostySpeedY
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_ghostySpeedX
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_pghostyY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_pghostyX
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_subPixCalc
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:145: if(ghostyY <= CEILING){
	ld	hl, #_ghostyY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:151: ghostySpeedY = ghostySpeedY >> 1;
	ld	a, (#_ghostySpeedY)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (#_ghostySpeedY + 1)
	ldhl	sp,	#4
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:145: if(ghostyY <= CEILING){
	ld	e, b
	ld	d, #0x00
	ld	a, #0x17
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00380$
	bit	7, d
	jr	NZ, 00381$
	cp	a, a
	jr	00381$
00380$:
	bit	7, d
	jr	Z, 00381$
	scf
00381$:
	jr	C, 00149$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:147: if(ghostySpeedY < 0){
	ld	hl, #_ghostySpeedY
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00150$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:150: ghostyY = CEILING;
	ld	hl, #_ghostyY
	ld	a, #0x17
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:151: ghostySpeedY = ghostySpeedY >> 1;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedY),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	hl, #_ghostySpeedY + 1
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:152: ghostySpeedY = -ghostySpeedY;
	ld	(hl-), a
	xor	a, a
	sub	a, (hl)
	ld	(hl+), a
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
	jr	00150$
00149$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:154: } else if (ghostyY >= FLOOR){
	ld	a, c
	sub	a, #0x84
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00150$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:157: ghostyY = FLOOR;
	ld	hl, #_ghostyY
	ld	a, #0x84
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:159: ghostySpeedY = ghostySpeedY >> 1;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedY),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	hl, #_ghostySpeedY + 1
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:160: ghostySpeedY = -ghostySpeedY;
	ld	(hl-), a
	xor	a, a
	sub	a, (hl)
	ld	(hl+), a
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
00150$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:163: if(ghostyX <= SCREEN_LEFT_BOUND){
	ld	hl, #_ghostyX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	ld	d, #0x00
	ld	a, #0x0f
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00382$
	bit	7, d
	jr	NZ, 00383$
	cp	a, a
	jr	00383$
00382$:
	bit	7, d
	jr	Z, 00383$
	scf
00383$:
	jr	C, 00154$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:165: if(ghostySpeedX < 0){            
	ld	hl, #_ghostySpeedX
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00154$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:167: ghostyX = SCREEN_LEFT_BOUND;
	ld	hl, #_ghostyX
	ld	a, #0x0f
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:168: ghostySpeedX = ghostySpeedX >> 1;
	ld	hl, #_ghostySpeedX + 1
	sra	(hl)
	dec	hl
	rr	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:169: ghostySpeedX = -ghostySpeedX;
	xor	a, a
	sub	a, (hl)
	ld	(hl+), a
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
00154$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:173: if(ghostyX >= SCREEN_RIGHT_BOUND){
	ld	hl, #_ghostyX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0xa0
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00158$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:175: if(ghostySpeedX > 0){            
	ld	hl, #_ghostySpeedX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00384$
	bit	7, d
	jr	NZ, 00385$
	cp	a, a
	jr	00385$
00384$:
	bit	7, d
	jr	Z, 00385$
	scf
00385$:
	jr	NC, 00158$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:180: ghostyX = SCREEN_RIGHT_BOUND;
	ld	hl, #_ghostyX
	ld	a, #0xa0
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:181: ghostySpeedX = ghostySpeedX >> 1;
	ld	hl, #_ghostySpeedX + 1
	sra	(hl)
	dec	hl
	rr	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:182: ghostySpeedX = -ghostySpeedX;
	xor	a, a
	sub	a, (hl)
	ld	(hl+), a
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
00158$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:187: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
	ld	hl, #_ghostyY
	ld	c, (hl)
	ld	a, (#_ghostyX)
	ldhl	sp,	#4
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:186: if(pcFacing==0){
	ld	a, (#_pcFacing)
	or	a, a
	jr	NZ, 00162$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:187: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
	ldhl	sp,	#4
	ld	b, (hl)
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:200: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_ghostyMS)
	ld	(hl+), a
	ld	(hl), #>(_ghostyMS)
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:201: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:202: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:203: return __move_metasprite_flipx(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ld	d, c
	ld	a, b
	add	a, #0xf8
	ld	e, a
	xor	a, a
	call	___move_metasprite_flipx
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:187: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
	jr	00166$
00162$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:188: } else if(pcFacing==1){
	ld	a, (#_pcFacing)
	dec	a
	jr	NZ, 00166$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:189: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
	ldhl	sp,	#4
	ld	e, (hl)
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_ghostyMS)
	ld	(hl+), a
	ld	(hl), #>(_ghostyMS)
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:162: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	d, c
	xor	a, a
	call	___move_metasprite
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:189: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
00166$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:192: }
	add	sp, #5
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__ghostySpeedX:
	.dw #0x0000
__xinit__ghostySpeedY:
	.dw #0x0000
__xinit__ghostyY:
	.dw #0x0050
__xinit__ghostyX:
	.dw #0x0050
__xinit__pcFacing:
	.db #0x01	; 1
__xinit__gravityGhost:
	.dw #0x0001
__xinit__pghostyX:
	.dw _ghostyX
__xinit__pghostyY:
	.dw _ghostyY
	.area _CABS (ABS)
