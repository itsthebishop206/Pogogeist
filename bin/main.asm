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
	.globl _joypadMgr
	.globl _setGhosty
	.globl _setBkgd
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:10: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:12: setBkgd();
	call	_setBkgd
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:13: setGhosty();
	call	_setGhosty
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:15: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:16: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:17: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:20: while(1) {        
00102$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:22: joypadMgr();
	call	_joypadMgr
;c:\users\wsajj\gbdev\gbdk\include\gb\gb.h:1463: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	inc	a
	ldh	(_SCX_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:26: wait_vbl_done();
	call	_wait_vbl_done
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:28: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
