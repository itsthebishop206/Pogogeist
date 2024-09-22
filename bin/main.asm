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
	.globl _updateBone
	.globl _scrollBkg
	.globl _joypadMgr
	.globl _gameFirstLoad
	.globl _vsync
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_activeBones:
	.ds 1
_boneCounter:
	.ds 1
_frameCounter:
	.ds 1
_ghostyX:
	.ds 2
_ghostyY:
	.ds 2
_ghostySpeedX:
	.ds 2
_ghostySpeedY:
	.ds 2
_pghostyX:
	.ds 2
_pghostyY:
	.ds 2
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:14: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:16: gameFirstLoad();
	call	_gameFirstLoad
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:18: while(1) {        
00102$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:21: joypadMgr();
	call	_joypadMgr
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:22: scrollBkg();
	call	_scrollBkg
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:23: updateBone();
	call	_updateBone
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:26: vsync();
	call	_vsync
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\main.c:28: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
