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
	.globl _ghostyY
	.globl _ghostyX
	.globl _pcFacing
	.globl _joypadCurrent
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
_joypadCurrent::
	.ds 1
_pcFacing::
	.ds 1
_ghostyX::
	.ds 2
_ghostyY::
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
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:16: void setBkgd(void){
;	---------------------------------
; Function setBkgd
; ---------------------------------
_setBkgd::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:18: set_bkg_data(0, bkgd_TILE_COUNT, bkgd_tiles);    
	ld	de, #_bkgd_tiles
	push	de
	ld	hl, #0x300
	push	hl
	call	_set_bkg_data
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:19: set_bkg_palette(0,1,bkgd_palettes);
	ld	de, #_bkgd_palettes
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:21: set_bkg_tiles(0, 0, 32, 18, bkgd_map_attributes);
	ld	bc, #_bkgd_map+0
	push	bc
	ld	hl, #0x1220
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:23: set_bkg_tiles(0,0,32,18,bkgd_map);
	push	bc
	ld	hl, #0x1220
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:24: }
	ret
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:26: void setGhosty(void){
;	---------------------------------
; Function setGhosty
; ---------------------------------
_setGhosty::
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:30: set_sprite_data(0, 4, ghostyTiles);
	ld	de, #_ghostyTiles
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:31: set_sprite_palette(0,1,ghosty_palettes);
	ld	de, #_ghosty_palettes
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_palette
	add	sp, #4
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:32: move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
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
	ld	de, #0x5050
	xor	a, a
	call	___move_metasprite
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:34: OBP0_REG=DMG_PALETTE(DMG_WHITE, DMG_DARK_GRAY, DMG_LITE_GRAY, DMG_BLACK);
	ld	a, #0xd8
	ldh	(_OBP0_REG + 0), a
;C:\Users\wsajj\GBdev\gbdk\_code\gbJam24\source\GameStates\loadGame.c:35: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__spriteSize:
	.db #0x08	; 8
__xinit__joypadCurrent:
	.db #0x00	; 0
__xinit__pcFacing:
	.db #0x01	; 1
__xinit__ghostyX:
	.dw #0x0050
__xinit__ghostyY:
	.dw #0x0050
	.area _CABS (ABS)
