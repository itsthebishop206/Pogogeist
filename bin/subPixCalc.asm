;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module subPixCalc
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _newton
	.globl _subPixCalc
	.globl _projSPC
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_subPixCalc_fractionX_10000_186:
	.ds 2
_subPixCalc_fractionY_10000_186:
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:30: static int16_t fractionX, fractionY = 0;
	xor	a, a
	ld	hl, #_subPixCalc_fractionY_10000_186
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:28: void subPixCalc(int16_t *valueX, int16_t *valueY, int16_t speedX, int16_t speedY){
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:31: fractionX += speedX; // adds speed (which we have as 8 or -8) to the fractional value each frame. we are gaining "8" speed a frame, which becomes 0.03 pixels per frame
	ld	hl, #_subPixCalc_fractionX_10000_186
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
	ld	hl, #_subPixCalc_fractionX_10000_186
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:32: fractionY += speedY;
	ld	hl, #_subPixCalc_fractionY_10000_186
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
	ld	hl, #_subPixCalc_fractionY_10000_186
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:34: while(fractionX >= (1<<PIXEL_SHIFT)){
00101$:
	ld	hl, #_subPixCalc_fractionX_10000_186
	ld	a, (hl+)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:37: *valueX += 1;
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:38: fractionX -= (1<<PIXEL_SHIFT); // subtracts 256, which resets the fractional part to 0
	ld	hl, #_subPixCalc_fractionX_10000_186
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:41: while(fractionX <= -(1<<PIXEL_SHIFT)){
00104$:
	ld	hl, #_subPixCalc_fractionX_10000_186
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:42: *valueX -=1;
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:43: fractionX += (1<<PIXEL_SHIFT);
	ld	hl, #_subPixCalc_fractionX_10000_186
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	inc	a
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:46: while(fractionY >= (1<<PIXEL_SHIFT)){
00107$:
	ld	hl, #_subPixCalc_fractionY_10000_186
	ld	a, (hl+)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00110$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:47: *valueY += 1;
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:48: fractionY -= (1<<PIXEL_SHIFT);
	ld	hl, #_subPixCalc_fractionY_10000_186
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:51: while(fractionY <= -(1<<PIXEL_SHIFT)){
00110$:
	ld	hl, #_subPixCalc_fractionY_10000_186
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:52: *valueY -=1;
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:53: fractionY += (1<<PIXEL_SHIFT);
	ld	hl, #_subPixCalc_fractionY_10000_186
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	inc	a
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00110$
00113$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:55: }
	add	sp, #4
	pop	hl
	add	sp, #4
	jp	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:57: uint16_t newton(uint16_t n){
;	---------------------------------
; Function newton
; ---------------------------------
_newton::
	dec	sp
	dec	sp
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:59: int16_t result = n;
	ld	c, e
	ld	b, d
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:60: int16_t last = 0;
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:62: while(result != last){
00101$:
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00120$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00103$
00120$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:66: last = result;
	inc	sp
	inc	sp
	push	bc
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:67: result = (last+(n/last))/2;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	de
	ld	c, l
	ld	b, h
	call	__divuint
	pop	de
	pop	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	srl	b
	rr	c
	jr	00101$
00103$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:70: return result;
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:93: }
	inc	sp
	inc	sp
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:96: int16_t* projSPC(uint16_t x1, uint16_t x2, uint16_t y1, uint16_t y2){
;	---------------------------------
; Function projSPC
; ---------------------------------
_projSPC::
	add	sp, #-8
	ldhl	sp,	#6
	ld	a, e
	ld	(hl+), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:99: int16_t slp = 0;
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:103: if(x1 != x2){
	ld	a, d
	ld	(hl-), a
	ld	de, #0x0000
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00113$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00103$
00113$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:106: slp =  (y1-y2) / (x1-x2) >> PIXEL_SHIFT;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	c, e
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__divuint
	ld	e, b
	ld	d, #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:109: x1 += 1;
00103$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:114: int16_t deltaX = (pPPF / newton(1+slp*slp));
	push	de
	ld	c, e
	ld	b, d
	call	__mulint
	pop	de
	inc	bc
	push	de
	ld	e, c
	ld	d, b
	call	_newton
	ld	de, #0x0001
	call	__divuint
	pop	de
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:115: int16_t deltaY = slp*deltaX;
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:117: int16_t deltas[2] = {deltaX,deltaY};
	call	__mulint
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl+), a
	ld	(hl), c
	inc	hl
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:118: return deltas;
	ld	hl, #0
	add	hl, sp
	ld	c, l
	ld	b, h
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:124: }
	add	sp, #8
	pop	hl
	add	sp, #4
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
