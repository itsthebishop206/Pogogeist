#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include <stdint.h>
#include <loadGame.h>
#include <joypad.h>
#include <bone.h>
#include <palette.h>

#define floorY 21;

void main(void)
{

    set_sprite_palette(0,1,ghosty_palettes);
    setBkgd();
    setGhosty();
    setBone();

    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;

    // Loop forever
    while(1) {        
        
        joypadMgr();
        bkgScroll();
        throwBone();
        // Done processing, yield CPU and wait for start of next frame
        wait_vbl_done();
    }
}
