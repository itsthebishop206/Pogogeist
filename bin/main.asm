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
	.globl _scrollBkg
	.globl _throwBone
	.globl _joypadMgr
	.globl _gameFirstLoad
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:11: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:13: gameFirstLoad();
	call	_gameFirstLoad
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:16: while(1) {        
00102$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:18: joypadMgr();
	call	_joypadMgr
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:19: scrollBkg();
	call	_scrollBkg
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:20: throwBone();
	call	_throwBone
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:22: wait_vbl_done();
	call	_wait_vbl_done
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:24: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
