;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module playArea
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isActive
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\playArea.c:5: uint8_t isActive(int16_t x, int16_t y){
;	---------------------------------
; Function isActive
; ---------------------------------
_isActive::
	push	bc
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\playArea.c:9: if((x > SCREEN_LEFT_BOUND) && (x < SCREEN_RIGHT_BOUND) && (y > CEILING) && (y < FLOOR)){
	ld	c, e
	ld	b, d
	ld	e, b
	ld	d, #0x00
	ld	a, #0x0f
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00137$
	bit	7, d
	jr	NZ, 00138$
	cp	a, a
	jr	00138$
00137$:
	bit	7, d
	jr	Z, 00138$
	scf
00138$:
	jr	NC, 00102$
	ld	a, c
	sub	a, #0xa0
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00102$
	pop	bc
	push	bc
	ld	e, b
	ld	d, #0x00
	ld	a, #0x17
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00139$
	bit	7, d
	jr	NZ, 00140$
	cp	a, a
	jr	00140$
00139$:
	bit	7, d
	jr	Z, 00140$
	scf
00140$:
	jr	NC, 00102$
	ld	a, c
	sub	a, #0x84
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00102$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\playArea.c:11: active = 1;
	ld	a, #0x01
	jr	00103$
00102$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\playArea.c:15: active = 0;
	xor	a, a
00103$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\playArea.c:19: return active;
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\playArea.c:20: }
	inc	sp
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
