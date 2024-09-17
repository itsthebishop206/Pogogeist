#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include <stdint.h>
#include <loadGame.h>
#include <joypad.h>

#define floorY 21;

void main(void)
{
    setBkgd();
    setGhosty();

    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;

    // Loop forever
    while(1) {        
        
        joypadMgr();
        bkgdScroll();
        // Done processing, yield CPU and wait for start of next frame
        wait_vbl_done();
    }
}
