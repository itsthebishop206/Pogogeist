#include <gb/gb.h>
#include <bkgd.h>
#include <loadGame.h>
#include <palette.h>
#include <stdint.h>
#include <gb/metasprites.h>
#include <ghosty.h>
#include <bone.h>

UBYTE spriteSize = 8;

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
    move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
    // This adjusts the DMG color palette
    OBP0_REG=DMG_PALETTE(DMG_BLACK, DMG_DARK_GRAY, DMG_LITE_GRAY, DMG_WHITE);
}

void setBone(void){
  
  set_sprite_data(4,2,boneTile);
  set_sprite_prop(4,0x00);
}

void gameFirstLoad(void){
    
    NR52_REG = 0x80;
    NR50_REG = 0x77; 
    NR51_REG = 0xFF;

    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;

    STAT_REG |= 0x40;
    LYC_REG=0;
    disable_interrupts;
    add_LCD(bkgInterrupts);
    set_interrupts(LCD_IFLAG | VBL_IFLAG);
    enable_interrupts;

    set_sprite_palette(0,1,ghosty_palettes);
    set_bkg_palette(0,1,bkgd_palettes);
    setBkgd();
    setGhosty();
    setBone();


}