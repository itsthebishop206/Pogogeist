;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _throwBone
	.globl _setBone
	.globl _joypadMgr
	.globl _bkgScroll
	.globl _setGhosty
	.globl _setBkgd
	.globl _set_sprite_palette
	.globl _wait_vbl_done
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:12: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:15: set_sprite_palette(0,1,ghosty_palettes);
	ld	de, #_ghosty_palettes
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_palette
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:16: setBkgd();
	call	_setBkgd
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:17: setGhosty();
	call	_setGhosty
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:18: setBone();
	call	_setBone
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:20: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:21: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:22: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:25: while(1) {        
00102$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:27: joypadMgr();
	call	_joypadMgr
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:28: bkgScroll();
	call	_bkgScroll
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:29: throwBone();
	call	_throwBone
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:31: wait_vbl_done();
	call	_wait_vbl_done
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:33: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
