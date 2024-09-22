;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module subPixCalc
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _createDeltasArray
	.globl _newton
	.globl _puts
	.globl _malloc
	.globl _exit
	.globl _subPixCalc
	.globl _projSPC
	.globl _projSPCAlpha
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:95: int16_t* createDeltasArray(int size)
;	---------------------------------
; Function createDeltasArray
; ---------------------------------
_createDeltasArray::
	add	sp, #-2
	push	de
	sla	e
	rl	d
	call	_malloc
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:101: if (deltas == NULL) {
	ld	a, b
	or	a, c
	jr	NZ, 00111$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:102: printf("Memory allocation failed!\n");
	push	bc
	ld	de, #___str_1
	call	_puts
	ld	de, #0x0001
	push	de
	call	_exit
	pop	hl
	pop	bc
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:107: for (int i = 0; i < size; i++) {
00111$:
	xor	a, a
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), a
00105$:
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00132$
	bit	7, d
	jr	NZ, 00133$
	cp	a, a
	jr	00133$
00132$:
	bit	7, d
	jr	Z, 00133$
	scf
00133$:
	jr	NC, 00103$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:108: deltas[i] = i * 2;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sla	e
	rl	d
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:107: for (int i = 0; i < size; i++) {
	ldhl	sp,	#2
	inc	(hl)
	jr	NZ, 00105$
	inc	hl
	inc	(hl)
	jr	00105$
00103$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:112: return deltas;
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:113: }
	add	sp, #4
	ret
___str_1:
	.ascii "Memory allocation failed!"
	.db 0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:117: void projSPC(uint16_t* x1, uint16_t x2, uint16_t* y1, uint16_t y2, int16_t* delX, int16_t* delY){
;	---------------------------------
; Function projSPC
; ---------------------------------
_projSPC::
	add	sp, #-12
	ldhl	sp,	#10
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:120: int16_t slp = 0;
	xor	a, a
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:121: *delX = 1;
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	hl
	push	hl
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:122: *delY = 1;
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:125: if(*x1 != x2){
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00113$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00102$
00113$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:128: slp =  (*y1 - (y2)) / (*x1 - (x2)) << PIXEL_SHIFT;
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#16
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__divuint
	ldhl	sp,	#7
	ld	a, c
	ld	(hl-), a
	ld	(hl), #0x00
	jr	00103$
00102$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:131: *x1 += 1;
	inc	bc
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00103$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:136: *delX = (pPPF / newton(1+slp*slp));
	ld	c, #0x00
	ldhl	sp,	#7
	ld	b, (hl)
	ld	e, #0x00
	ld	d, (hl)
	call	__mulint
	inc	bc
	ld	e, c
	ld	d, b
	call	_newton
	ld	de, #0x0001
	call	__divuint
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:137: *delY = slp*(*delX);
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	e, #0x00
	ldhl	sp,	#7
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	inc	hl
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:143: }
	add	sp, #12
	pop	hl
	add	sp, #8
	jp	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:145: int16_t* projSPCAlpha(uint16_t* x1, uint16_t x2, uint16_t* y1, uint16_t y2){
;	---------------------------------
; Function projSPCAlpha
; ---------------------------------
_projSPCAlpha::
	add	sp, #-12
	ldhl	sp,	#10
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:148: int16_t slp = 0;
	xor	a, a
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:151: if(*x1 != x2){
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00113$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00102$
00113$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:154: slp =  (*y1 - (y2)) / (*x1 - (x2)) << PIXEL_SHIFT;
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#16
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__divuint
	ldhl	sp,	#7
	ld	a, c
	ld	(hl-), a
	ld	(hl), #0x00
	jr	00103$
00102$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:157: *x1 += 1;
	inc	bc
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00103$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:162: int16_t deltaX = (pPPF / newton(1+slp*slp));
	ld	c, #0x00
	ldhl	sp,	#7
	ld	b, (hl)
	ld	e, #0x00
	ld	d, (hl)
	call	__mulint
	inc	bc
	ld	e, c
	ld	d, b
	call	_newton
	ld	de, #0x0001
	call	__divuint
	ld	e, c
	ld	d, b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:163: int16_t deltaY = slp*(deltaX);
	push	de
	ld	c, e
	ld	b, d
	ld	e, #0x00
	ldhl	sp,	#9
	ld	d, (hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:164: int16_t deltas[2] = {deltaX,deltaY};
	call	__mulint
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	pop	de
	ldhl	sp,	#0
	ld	c,l
	ld	b,h
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:165: return deltas;
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\subPixCalc.c:171: }
	add	sp, #12
	pop	hl
	add	sp, #4
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
