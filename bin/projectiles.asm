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
	.globl _projSPC
	.globl _rand
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
_updateBone_newX_10000_224:
	.ds 2
_updateBone_newY_10000_224:
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_boneCounter:
	.ds 1
_activeBones:
	.ds 1
_frameCounter:
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:125: static int16_t newX = 0;
	xor	a, a
	ld	hl, #_updateBone_newX_10000_224
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:126: static int16_t newY = 0;
	xor	a, a
	ld	hl, #_updateBone_newY_10000_224
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:71: *prX = 20;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:72: *prY = 20;
	ld	a, #0x14
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
	ret
00110$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:73: } else if(r==1){
	cp	a, #0x01
	jr	NZ, 00107$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:74: *prX = 130;
	ld	a, #0x82
	ld	(hl+), a
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:75: *prY = 20;
	ld	a, #0x14
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
	ret
00107$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:76: } else if(r==2){
	cp	a, #0x02
	jr	NZ, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:77: *prX = 130;
	ld	a, #0x82
	ld	(hl+), a
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:78: *prY = 125;
	ld	a, #0x7d
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
	ret
00104$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:79: } else if(r==3){
	sub	a, #0x03
	ret	NZ
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:80: *prX = 20;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:81: *prY = 125;
	ld	a, #0x7d
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
	add	sp, #-9
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:90: uint8_t oambt = 4;
	ldhl	sp,	#0
	ld	(hl), #0x04
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:92: for(uint8_t b = 0; b < MAX_BONE; b++){
	ldhl	sp,	#8
	ld	(hl), #0x00
00104$:
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x06
	jp	NC, 00106$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:94: bones[b].x = 0;
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
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:95: bones[b].y = 0;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:96: bones[b].prActive = 0;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:97: bones[b].metasprite = boneMS;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #<(_boneMS)
	ld	(hl+), a
	ld	(hl), #>(_boneMS)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:98: bones[b].speed = 0;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:99: initRandXY(&bones[b].x, &bones[b].y);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_initRandXY
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:100: move_metasprite_ex(bones[b].metasprite,4,0,oambt,bones[b].x,bones[b].y);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:160: __current_metasprite = metasprite;
	ld	e, l
	ld	d, h
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x04
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:162: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ldhl	sp,	#7
	ld	d, (hl)
	ld	e, c
	ldhl	sp,	#0
	ld	a, (hl)
	call	___move_metasprite
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:101: oambt += 2;
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:92: for(uint8_t b = 0; b < MAX_BONE; b++){
	ldhl	sp,	#8
	inc	(hl)
	jp	00104$
00106$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:103: }
	add	sp, #9
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:105: void throwBone(void){
;	---------------------------------
; Function throwBone
; ---------------------------------
_throwBone::
	add	sp, #-4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:107: if(activeBones < MAX_BONE){
	ld	a, (#_activeBones)
	sub	a, #0x06
	jr	NC, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:111: if(frameCounter < FRAME_PER_SPAWN){
	ld	a, (#_frameCounter)
	sub	a, #0x06
	jr	NC, 00106$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:112: int16_t* deltas = projSPC(bones[boneCounter].x, ghostyX, bones[boneCounter].y, ghostyY);
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
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_ghostyY
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_ghostyX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_projSPC
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:113: activeBones++;
	ld	hl, #_activeBones
	inc	(hl)
	jr	00106$
00104$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:117: activeBones = 0;
	ld	hl, #_activeBones
	ld	(hl), #0x00
00106$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:119: }
	add	sp, #4
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:121: void updateBone(void){
;	---------------------------------
; Function updateBone
; ---------------------------------
_updateBone::
	dec	sp
	dec	sp
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:130: newX += deltas[1];
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
	ld	hl, #_updateBone_newX_10000_224
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:131: newY += deltas[0];
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
	ld	hl, #_updateBone_newY_10000_224
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:132: move_metasprite_ex(bones[boneCounter].metasprite,4,0,4,newX,newY);
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_updateBone_newX_10000_224)
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
	ld	c, a
	ld	b, (hl)
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
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
	ld	d, b
	ld	a, #0x04
	call	___move_metasprite
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:134: if(boneCounter < MAX_BONE){
	ld	hl, #_boneCounter
	ld	a, (hl)
	sub	a, #0x06
	jr	NC, 00102$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:135: boneCounter = 0;
	ld	(hl), #0x00
	jr	00105$
00102$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:137: boneCounter++;
	ld	hl, #_boneCounter
	inc	(hl)
00105$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\projectiles.c:139: }
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
	.db #0x00	; 0
	.area _CABS (ABS)
