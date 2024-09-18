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
	.globl _gravity
	.globl _ghostyY
	.globl _ghostyX
	.globl _pcFacing
	.globl _ghostySpeedY
	.globl _fractionY
	.globl _fractionX
	.globl _ghostySpeedX
	.globl _joypadMgr
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_ghostySpeedX::
	.ds 2
_fractionX::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_fractionY::
	.ds 2
_ghostySpeedY::
	.ds 2
_pcFacing::
	.ds 1
_ghostyX::
	.ds 2
_ghostyY::
	.ds 2
_gravity::
	.ds 2
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:30: void joypadMgr(void){
;	---------------------------------
; Function joypadMgr
; ---------------------------------
_joypadMgr::
	add	sp, #-6
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:33: joypadCurrent = joypad();
	call	_joypad
	ldhl	sp,	#1
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:35: if(ghostyY < FLOOR){
	ld	hl, #_ghostyY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x84
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:39: ghostySpeedY += (gravity += counter);
	ld	hl, #_gravity
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ld	hl, #_gravity
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ld	hl, #_ghostySpeedY
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_ghostySpeedY
	ld	a, e
	ld	(hl+), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:41: if(ghostySpeedY > MAX_SPD_DOWN){
	ld	a, d
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_ghostySpeedY + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, h
	ld	d, #0x07
	ld	a, #0xf8
	cp	a, l
	ld	a, #0x07
	sbc	a, h
	bit	7, e
	jr	Z, 00356$
	bit	7, d
	jr	NZ, 00357$
	cp	a, a
	jr	00357$
00356$:
	bit	7, d
	jr	Z, 00357$
	scf
00357$:
	jr	NC, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:42: ghostySpeedY = MAX_SPD_DOWN;
	ld	hl, #_ghostySpeedY
	ld	a, #0xf8
	ld	(hl+), a
	ld	(hl), #0x07
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:43: counter = 0;
00104$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:52: if(joypadCurrent & J_B){
	push	hl
	ldhl	sp,	#3
	bit	5, (hl)
	pop	hl
	jr	Z, 00106$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:53: ghostyY -= 4;
	ld	a, c
	add	a, #0xfc
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	hl, #_ghostyY
	ld	(hl), c
	inc	hl
	ld	(hl), a
00106$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:67: if(ghostySpeedX > MAX_SPD_LEFT){
	ld	a, (#_ghostySpeedX)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_ghostySpeedX + 1)
	ldhl	sp,	#3
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:68: ghostySpeedX -= SPD_CHANGE_X;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	c, e
	ldhl	sp,	#4
	ld	(hl), c
	inc	hl
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:65: if(joypadCurrent & J_LEFT){
	push	hl
	ldhl	sp,	#3
	bit	1, (hl)
	pop	hl
	jr	Z, 00129$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:67: if(ghostySpeedX > MAX_SPD_LEFT){
	ldhl	sp,	#2
	ld	a, #0xc8
	sub	a, (hl)
	inc	hl
	ld	a, #0xfb
	sbc	a, (hl)
	ld	a, #0xfb
	ld	d, a
	bit	7, (hl)
	jr	Z, 00360$
	bit	7, d
	jr	NZ, 00361$
	cp	a, a
	jr	00361$
00360$:
	bit	7, d
	jr	Z, 00361$
	scf
00361$:
	jr	NC, 00109$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:68: ghostySpeedX -= SPD_CHANGE_X;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_ghostySpeedX + 1),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:71: while(pcFacing!=0){
00109$:
	ld	hl, #_pcFacing
	ld	a, (hl)
	or	a, a
	jp	Z, 00130$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:72: pcFacing = 0;
	ld	(hl), #0x00
	jr	00109$
00129$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:79: ghostySpeedX += SPD_CHANGE_X;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:75: } else if(joypadCurrent & J_RIGHT){
	push	hl
	ldhl	sp,	#3
	bit	0, (hl)
	pop	hl
	jr	Z, 00126$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:77: if(ghostySpeedX < MAX_SPD_RHGT){
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0x38
	ld	a, (hl)
	sbc	a, #0x04
	ld	d, (hl)
	ld	a, #0x04
	bit	7,a
	jr	Z, 00363$
	bit	7, d
	jr	NZ, 00364$
	cp	a, a
	jr	00364$
00363$:
	bit	7, d
	jr	Z, 00364$
	scf
00364$:
	jr	NC, 00113$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:79: ghostySpeedX += SPD_CHANGE_X;
	ld	hl, #_ghostySpeedX
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00113$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:82: if(pcFacing==0){
	ld	hl, #_pcFacing
	ld	a, (hl)
	or	a, a
	jr	NZ, 00130$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:83: pcFacing = 1;
	ld	(hl), #0x01
	jr	00130$
00126$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:86: if(ghostySpeedX > 0){
	ldhl	sp,	#2
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00365$
	bit	7, d
	jr	NZ, 00366$
	cp	a, a
	jr	00366$
00365$:
	bit	7, d
	jr	Z, 00366$
	scf
00366$:
	jr	NC, 00123$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:88: ghostySpeedX -= SPD_CHANGE_X;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	hl, #_ghostySpeedX + 1
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:90: if(ghostySpeedX < 0){
	ld	(hl-), a
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00130$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:91: ghostySpeedX = 0;
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00130$
00123$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:93: } else if(ghostySpeedX < 0){
	ldhl	sp,	#3
	bit	7, (hl)
	jr	Z, 00130$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:95: ghostySpeedX += SPD_CHANGE_X;
	ld	hl, #_ghostySpeedX
	ld	a, c
	ld	(hl+), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:97: if (ghostySpeedX > 0){
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00367$
	bit	7, d
	jr	NZ, 00368$
	cp	a, a
	jr	00368$
00367$:
	bit	7, d
	jr	Z, 00368$
	scf
00368$:
	jr	NC, 00130$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:98: ghostySpeedX = 0;
	xor	a, a
	ld	hl, #_ghostySpeedX
	ld	(hl+), a
	ld	(hl), a
00130$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:103: fractionX += ghostySpeedX; // adds speed (which we have as 8 or -8) to the fractional value each frame. we are gaining "8" speed a frame, which becomes 0.03 pixels per frame
	ld	a, (#_fractionX)
	ld	hl, #_ghostySpeedX
	add	a, (hl)
	ld	hl, #_fractionX
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_ghostySpeedX + 1
	adc	a, (hl)
	ld	(#_fractionX + 1),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:104: fractionY += ghostySpeedY;
	ld	a, (#_fractionY)
	ld	hl, #_ghostySpeedY
	add	a, (hl)
	ld	hl, #_fractionY
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_ghostySpeedY + 1
	adc	a, (hl)
	ld	(#_fractionY + 1),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:106: while(fractionX >= (1<<PIXEL_SHIFT)){ // shifting the bits left by 8 multiplies by 2^8 (256), so as long as fractionX is greater than or equal to 256, move ghosty by one pixel
00131$:
	ld	hl, #_fractionX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00134$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:107: ghostyX += 1;
	ld	hl, #_ghostyX
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:108: fractionX -= (1<<PIXEL_SHIFT); // subtracts 256, which resets the fractional part to 0
	ld	a,b
	dec	a
	ld	hl, #_fractionX
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00131$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:111: while(fractionX <= -(1<<PIXEL_SHIFT)){
00134$:
	ld	a, (#_fractionX)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (#_fractionX + 1)
	ldhl	sp,	#5
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:107: ghostyX += 1;
	ld	a, (#_ghostyX)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_ghostyX + 1)
	ldhl	sp,	#1
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:111: while(fractionX <= -(1<<PIXEL_SHIFT)){
	ldhl	sp,	#4
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0xff
	sbc	a, (hl)
	ld	a, #0xff
	ld	d, a
	bit	7, (hl)
	jr	Z, 00369$
	bit	7, d
	jr	NZ, 00370$
	cp	a, a
	jr	00370$
00369$:
	bit	7, d
	jr	Z, 00370$
	scf
00370$:
	jr	C, 00137$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:112: ghostyX -=1;
	pop	bc
	push	bc
	dec	bc
	ld	hl, #_ghostyX
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:113: fractionX += (1<<PIXEL_SHIFT);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0100
	add	hl, de
	ld	c, l
	ld	a, h
	ld	hl, #_fractionX
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00134$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:116: while(fractionY >= (1<<PIXEL_SHIFT)){
00137$:
	ld	hl, #_fractionY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00140$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:117: ghostyY += 1;
	ld	hl, #_ghostyY
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:118: fractionY -= (1<<PIXEL_SHIFT);
	ld	a,b
	dec	a
	ld	hl, #_fractionY
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00137$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:121: while(fractionY <= -(1<<PIXEL_SHIFT)){
00140$:
	ld	a, (#_fractionY)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_fractionY + 1)
	ldhl	sp,	#3
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:35: if(ghostyY < FLOOR){
	ld	a, (#_ghostyY)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (#_ghostyY + 1)
	ldhl	sp,	#5
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:121: while(fractionY <= -(1<<PIXEL_SHIFT)){
	ldhl	sp,	#2
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0xff
	sbc	a, (hl)
	ld	a, #0xff
	ld	d, a
	bit	7, (hl)
	jr	Z, 00371$
	bit	7, d
	jr	NZ, 00372$
	cp	a, a
	jr	00372$
00371$:
	bit	7, d
	jr	Z, 00372$
	scf
00372$:
	jr	C, 00142$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:122: ghostyY -=1;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	ld	hl, #_ghostyY
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:123: fractionY += (1<<PIXEL_SHIFT);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0100
	add	hl, de
	ld	c, l
	ld	a, h
	ld	hl, #_fractionY
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00140$
00142$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:126: if(ghostyY > FLOOR){
	ldhl	sp,	#4
	ld	a, #0x84
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00373$
	bit	7, d
	jr	NZ, 00374$
	cp	a, a
	jr	00374$
00373$:
	bit	7, d
	jr	Z, 00374$
	scf
00374$:
	jr	NC, 00144$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:127: ghostyY = FLOOR;
	ld	hl, #_ghostyY
	ld	a, #0x84
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00144$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:130: if(ghostyX <= SCREEN_LEFT_BOUND){
	ldhl	sp,	#0
	ld	a, #0x0a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00375$
	bit	7, d
	jr	NZ, 00376$
	cp	a, a
	jr	00376$
00375$:
	bit	7, d
	jr	Z, 00376$
	scf
00376$:
	jr	C, 00148$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:132: if(ghostySpeedX < 0){            
	ld	hl, #_ghostySpeedX
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00148$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:134: ghostySpeedX = ghostySpeedX >> 1;
	sra	(hl)
	dec	hl
	rr	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:135: ghostySpeedX = - ghostySpeedX;
	xor	a, a
	sub	a, (hl)
	ld	(hl+), a
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
00148$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:139: if(ghostyX >= SCREEN_RIGHT_BOUND){
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, #0xa0
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00377$
	bit	7, d
	jr	NZ, 00378$
	cp	a, a
	jr	00378$
00377$:
	bit	7, d
	jr	Z, 00378$
	scf
00378$:
	jr	C, 00152$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:141: if(ghostySpeedX > 0){            
	ld	hl, #_ghostySpeedX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00379$
	bit	7, d
	jr	NZ, 00380$
	cp	a, a
	jr	00380$
00379$:
	bit	7, d
	jr	Z, 00380$
	scf
00380$:
	jr	NC, 00152$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:146: ghostySpeedX = ghostySpeedX >> 1;
	ld	hl, #_ghostySpeedX + 1
	sra	(hl)
	dec	hl
	rr	(hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:147: ghostySpeedX = - ghostySpeedX;
	xor	a, a
	sub	a, (hl)
	ld	(hl+), a
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
00152$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:152: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
	ld	hl, #_ghostyY
	ld	c, (hl)
	ld	hl, #_ghostyX
	ld	e, (hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:151: if(pcFacing==0){
	ld	a, (#_pcFacing)
	or	a, a
	jr	NZ, 00154$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:152: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:152: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
	jr	00158$
00154$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:154: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:154: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
00158$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:156: }
	add	sp, #6
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__fractionY:
	.dw #0x0000
__xinit__ghostySpeedY:
	.dw #0x0001
__xinit__pcFacing:
	.db #0x01	; 1
__xinit__ghostyX:
	.dw #0x0050
__xinit__ghostyY:
	.dw #0x0050
__xinit__gravity:
	.dw #0x0001
	.area _CABS (ABS)
