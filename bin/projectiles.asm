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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:65: void initBoneTable(void){
;	---------------------------------
; Function initBoneTable
; ---------------------------------
_initBoneTable::
	add	sp, #-3
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:69: for(uint8_t b = 0; b < MAX_BONE; b++){
	ldhl	sp,	#2
	ld	(hl), #0x00
00114$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x06
	jp	NC, 00116$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:71: bones[b].active = 0;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_bones
	add	hl,bc
	inc	sp
	inc	sp
	ld	c, l
	ld	b, h
	push	bc
	inc	bc
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:73: uint8_t r = ((uint8_t)rand()) % (uint8_t)4;
	call	_rand
	ld	a, e
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:74: if(r==0){
	and	a,#0x03
	jr	NZ, 00110$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:75: prX = 0;
	ld	hl, #_prX
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:76: prY = 0;
	ld	hl, #_prY
	ld	(hl), #0x00
	jr	00111$
00110$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:77: } else if(r==1){
	cp	a, #0x01
	jr	NZ, 00107$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:78: prX = 160;
	ld	hl, #_prX
	ld	(hl), #0xa0
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:79: prY = 0;
	ld	hl, #_prY
	ld	(hl), #0x00
	jr	00111$
00107$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:80: } else if(r==2){
	cp	a, #0x02
	jr	NZ, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:81: prX = 160;
	ld	hl, #_prX
	ld	(hl), #0xa0
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:82: prY = 144;
	ld	hl, #_prY
	ld	(hl), #0x90
	jr	00111$
00104$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:83: } else if(r==3){
	sub	a, #0x03
	jr	NZ, 00111$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:84: prX = 0;
	ld	hl, #_prX
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:85: prY = 144;
	ld	hl, #_prY
	ld	(hl), #0x90
00111$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:88: bones[b].metasprite = boneMS;
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	(hl), #<(_boneMS)
	inc	bc
	ld	a, #>(_boneMS)
	ld	(bc), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:89: bones[b].x = prX;
	pop	de
	push	de
	ld	a, (#_prX)
	ld	(de), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:90: bones[b].y = prY;
	pop	bc
	push	bc
	inc	bc
	ld	a, (#_prY)
	ld	(bc), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:91: bones[b].speed = prSpd;
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	a, (#_prSpd)
	ld	(bc), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:69: for(uint8_t b = 0; b < MAX_BONE; b++){
	ldhl	sp,	#2
	inc	(hl)
	jp	00114$
00116$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:94: }
	add	sp, #3
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:96: void throwBone(void){
;	---------------------------------
; Function throwBone
; ---------------------------------
_throwBone::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:112: if(bones[boneCounter].x < ghostyX){
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:118: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__prX:
	.db #0x00	; 0
__xinit__prY:
	.db #0x00	; 0
__xinit__prSpd:
	.db #0x00	; 0
__xinit__boneCounter:
	.db #0x00	; 0
	.area _CABS (ABS)
