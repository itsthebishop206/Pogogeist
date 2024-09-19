;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module projectiles
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _printf
	.globl _rand
	.globl _frameCounter
	.globl _boneCounter
	.globl _prSpd
	.globl _prY
	.globl _prX
	.globl _bones
	.globl _initBoneTable
	.globl _throwBone
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bones::
	.ds 36
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_prX::
	.ds 1
_prY::
	.ds 1
_prSpd::
	.ds 1
_boneCounter::
	.ds 1
_frameCounter::
	.ds 1
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:81: void initBoneTable(void){
;	---------------------------------
; Function initBoneTable
; ---------------------------------
_initBoneTable::
	dec	sp
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:85: for(uint8_t b = 0; b < MAX_BONE; b++){
	ldhl	sp,	#0
	ld	(hl), #0x00
00114$:
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x06
	jr	NC, 00116$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:87: uint8_t r = ((uint8_t)rand()) % (uint8_t)4;
	call	_rand
	ld	a, e
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:88: if(r==0){
	and	a,#0x03
	jr	NZ, 00110$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:89: prX = 1;
	ld	hl, #_prX
	ld	(hl), #0x01
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:90: prY = 1;
	ld	hl, #_prY
	ld	(hl), #0x01
	jr	00111$
00110$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:91: } else if(r==1){
	cp	a, #0x01
	jr	NZ, 00107$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:92: prX = 160;
	ld	hl, #_prX
	ld	(hl), #0xa0
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:93: prY = 1;
	ld	hl, #_prY
	ld	(hl), #0x01
	jr	00111$
00107$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:94: } else if(r==2){
	cp	a, #0x02
	jr	NZ, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:95: prX = 160;
	ld	hl, #_prX
	ld	(hl), #0xa0
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:96: prY = 144;
	ld	hl, #_prY
	ld	(hl), #0x90
	jr	00111$
00104$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:97: } else if(r==3){
	sub	a, #0x03
	jr	NZ, 00111$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:98: prX = 1;
	ld	hl, #_prX
	ld	(hl), #0x01
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:99: prY = 144;
	ld	hl, #_prY
	ld	(hl), #0x90
00111$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:102: bones[b].active = 0;
	ldhl	sp,	#0
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	a, l
	add	a, #<(_bones)
	ld	c, a
	ld	a, h
	adc	a, #>(_bones)
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:103: bones[b].metasprite = boneMS;
	ld	hl, #0x0004
	add	hl, bc
	ld	a, #<(_boneMS)
	ld	(hl+), a
	ld	(hl), #>(_boneMS)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:104: bones[b].x = prX;
	ld	a, (#_prX)
	ld	(bc), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:105: bones[b].y = prY;
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (#_prY)
	ld	(de), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:106: bones[b].speed = prSpd;
	inc	bc
	inc	bc
	ld	a, (#_prSpd)
	ld	(bc), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:85: for(uint8_t b = 0; b < MAX_BONE; b++){
	ldhl	sp,	#0
	inc	(hl)
	jp	00114$
00116$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:108: }
	inc	sp
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:110: void throwBone(void){
;	---------------------------------
; Function throwBone
; ---------------------------------
_throwBone::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:112: if((boneCounter < MAX_BONE)){
	ld	a, (#_boneCounter)
	sub	a, #0x06
	ld	a, #0x00
	rla
	ld	c, a
	or	a, a
	jr	Z, 00107$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:114: frameCounter++;
	ld	hl, #_frameCounter
	inc	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:119: printf("frameCounter: %d\n", frameCounter);
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_0
	push	de
	call	_printf
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:120: printf("boneCounter: %d\n", boneCounter);
	ld	hl, #_boneCounter
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_1
	push	de
	call	_printf
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:121: printf("boneX: %d\n", bones[boneCounter].x);
	ld	hl, #_boneCounter
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_bones
	add	hl,bc
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_2
	push	de
	call	_printf
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:122: printf("boneY: %d\n", bones[boneCounter].y);
	ld	hl, #_boneCounter
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_bones
	add	hl,bc
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_3
	push	de
	call	_printf
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:154: if(frameCounter < FRAME_PER_SPAWN){
	ld	hl, #_frameCounter
	ld	a, (hl)
	sub	a, #0x06
	jr	C, 00103$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:156: frameCounter = 1;
	ld	(hl), #0x01
00103$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:159: boneCounter++;
	ld	hl, #_boneCounter
	inc	(hl)
	ret
00107$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:161: } else if(boneCounter >= MAX_BONE){
	bit	0, c
	ret	NZ
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:162: boneCounter = 0;
	ld	hl, #_boneCounter
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:164: }
	ret
___str_0:
	.ascii "frameCounter: %d"
	.db 0x0a
	.db 0x00
___str_1:
	.ascii "boneCounter: %d"
	.db 0x0a
	.db 0x00
___str_2:
	.ascii "boneX: %d"
	.db 0x0a
	.db 0x00
___str_3:
	.ascii "boneY: %d"
	.db 0x0a
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__prX:
	.db #0x01	; 1
__xinit__prY:
	.db #0x01	; 1
__xinit__prSpd:
	.db #0x00	; 0
__xinit__boneCounter:
	.db #0x00	; 0
__xinit__frameCounter:
	.db #0x05	; 5
	.area _CABS (ABS)
