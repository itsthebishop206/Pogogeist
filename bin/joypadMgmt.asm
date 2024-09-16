;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module joypadMgmt
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _joypad
	.globl _joypadMgr
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:8: int8_t joypadMgr(void){
;	---------------------------------
; Function joypadMgr
; ---------------------------------
_joypadMgr::
	dec	sp
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:10: joypadCurrent = joypad();
	call	_joypad
	ld	(#_joypadCurrent),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:11: int8_t isMoving = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:34: if(joypadCurrent & J_LEFT){
	ld	a, (#_joypadCurrent)
	bit	1, a
	jr	Z, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:36: isMoving = -1;
	ldhl	sp,	#0
	ld	(hl), #0xff
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:38: if(pcFacing==1){
	ld	a, (#_pcFacing)
	dec	a
	jr	NZ, 00102$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:39: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
	ld	hl, #_ghostyY
	ld	c, (hl)
	ld	hl, #_ghostyX
	ld	e, (hl)
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:40: pcFacing = 0;
	ld	hl, #_pcFacing
	ld	(hl), #0x00
00102$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:43: ghostyX = ghostyX - 2;
	ld	hl, #_ghostyX
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	dec	bc
	dec	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:44: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
	ld	hl, #_ghostyY
	ld	c, (hl)
	ld	hl, #_ghostyX
	ld	e, (hl)
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:44: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
00104$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:48: if(joypadCurrent & J_RIGHT){
	ld	a, (#_joypadCurrent)
	rrca
	jr	NC, 00108$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:50: isMoving = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:52: if(pcFacing==0){
	ld	a, (#_pcFacing)
	or	a, a
	jr	NZ, 00106$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:53: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
	ld	hl, #_ghostyY
	ld	c, (hl)
	ld	hl, #_ghostyX
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:54: pcFacing = 1;
	ld	hl, #_pcFacing
	ld	(hl), #0x01
00106$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:57: ghostyX = ghostyX + 2;
	ld	hl, #_ghostyX
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:58: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
	ld	hl, #_ghostyY
	ld	c, (hl)
	ld	hl, #_ghostyX
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:58: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
00108$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:61: return isMoving;
	ldhl	sp,	#0
	ld	a, (hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:63: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
