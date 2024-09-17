;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module loadGame
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _spriteSize
	.globl _setBkgd
	.globl _setGhosty
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:11: void setBkgd(void){
;	---------------------------------
; Function setBkgd
; ---------------------------------
_setBkgd::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:13: set_bkg_data(0, bkgd_TILE_COUNT, bkgd_tiles);    
	ld	de, #_bkgd_tiles
	push	de
	ld	hl, #0x600
	push	hl
	call	_set_bkg_data
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:14: set_bkg_palette(0,1,bkgd_palettes);
	ld	de, #_bkgd_palettes
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:16: set_bkg_tiles(0, 0, 32, 18, bkgd_map_attributes);
	ld	bc, #_bkgd_map+0
	push	bc
	ld	hl, #0x1220
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:18: set_bkg_tiles(0,0,32,18,bkgd_map);
	push	bc
	ld	hl, #0x1220
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:19: }
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:21: void setGhosty(void){
;	---------------------------------
; Function setGhosty
; ---------------------------------
_setGhosty::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:23: set_sprite_data(0, 4, ghostyTiles);
	ld	de, #_ghostyTiles
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:24: set_sprite_palette(0,1,ghosty_palettes);
	ld	de, #_ghosty_palettes
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_palette
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:25: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:27: OBP0_REG=DMG_PALETTE(DMG_BLACK, DMG_DARK_GRAY, DMG_LITE_GRAY, DMG_WHITE);
	ld	a, #0x1b
	ldh	(_OBP0_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:28: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__spriteSize:
	.db #0x08	; 8
	.area _CABS (ABS)
