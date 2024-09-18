;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module projectiles
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rand
	.globl _boneCounter
	.globl _pSpd
	.globl _pY
	.globl _pX
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
_pX::
	.ds 1
_pY::
	.ds 1
_pSpd::
	.ds 1
_boneCounter::
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:66: void initBoneTable(void){
;	---------------------------------
; Function initBoneTable
; ---------------------------------
_initBoneTable::
	dec	sp
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:69: for(uint8_t b = 0; b < MAX_BONE; b++){
	ldhl	sp,	#0
	ld	(hl), #0x00
00114$:
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x06
	jr	NC, 00116$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:71: uint8_t r = ((uint8_t)rand()) % (uint8_t)4;
	call	_rand
	ld	a, e
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:72: if(r==0){
	and	a,#0x03
	jr	NZ, 00110$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:73: pX = 0;
	ld	hl, #_pX
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:74: pY = 0;
	ld	hl, #_pY
	ld	(hl), #0x00
	jr	00111$
00110$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:75: } else if(r==1){
	cp	a, #0x01
	jr	NZ, 00107$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:76: pX = 160;
	ld	hl, #_pX
	ld	(hl), #0xa0
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:77: pY = 0;
	ld	hl, #_pY
	ld	(hl), #0x00
	jr	00111$
00107$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:78: } else if(r==2){
	cp	a, #0x02
	jr	NZ, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:79: pX = 160;
	ld	hl, #_pX
	ld	(hl), #0xa0
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:80: pY = 144;
	ld	hl, #_pY
	ld	(hl), #0x90
	jr	00111$
00104$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:81: } else if(r==3){
	sub	a, #0x03
	jr	NZ, 00111$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:82: pX = 0;
	ld	hl, #_pX
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:83: pY = 144;
	ld	hl, #_pY
	ld	(hl), #0x90
00111$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:86: bones[b].metasprite = boneMS;
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
	ld	hl, #0x0004
	add	hl, bc
	ld	a, #<(_boneMS)
	ld	(hl+), a
	ld	(hl), #>(_boneMS)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:87: bones[b].active = 1;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x01
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:88: bones[b].x = pX;
	ld	a, (#_pX)
	ld	(bc), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:89: bones[b].y = pY;
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (#_pY)
	ld	(de), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:90: bones[b].speed = pSpd;
	inc	bc
	inc	bc
	ld	a, (#_pSpd)
	ld	(bc), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:69: for(uint8_t b = 0; b < MAX_BONE; b++){
	ldhl	sp,	#0
	inc	(hl)
	jp	00114$
00116$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:93: }
	inc	sp
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:98: void throwBone(void){
;	---------------------------------
; Function throwBone
; ---------------------------------
_throwBone::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:115: if(bones[boneCounter].x < ghostyX){
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:121: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__pX:
	.db #0x00	; 0
__xinit__pY:
	.db #0x00	; 0
__xinit__pSpd:
	.db #0x00	; 0
__xinit__boneCounter:
	.db #0x00	; 0
	.area _CABS (ABS)
