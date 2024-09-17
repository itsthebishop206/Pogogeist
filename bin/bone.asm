;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module bone
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_sprite_data
	.globl _boneTile
	.globl _boneY
	.globl _boneX
	.globl _frameSpawnCount
	.globl _frameMoveCount
	.globl _boneMS
	.globl _setBone
	.globl _throwBone
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_frameMoveCount::
	.ds 1
_frameSpawnCount::
	.ds 1
_boneX::
	.ds 1
_boneY::
	.ds 1
_boneTile::
	.ds 32
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:32: void setBone(void){
;	---------------------------------
; Function setBone
; ---------------------------------
_setBone::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:34: set_sprite_data(4,2,boneTile);
	ld	de, #_boneTile
	push	de
	ld	hl, #0x204
	push	hl
	call	_set_sprite_data
	add	sp, #4
;c:\users\wsajj\gbdev\gbdk\include\gb\gb.h:1934: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 19)
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:36: move_metasprite_ex(boneMS,4,0,4,120,120);
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_boneMS)
	ld	(hl+), a
	ld	(hl), #>(_boneMS)
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x04
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:162: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	de, #0x7878
	ld	a, #0x04
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:36: move_metasprite_ex(boneMS,4,0,4,120,120);
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:37: }
	jp	___move_metasprite
_boneMS:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:39: void throwBone(void){
;	---------------------------------
; Function throwBone
; ---------------------------------
_throwBone::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:41: frameMoveCount++;
	ld	hl, #_frameMoveCount
	inc	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:42: frameSpawnCount++;
	ld	hl, #_frameSpawnCount
	inc	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:44: if(frameSpawnCount > FRAME_PER_SPAWN){
	ld	a, #0x05
	sub	a, (hl)
	jr	NC, 00102$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:46: frameSpawnCount = 0;
	ld	(hl), #0x00
00102$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:49: if(frameMoveCount > FRAME_PER_MOVE){
	ld	a, #0x03
	ld	hl, #_frameMoveCount
	sub	a, (hl)
	jr	NC, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:51: boneX--;
	ld	hl, #_boneX
	dec	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:52: frameMoveCount = 0;
	ld	hl, #_frameMoveCount
	ld	(hl), #0x00
00104$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:56: move_metasprite_ex(boneMS,4,0,4,boneX,boneY);
	ld	hl, #_boneY
	ld	c, (hl)
	ld	hl, #_boneX
	ld	e, (hl)
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:160: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, #<(_boneMS)
	ld	(hl+), a
	ld	(hl), #>(_boneMS)
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:161: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x04
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:162: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;c:\users\wsajj\gbdev\gbdk\include\gb\metasprites.h:163: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	b, c
	xor	a, a
	ld	d, b
	ld	a, #0x04
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:56: move_metasprite_ex(boneMS,4,0,4,boneX,boneY);
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Graphics\bone.c:58: }
	jp	___move_metasprite
	.area _CODE
	.area _INITIALIZER
__xinit__frameMoveCount:
	.db #0x00	; 0
__xinit__frameSpawnCount:
	.db #0x00	; 0
__xinit__boneX:
	.db #0x96	; 150
__xinit__boneY:
	.db #0x78	; 120	'x'
__xinit__boneTile:
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.area _CABS (ABS)
