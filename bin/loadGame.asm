;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module loadGame
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _initBoneTable
	.globl _initrand
	.globl _bkgInterrupts
	.globl _set_default_palette
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _vsync
	.globl _set_interrupts
	.globl _waitpad
	.globl _add_LCD
	.globl _spriteSize
	.globl _setBkgd
	.globl _setGhosty
	.globl _setBone
	.globl _smallDelay
	.globl _gameFirstLoad
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
_activeBones:
	.ds 1
_boneCounter:
	.ds 1
_frameCounter:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_spriteSize::
	.ds 1
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:20: void setBkgd(void){
;	---------------------------------
; Function setBkgd
; ---------------------------------
_setBkgd::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:22: set_bkg_data(0, bkgd_TILE_COUNT, bkgd_tiles);    
	ld	de, #_bkgd_tiles
	push	de
	ld	hl, #0x600
	push	hl
	call	_set_bkg_data
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:23: set_bkg_palette(0,1,bkgd_palettes);
	ld	de, #_bkgd_palettes
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:25: set_bkg_tiles(0, 0, 32, 18, bkgd_map_attributes);
	ld	bc, #_bkgd_map+0
	push	bc
	ld	hl, #0x1220
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:27: set_bkg_tiles(0,0,32,18,bkgd_map);
	push	bc
	ld	hl, #0x1220
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:28: }
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:30: void setGhosty(void){
;	---------------------------------
; Function setGhosty
; ---------------------------------
_setGhosty::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:32: set_sprite_data(0, 4, ghostyTiles);
	ld	de, #_ghostyTiles
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:33: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:35: OBP0_REG=DMG_PALETTE(DMG_BLACK, DMG_DARK_GRAY, DMG_LITE_GRAY, DMG_WHITE);
	ld	a, #0x1b
	ldh	(_OBP0_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:36: }
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:38: void setBone(void){
;	---------------------------------
; Function setBone
; ---------------------------------
_setBone::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:40: set_sprite_data(4,2,boneTile);
	ld	de, #_boneTile
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	ld	a, #0x04
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;c:\users\wsajj\gbdev\gbdk\include\gb\gb.h:1934: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 19)
	ld	(hl), #0x00
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:43: initBoneTable();
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:44: }
	jp	_initBoneTable
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:46: void smallDelay(uint8_t numloops){
;	---------------------------------
; Function smallDelay
; ---------------------------------
_smallDelay::
	ld	c, a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:49: for(i = 0; i < numloops; i++){
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:50: vsync();
	call	_vsync
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:49: for(i = 0; i < numloops; i++){
	inc	b
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:52: }
	jr	00103$
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:54: void gameFirstLoad(void){
;	---------------------------------
; Function gameFirstLoad
; ---------------------------------
_gameFirstLoad::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:56: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:57: NR50_REG = 0x77; 
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:58: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:60: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:62: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:63: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:65: STAT_REG |= 0x40;
	ldh	a, (_STAT_REG + 0)
	or	a, #0x40
	ldh	(_STAT_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:66: LYC_REG=0;
	xor	a, a
	ldh	(_LYC_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:68: add_LCD(bkgInterrupts);
	ld	de, #_bkgInterrupts
	call	_add_LCD
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:69: set_interrupts(LCD_IFLAG | VBL_IFLAG);
	ld	a, #0x03
	call	_set_interrupts
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:72: waitpad(J_START);
	ld	a, #0x80
	call	_waitpad
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:73: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG + 0)
	ld	c, a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:74: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	b, a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:75: initrand(seed);
	push	bc
	call	_initrand
	pop	hl
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:77: set_default_palette();
	call	_set_default_palette
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:78: set_sprite_palette(0,1,ghosty_palettes);
	ld	de, #_ghosty_palettes
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_palette
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:79: set_bkg_palette(0,1,bkgd_palettes);
	ld	de, #_bkgd_palettes
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_palette
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:80: setBkgd();
	call	_setBkgd
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:81: setGhosty();
	call	_setGhosty
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:82: setBone();
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:83: }
	jp	_setBone
	.area _CODE
	.area _INITIALIZER
__xinit__spriteSize:
	.db #0x08	; 8
	.area _CABS (ABS)
