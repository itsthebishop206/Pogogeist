#include <gb/gb.h>
#include <bkgd.h>
#include <ghosty.h>
#include <loadGame.h>
#include <palette.h>
#include <stdint.h>
#include <gb/metasprites.h>

UBYTE spriteSize = 8;

uint8_t pcFacing = 1;
int16_t ghostyX = 80;
int16_t ghostyY = 80;
int16_t ghostySpeedX, fractionX = 0;

void setBkgd(void){

    set_bkg_data(0, bkgd_TILE_COUNT, bkgd_tiles);    
    set_bkg_palette(0,1,bkgd_palettes);
    //VBK_REG = 1; syntax wrong on these. works for now without them though
    set_bkg_tiles(0, 0, 32, 18, bkgd_map_attributes);
    //VBK_REG = 0;
    set_bkg_tiles(0,0,32,18,bkgd_map);
}

void setGhosty(void){

    set_sprite_data(0, 4, ghostyTiles);
    set_sprite_palette(0,1,ghosty_palettes);
    move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
    // This adjusts the DMG color palette
    OBP0_REG=DMG_PALETTE(DMG_WHITE, DMG_DARK_GRAY, DMG_LITE_GRAY, DMG_BLACK);
}