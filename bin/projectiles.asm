;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module projectiles
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _initRandXY
	.globl _rand
	.globl _frameCounter
	.globl _activeBones
	.globl _boneCounter
	.globl _deltas
	.globl _bones
	.globl _initBoneTable
	.globl _throwBone
	.globl _updateBone
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bones::
	.ds 54
_deltas::
	.ds 2
_updateBone_newX_10000_218:
	.ds 2
_updateBone_newY_10000_218:
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_boneCounter::
	.ds 1
_activeBones::
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:127: static int16_t newX = 0;
	xor	a, a
	ld	hl, #_updateBone_newX_10000_218
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:128: static int16_t newY = 0;
	xor	a, a
	ld	hl, #_updateBone_newY_10000_218
	ld	(hl+), a
	ld	(hl), a
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:67: void initRandXY(int16_t* prX, int16_t* prY){
;	---------------------------------
; Function initRandXY
; ---------------------------------
_initRandXY::
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:69: uint8_t r = ((uint8_t)rand()) % (uint8_t)4;
	push	de
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	pop	hl
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:70: if(r==0){
	and	a,#0x03
	jr	NZ, 00110$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:71: *prX = -1;
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:72: *prY = -1;
	ld	a,#0xff
	ld	(hl+),a
	ld	(hl),a
	ld	(bc), a
	inc	bc
	ld	a, #0xff
	ld	(bc), a
	ret
00110$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:73: } else if(r==1){
	cp	a, #0x01
	jr	NZ, 00107$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:74: *prX = 161;
	ld	a, #0xa1
	ld	(hl+), a
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:75: *prY = -1;
	ld	a, #0xff
	ld	(bc), a
	inc	bc
	ld	a, #0xff
	ld	(bc), a
	ret
00107$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:76: } else if(r==2){
	cp	a, #0x02
	jr	NZ, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:77: *prX = 161;
	ld	a, #0xa1
	ld	(hl+), a
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:78: *prY = 145;
	ld	a, #0x91
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
	ret
00104$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:79: } else if(r==3){
	sub	a, #0x03
	ret	NZ
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:80: *prX = 1;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:81: *prY = 145;
	ld	a, #0x91
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:83: }
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:85: void initBoneTable(void){
;	---------------------------------
; Function initBoneTable
; ---------------------------------
_initBoneTable::
	dec	sp
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:90: for(uint8_t b = 0; b < MAX_BONE; b++){
	ldhl	sp,	#0
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x06
	jr	NC, 00105$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:92: bones[b].x = 0;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a, l
	add	a, #<(_bones)
	ld	e, a
	ld	a, h
	adc	a, #>(_bones)
	ld	d, a
	ld	l, e
	ld	h, d
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:93: bones[b].y = 0;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	l, c
	ld	h, b
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:94: bones[b].prActive = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:95: bones[b].metasprite = boneMS;
	ld	hl, #0x0007
	add	hl, de
	ld	a, #<(_boneMS)
	ld	(hl+), a
	ld	(hl), #>(_boneMS)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:96: bones[b].speed = 0;
	ld	hl, #0x0004
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:97: initRandXY(&bones[b].x, &bones[b].y);
	call	_initRandXY
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:90: for(uint8_t b = 0; b < MAX_BONE; b++){
	ldhl	sp,	#0
	inc	(hl)
	jr	00103$
00105$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:99: }
	inc	sp
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:101: void throwBone(void){
;	---------------------------------
; Function throwBone
; ---------------------------------
_throwBone::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:105: uint16_t boneY = 30;
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:121: }
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:123: void updateBone(void){
;	---------------------------------
; Function updateBone
; ---------------------------------
_updateBone::
	dec	sp
	dec	sp
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:129: newX += deltas[0];
	ld	hl, #_deltas
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_deltas + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_updateBone_newX_10000_218
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:130: newY += deltas[1];
	ld	hl, #_deltas
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_updateBone_newY_10000_218
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:131: move_metasprite_ex(bones[boneCounter].metasprite,4,0,4,newX,newY);
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_updateBone_newX_10000_218)
	ldhl	sp,	#1
	ld	(hl), a
	ld	hl, #_boneCounter
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_bones
	add	hl,bc
	ld	bc, #0x0007
	add	hl, bc
	ld	a, (hl+)
	ld	c, (hl)
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl+), a
	ld	(hl), c
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x04
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:162: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	b, a
	ld	e, (hl)
	xor	a, a
	ld	d, b
	ld	a, #0x04
	inc	sp
	inc	sp
	jp	___move_metasprite
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:131: move_metasprite_ex(bones[boneCounter].metasprite,4,0,4,newX,newY);
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:132: }
	inc	sp
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__boneCounter:
	.db #0x00	; 0
__xinit__activeBones:
	.db #0x00	; 0
__xinit__frameCounter:
	.db #0x05	; 5
	.area _CABS (ABS)
