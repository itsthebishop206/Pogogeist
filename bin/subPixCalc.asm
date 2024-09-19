;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module subPixCalc
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _subPixCalc
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_subPixCalc_fractionX_10000_153:
	.ds 2
_subPixCalc_fractionY_10000_153:
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:25: static int16_t fractionX, fractionY = 0;
	xor	a, a
	ld	hl, #_subPixCalc_fractionY_10000_153
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:23: void subPixCalc(int16_t *valueX, int16_t *valueY, int16_t speedX, int16_t speedY){
;	---------------------------------
; Function subPixCalc
; ---------------------------------
_subPixCalc::
	add	sp, #-4
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	inc	sp
	inc	sp
	push	bc
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:26: fractionX += speedX; // adds speed (which we have as 8 or -8) to the fractional value each frame. we are gaining "8" speed a frame, which becomes 0.03 pixels per frame
	ld	hl, #_subPixCalc_fractionX_10000_153
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_subPixCalc_fractionX_10000_153
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:27: fractionY += speedY;
	ld	hl, #_subPixCalc_fractionY_10000_153
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_subPixCalc_fractionY_10000_153
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:29: while(fractionX >= (1<<PIXEL_SHIFT)){ // shifting the bits left by 8 multiplies by 2^8 (256), so as long as fractionX is greater than or equal to 256, move object by one pixel
00101$:
	ld	hl, #_subPixCalc_fractionX_10000_153
	ld	a, (hl+)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:30: *valueX += 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	inc	bc
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:31: fractionX -= (1<<PIXEL_SHIFT); // subtracts 256, which resets the fractional part to 0
	ld	hl, #_subPixCalc_fractionX_10000_153
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	ld	c,a
	ld	a,b
	dec	a
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00101$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:34: while(fractionX <= -(1<<PIXEL_SHIFT)){
00104$:
	ld	hl, #_subPixCalc_fractionX_10000_153
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	ld	d, #0xff
	xor	a, a
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	bit	7, e
	jr	Z, 00171$
	bit	7, d
	jr	NZ, 00172$
	cp	a, a
	jr	00172$
00171$:
	bit	7, d
	jr	Z, 00172$
	scf
00172$:
	jr	C, 00107$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:35: *valueX -=1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	dec	bc
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:36: fractionX += (1<<PIXEL_SHIFT);
	ld	hl, #_subPixCalc_fractionX_10000_153
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	inc	a
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:39: while(fractionY >= (1<<PIXEL_SHIFT)){
00107$:
	ld	hl, #_subPixCalc_fractionY_10000_153
	ld	a, (hl+)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00110$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:40: *valueY += 1;
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	inc	bc
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:41: fractionY -= (1<<PIXEL_SHIFT);
	ld	hl, #_subPixCalc_fractionY_10000_153
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	ld	c,a
	ld	a,b
	dec	a
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00107$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:44: while(fractionY <= -(1<<PIXEL_SHIFT)){
00110$:
	ld	hl, #_subPixCalc_fractionY_10000_153
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	ld	d, #0xff
	xor	a, a
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	bit	7, e
	jr	Z, 00173$
	bit	7, d
	jr	NZ, 00174$
	cp	a, a
	jr	00174$
00173$:
	bit	7, d
	jr	Z, 00174$
	scf
00174$:
	jr	C, 00113$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:45: *valueY -=1;
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	dec	bc
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:46: fractionY += (1<<PIXEL_SHIFT);
	ld	hl, #_subPixCalc_fractionY_10000_153
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	inc	a
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00110$
00113$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:48: }
	add	sp, #4
	pop	hl
	add	sp, #4
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
