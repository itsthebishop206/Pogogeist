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
	.globl _pghostyY
	.globl _pghostyX
	.globl _gravityGhost
	.globl _pcFacing
	.globl _ghostyX
	.globl _ghostyY
	.globl _ghostySpeedY
	.globl _ghostySpeedX
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
_ghostySpeedX::
	.ds 2
_ghostySpeedY::
	.ds 2
_ghostyY::
	.ds 2
_ghostyX::
	.ds 2
_pcFacing::
	.ds 1
_gravityGhost::
	.ds 2
_pghostyX::
	.ds 2
_pghostyY::
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:41: if(ghostySpeedY < MAX_SPD_DOWN){
	ld	hl, #_ghostySpeedY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0xe8
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x83
	jp	NC, 00170$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:43: ghostySpeedY += gravityGhost;
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_gravityGhost
	add	a, (hl)
	ld	(#_ghostySpeedY),a
	ld	a, b
	ld	hl, #_gravityGhost + 1
	adc	a, (hl)
	ld	(#_ghostySpeedY + 1),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:45: if(gravityGhost < MAX_GRAVITY){            
	ld	hl, #_gravityGhost
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0xf4
	ld	a, b
	sbc	a, #0x01
	jr	NC, 00102$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:46: gravityGhost++;
	dec	hl
	inc	(hl)
	jr	NZ, 00382$
	inc	hl
	inc	(hl)
00382$:
00102$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:50: joypadCurrent = joypad();
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:41: if(ghostySpeedY < MAX_SPD_DOWN){
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
	jr	Z, 00120$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:63: gravityGhost = 0;
	xor	a, a
	ld	hl, #_gravityGhost
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:70: if(ghostySpeedY > MAX_SPD_UP){            
	ld	e, b
	ld	d, #0xfc
	ld	a, #0x18
	cp	a, c
	ld	a, #0xfc
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
	jp	NC, 00121$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:71: ghostySpeedY -= SPD_CHANGE;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_ghostySpeedY),a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_ghostySpeedY + 1),a
	jp	00121$
00120$:
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
	jr	Z, 00117$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:75: if(ghostySpeedY < MAX_SPD_DOWN){
	ld	a, c
	sub	a, #0xe8
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x83
	jr	NC, 00121$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:76: ghostySpeedY += SPD_CHANGE;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedY),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_ghostySpeedY + 1),a
	jr	00121$
00117$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:79: if(ghostySpeedY > 0){
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00387$
	bit	7, d
	jr	NZ, 00388$
	cp	a, a
	jr	00388$
00387$:
	bit	7, d
	jr	Z, 00388$
	scf
00388$:
	jr	NC, 00114$
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
	jr	Z, 00121$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:84: ghostySpeedY = 0;
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00121$
00114$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:86: } else if(ghostySpeedY < 0){
	bit	7, b
	jr	Z, 00121$
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
	jr	Z, 00389$
	bit	7, d
	jr	NZ, 00390$
	cp	a, a
	jr	00390$
00389$:
	bit	7, d
	jr	Z, 00390$
	scf
00390$:
	jr	NC, 00121$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:91: ghostySpeedY = 0;
	xor	a, a
	ld	hl, #_ghostySpeedY
	ld	(hl+), a
	ld	(hl), a
00121$:
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
	jr	Z, 00144$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:98: if(ghostySpeedX > MAX_SPD_LEFT){
	ld	e, b
	ld	d, #0xfc
	ld	a, #0x18
	cp	a, c
	ld	a, #0xfc
	sbc	a, b
	bit	7, e
	jr	Z, 00392$
	bit	7, d
	jr	NZ, 00393$
	cp	a, a
	jr	00393$
00392$:
	bit	7, d
	jr	Z, 00393$
	scf
00393$:
	jr	NC, 00124$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:99: ghostySpeedX -= SPD_CHANGE;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_ghostySpeedX + 1),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:102: while(pcFacing!=0){
00124$:
	ld	hl, #_pcFacing
	ld	a, (hl)
	or	a, a
	jp	Z, 00145$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:103: pcFacing = 0;
	ld	(hl), #0x00
	jr	00124$
00144$:
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
	jr	Z, 00141$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:108: if(ghostySpeedX < MAX_SPD_RIGHT){
	ld	a, c
	sub	a, #0xe8
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x83
	jr	NC, 00128$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:110: ghostySpeedX += SPD_CHANGE;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_ghostySpeedX + 1),a
00128$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:113: if(pcFacing==0){
	ld	hl, #_pcFacing
	ld	a, (hl)
	or	a, a
	jr	NZ, 00145$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:114: pcFacing = 1;
	ld	(hl), #0x01
	jr	00145$
00141$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:117: if(ghostySpeedX > 0){
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00395$
	bit	7, d
	jr	NZ, 00396$
	cp	a, a
	jr	00396$
00395$:
	bit	7, d
	jr	Z, 00396$
	scf
00396$:
	jr	NC, 00138$
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
	jr	Z, 00145$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:122: ghostySpeedX = 0;
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00145$
00138$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:124: } else if(ghostySpeedX < 0){
	bit	7, b
	jr	Z, 00145$
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
	jr	Z, 00397$
	bit	7, d
	jr	NZ, 00398$
	cp	a, a
	jr	00398$
00397$:
	bit	7, d
	jr	Z, 00398$
	scf
00398$:
	jr	NC, 00145$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:129: ghostySpeedX = 0;
	xor	a, a
	ld	hl, #_ghostySpeedX
	ld	(hl+), a
	ld	(hl), a
00145$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:140: subPixCalc(pghostyX,pghostyY,ghostySpeedX,ghostySpeedY);
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:142: if(ghostyY <= CEILING){
	ld	hl, #_ghostyY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:148: ghostySpeedY = ghostySpeedY >> 1;
	ld	a, (#_ghostySpeedY)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (#_ghostySpeedY + 1)
	ldhl	sp,	#4
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:142: if(ghostyY <= CEILING){
	ld	e, b
	ld	d, #0x00
	ld	a, #0x17
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00399$
	bit	7, d
	jr	NZ, 00400$
	cp	a, a
	jr	00400$
00399$:
	bit	7, d
	jr	Z, 00400$
	scf
00400$:
	jr	C, 00151$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:144: if(ghostySpeedY < 0){
	ld	hl, #_ghostySpeedY
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00152$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:147: ghostyY = CEILING;
	ld	hl, #_ghostyY
	ld	a, #0x17
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:148: ghostySpeedY = ghostySpeedY >> 1;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedY),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	hl, #_ghostySpeedY + 1
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:149: ghostySpeedY = -ghostySpeedY;
	ld	(hl-), a
	xor	a, a
	sub	a, (hl)
	ld	(hl+), a
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
	jr	00152$
00151$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:151: } else if (ghostyY >= FLOOR){
	ld	a, c
	sub	a, #0x84
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00152$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:154: ghostyY = FLOOR;
	ld	hl, #_ghostyY
	ld	a, #0x84
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:156: ghostySpeedY = ghostySpeedY >> 1;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedY),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	hl, #_ghostySpeedY + 1
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:157: ghostySpeedY = -ghostySpeedY;
	ld	(hl-), a
	xor	a, a
	sub	a, (hl)
	ld	(hl+), a
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
00152$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:160: if(ghostyX <= SCREEN_LEFT_BOUND){
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
	jr	Z, 00401$
	bit	7, d
	jr	NZ, 00402$
	cp	a, a
	jr	00402$
00401$:
	bit	7, d
	jr	Z, 00402$
	scf
00402$:
	jr	C, 00156$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:162: if(ghostySpeedX < 0){            
	ld	hl, #_ghostySpeedX
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00156$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:164: ghostyX = SCREEN_LEFT_BOUND;
	ld	hl, #_ghostyX
	ld	a, #0x0f
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:165: ghostySpeedX = ghostySpeedX >> 1;
	ld	hl, #_ghostySpeedX + 1
	sra	(hl)
	dec	hl
	rr	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:166: ghostySpeedX = -ghostySpeedX;
	xor	a, a
	sub	a, (hl)
	ld	(hl+), a
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
00156$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:170: if(ghostyX >= SCREEN_RIGHT_BOUND){
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
	jr	C, 00160$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:172: if(ghostySpeedX > 0){            
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
	jr	Z, 00403$
	bit	7, d
	jr	NZ, 00404$
	cp	a, a
	jr	00404$
00403$:
	bit	7, d
	jr	Z, 00404$
	scf
00404$:
	jr	NC, 00160$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:177: ghostyX = SCREEN_RIGHT_BOUND;
	ld	hl, #_ghostyX
	ld	a, #0xa0
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:178: ghostySpeedX = ghostySpeedX >> 1;
	ld	hl, #_ghostySpeedX + 1
	sra	(hl)
	dec	hl
	rr	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:179: ghostySpeedX = -ghostySpeedX;
	xor	a, a
	sub	a, (hl)
	ld	(hl+), a
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
00160$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:184: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
	ld	hl, #_ghostyY
	ld	c, (hl)
	ld	hl, #_ghostyX
	ld	e, (hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:183: if(pcFacing==0){
	ld	a, (#_pcFacing)
	or	a, a
	jr	NZ, 00164$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:184: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
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
	ld	b, c
	ld	a, e
	add	a, #0xf8
	ld	e, a
	ld	d, b
	xor	a, a
	call	___move_metasprite_flipx
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:184: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
	jr	00170$
00164$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:185: } else if(pcFacing==1){
	ld	a, (#_pcFacing)
	dec	a
	jr	NZ, 00170$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:186: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:186: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
00170$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:190: }
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
