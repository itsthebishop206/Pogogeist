#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>
#include <stdint.h>
#include <loadGame.h>
#include <joypad.h>
#include <bone.h>
#include <palette.h>
#include <bkgd.h>
#include <projectile.h>
#include <ghosty.h>
#include <subPixCalc.h>

void main(void)
{
    gameFirstLoad();

    while(1) {        
        
        //set_default_palette();
        joypadMgr();
        scrollBkg();
        throwBone();
        //updateBone();
        
        // Done processing, yield CPU and wait for start of next frame
        vsync();
    }
}
