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
	.globl _pSpd
	.globl _pSpawn
	.globl _pYValue
	.globl _pXValue
	.globl _bones
	.globl _initBoneTable
	.globl _choose4
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
_pXValue::
	.ds 1
_pYValue::
	.ds 1
_pSpawn::
	.ds 1
_pSpd::
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:52: void initBoneTable(void){
;	---------------------------------
; Function initBoneTable
; ---------------------------------
_initBoneTable::
	ld	c, #0x00
00103$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:56: for(uint8_t b; b < MAX_BONE; b++){
	ld	a, c
	sub	a, #0x06
	ret	NC
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:58: bones[b].metasprite = boneMS;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	a, l
	add	a, #<(_bones)
	ld	e, a
	ld	a, h
	adc	a, #>(_bones)
	ld	d, a
	ld	hl, #0x0004
	add	hl, de
	ld	a, #<(_boneMS)
	ld	(hl+), a
	ld	(hl), #>(_boneMS)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:59: bones[b].active = 1;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x01
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:60: bones[b].x = pXValue;
	ld	a, (#_pXValue)
	ld	(de), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:61: bones[b].x = pYValue;
	ld	a, (#_pYValue)
	ld	(de), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:62: bones[b].speed = pSpd;
	inc	de
	inc	de
	ld	a, (#_pSpd)
	ld	(de), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:56: for(uint8_t b; b < MAX_BONE; b++){
	inc	c
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:65: }
	jr	00103$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:69: uint8_t choose4(void){
;	---------------------------------
; Function choose4
; ---------------------------------
_choose4::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:70: uint8_t r = ((uint8_t)rand()) % (uint8_t)4;
	call	_rand
	ld	a, e
	and	a, #0x03
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:71: return r;
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:72: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__pXValue:
	.db #0x00	; 0
__xinit__pYValue:
	.db #0x00	; 0
__xinit__pSpawn:
	.db #0x00	; 0
__xinit__pSpd:
	.db #0x00	; 0
	.area _CABS (ABS)
