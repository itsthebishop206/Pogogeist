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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:19: void joypadMgr(void){
;	---------------------------------
; Function joypadMgr
; ---------------------------------
_joypadMgr::
	add	sp, #-5
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:22: joypadCurrent = joypad();
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:24: if(ghostyY < FLOOR){
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:28: ghostySpeedY += (gravity += counter);
	ld	hl, #_gravity
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ldhl	sp,	#3
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
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_ghostySpeedY
	ld	a, e
	ld	(hl+), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:30: if(ghostySpeedY > MAX_SPD){
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
	jr	Z, 00302$
	bit	7, d
	jr	NZ, 00303$
	cp	a, a
	jr	00303$
00302$:
	bit	7, d
	jr	Z, 00303$
	scf
00303$:
	jr	NC, 00104$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:31: ghostySpeedY = MAX_SPD;
	ld	hl, #_ghostySpeedY
	ld	a, #0xf8
	ld	(hl+), a
	ld	(hl), #0x07
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:32: counter = 0;
00104$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:41: if(joypadCurrent & J_B){
	push	hl
	ldhl	sp,	#2
	bit	5, (hl)
	pop	hl
	jr	Z, 00106$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:42: ghostyY -= 4;
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:56: ghostySpeedX -= SPD_CHANGE_X;
	ld	hl, #_ghostySpeedX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xf8
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ldhl	sp,	#1
	ld	(hl), e
	inc	hl
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:54: if(joypadCurrent & J_LEFT){
	push	hl
	dec	hl
	dec	hl
	bit	1, (hl)
	pop	hl
	jr	Z, 00124$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:56: ghostySpeedX -= SPD_CHANGE_X;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_ghostySpeedX + 1),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:58: if(pcFacing==1){
	ld	a, (#_pcFacing)
	dec	a
	jp	NZ,00125$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:59: pcFacing = 0;
	ld	hl, #_pcFacing
	ld	(hl), #0x00
	jp	00125$
00124$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:64: ghostySpeedX += SPD_CHANGE_X;
	ld	hl, #0x0008
	add	hl, bc
	ld	e, l
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), e
	inc	hl
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:62: } else if(joypadCurrent & J_RIGHT){
	push	hl
	ldhl	sp,	#2
	bit	0, (hl)
	pop	hl
	jr	Z, 00121$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:64: ghostySpeedX += SPD_CHANGE_X;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_ghostySpeedX + 1),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:66: if(pcFacing==0){
	ld	hl, #_pcFacing
	ld	a, (hl)
	or	a, a
	jr	NZ, 00125$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:67: pcFacing = 1;
	ld	(hl), #0x01
	jr	00125$
00121$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:70: if(ghostySpeedX > 0){
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00309$
	bit	7, d
	jr	NZ, 00310$
	cp	a, a
	jr	00310$
00309$:
	bit	7, d
	jr	Z, 00310$
	scf
00310$:
	jr	NC, 00118$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:72: ghostySpeedX -= SPD_CHANGE_X;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_ghostySpeedX + 1
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:74: if(ghostySpeedX < 0){
	ld	(hl-), a
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00125$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:75: ghostySpeedX = 0;
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00125$
00118$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:77: } else if(ghostySpeedX < 0){
	bit	7, b
	jr	Z, 00125$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:79: ghostySpeedX += SPD_CHANGE_X;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_ghostySpeedX),a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	hl, #_ghostySpeedX + 1
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:81: if (ghostySpeedX > 0){
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
	jr	Z, 00311$
	bit	7, d
	jr	NZ, 00312$
	cp	a, a
	jr	00312$
00311$:
	bit	7, d
	jr	Z, 00312$
	scf
00312$:
	jr	NC, 00125$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:82: ghostySpeedX = 0;
	xor	a, a
	ld	hl, #_ghostySpeedX
	ld	(hl+), a
	ld	(hl), a
00125$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:87: fractionX += ghostySpeedX; // adds speed (which we have as 8 or -8) to the fractional value each frame. we are gaining "8" speed a frame, which becomes 0.03 pixels per frame
	ld	a, (#_fractionX)
	ld	hl, #_ghostySpeedX
	add	a, (hl)
	ld	hl, #_fractionX
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_ghostySpeedX + 1
	adc	a, (hl)
	ld	(#_fractionX + 1),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:88: fractionY += ghostySpeedY;
	ld	a, (#_fractionY)
	ld	hl, #_ghostySpeedY
	add	a, (hl)
	ld	hl, #_fractionY
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_ghostySpeedY + 1
	adc	a, (hl)
	ld	(#_fractionY + 1),a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:90: while(fractionX >= (1<<PIXEL_SHIFT)){ // shifting the bits left by 8 multiplies by 2^8 (256), so as long as fractionX is greater than or equal to 256, move ghosty by one pixel
00126$:
	ld	a, (#_fractionX)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (#_fractionX + 1)
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0x00
	ld	a, (hl)
	sbc	a, #0x01
	ld	d, (hl)
	ld	a, #0x01
	bit	7,a
	jr	Z, 00313$
	bit	7, d
	jr	NZ, 00314$
	cp	a, a
	jr	00314$
00313$:
	bit	7, d
	jr	Z, 00314$
	scf
00314$:
	jr	C, 00129$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:91: ghostyX += 1;
	ld	hl, #_ghostyX
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:92: fractionX -= (1<<PIXEL_SHIFT); // subtracts 256, which resets the fractional part to 0
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0100
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	c, e
	ld	hl, #_fractionX
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00126$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:95: while(fractionX <= -(1<<PIXEL_SHIFT)){
00129$:
	ld	a, (#_fractionX)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (#_fractionX + 1)
	ldhl	sp,	#4
	ld	(hl-), a
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0xff
	sbc	a, (hl)
	ld	a, #0xff
	ld	d, a
	bit	7, (hl)
	jr	Z, 00315$
	bit	7, d
	jr	NZ, 00316$
	cp	a, a
	jr	00316$
00315$:
	bit	7, d
	jr	Z, 00316$
	scf
00316$:
	jr	C, 00132$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:96: ghostyX -=1;
	ld	hl, #_ghostyX
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	dec	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:97: fractionX += (1<<PIXEL_SHIFT);
	ldhl	sp,#3
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
	jr	00129$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:100: while(fractionY >= (1<<PIXEL_SHIFT)){
00132$:
	ld	a, (#_fractionY)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (#_fractionY + 1)
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0x00
	ld	a, (hl)
	sbc	a, #0x01
	ld	d, (hl)
	ld	a, #0x01
	bit	7,a
	jr	Z, 00317$
	bit	7, d
	jr	NZ, 00318$
	cp	a, a
	jr	00318$
00317$:
	bit	7, d
	jr	Z, 00318$
	scf
00318$:
	jr	C, 00135$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:101: ghostyY += 1;
	ld	hl, #_ghostyY
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:102: fractionY -= (1<<PIXEL_SHIFT);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0100
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	c, e
	ld	hl, #_fractionY
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00132$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:105: while(fractionY <= -(1<<PIXEL_SHIFT)){
00135$:
	ld	a, (#_fractionY)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (#_fractionY + 1)
	ldhl	sp,	#4
	ld	(hl), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:24: if(ghostyY < FLOOR){
	ld	hl, #_ghostyY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:105: while(fractionY <= -(1<<PIXEL_SHIFT)){
	ldhl	sp,	#3
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0xff
	sbc	a, (hl)
	ld	a, #0xff
	ld	d, a
	bit	7, (hl)
	jr	Z, 00319$
	bit	7, d
	jr	NZ, 00320$
	cp	a, a
	jr	00320$
00319$:
	bit	7, d
	jr	Z, 00320$
	scf
00320$:
	jr	C, 00137$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:106: ghostyY -=1;
	dec	bc
	ld	hl, #_ghostyY
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:107: fractionY += (1<<PIXEL_SHIFT);
	ldhl	sp,#3
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
	jr	00135$
00137$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:110: if(ghostyY > FLOOR){
	ld	e, b
	ld	d, #0x00
	ld	a, #0x84
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00321$
	bit	7, d
	jr	NZ, 00322$
	cp	a, a
	jr	00322$
00321$:
	bit	7, d
	jr	Z, 00322$
	scf
00322$:
	jr	NC, 00139$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:111: ghostyY = FLOOR;
	ld	hl, #_ghostyY
	ld	a, #0x84
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00139$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:114: if(pcFacing==1){
	ld	a, (#_pcFacing)
	dec	a
	jr	NZ, 00141$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:115: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:115: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
00141$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:118: if(pcFacing==0){
	ld	a, (#_pcFacing)
	or	a, a
	jr	NZ, 00146$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:119: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
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
	call	___move_metasprite_flipx
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:119: move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
00146$:
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\Mechanic\joypadMgmt.c:121: }
	add	sp, #5
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
