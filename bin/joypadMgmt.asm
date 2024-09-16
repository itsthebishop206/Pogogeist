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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:10: void joypadMgr(void){
;	---------------------------------
; Function joypadMgr
; ---------------------------------
_joypadMgr::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:13: joypadCurrent = joypad();
	call	_joypad
	ld	c, a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:14: ghostySpeedX = 0;
	xor	a, a
	ld	hl, #_ghostySpeedX
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:32: if(joypadCurrent & J_LEFT){
	bit	1, c
	jr	Z, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:34: ghostySpeedX = -1 << PIXEL_SHIFT;
	ld	hl, #_ghostySpeedX
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0xff
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:35: if(pcFacing==1){
	ld	a, (#_pcFacing)
	dec	a
	jr	NZ, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:36: pcFacing = 0;
	ld	hl, #_pcFacing
	ld	(hl), #0x00
00104$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:40: if(joypadCurrent & J_RIGHT){
	bit	0, c
	jr	Z, 00108$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:42: ghostySpeedX = 1 << PIXEL_SHIFT;
	ld	hl, #_ghostySpeedX
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x01
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:43: if(pcFacing==0){
	ld	hl, #_pcFacing
	ld	a, (hl)
	or	a, a
	jr	NZ, 00108$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:44: pcFacing = 1;
	ld	(hl), #0x01
00108$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:48: fractionX += ghostySpeedX;
	ld	a, (#_fractionX)
	ld	hl, #_ghostySpeedX
	add	a, (hl)
	ld	hl, #_fractionX
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_ghostySpeedX + 1
	adc	a, (hl)
	ld	(#_fractionX + 1),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:50: while(fractionX >= (1<<PIXEL_SHIFT)){
00109$:
	ld	hl, #_fractionX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00112$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:51: ghostyX += 1;
	ld	hl, #_ghostyX
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:52: fractionX -= (1<<PIXEL_SHIFT);
	ld	a,b
	dec	a
	ld	hl, #_fractionX
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00109$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:55: while(fractionX <= -(1<<PIXEL_SHIFT)){
00112$:
	ld	hl, #_fractionX
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	ld	e, c
	ld	d, #0xff
	xor	a, a
	cp	a, b
	ld	a, #0xff
	sbc	a, c
	bit	7, e
	jr	Z, 00197$
	bit	7, d
	jr	NZ, 00198$
	cp	a, a
	jr	00198$
00197$:
	bit	7, d
	jr	Z, 00198$
	scf
00198$:
	jr	C, 00114$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:56: ghostyX -=1;
	ld	hl, #_ghostyX
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:57: fractionX += (1<<PIXEL_SHIFT);
	ld	a, c
	inc	a
	ld	hl, #_fractionX
	ld	(hl), b
	inc	hl
	ld	(hl), a
	jr	00112$
00114$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:61: if(pcFacing==1){
	ld	a, (#_pcFacing)
	dec	a
	jr	NZ, 00116$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:62: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:62: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
00116$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:65: if(pcFacing==0){
	ld	a, (#_pcFacing)
	or	a, a
	ret	NZ
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:66: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
	ld	hl, #_ghostyY
	ld	c, (hl)
	ld	hl, #_ghostyX
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:66: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:68: }
	jp	___move_metasprite_flipx
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
