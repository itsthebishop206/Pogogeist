#include <stdint.h>
#include <gb/gb.h>
#include <joypad.h>
#include <ghosty.h>
#include <gb/metasprites.h>
#include <loadGame.h>

#define PIXEL_SHIFT 8

void joypadMgr(void){

    uint8_t joypadCurrent = 0;
    joypadCurrent = joypad();
    ghostySpeedX = 0;

    if(joypadCurrent & J_A){

    }
    
    if(joypadCurrent & J_B){

    }

    if(joypadCurrent & J_UP){

    }

    if(joypadCurrent & J_DOWN){

    }

    if(joypadCurrent & J_LEFT){
        
        ghostySpeedX = -1 << PIXEL_SHIFT;
        if(pcFacing==1){
            pcFacing = 0;
        }
    }

    if(joypadCurrent & J_RIGHT){
        
        ghostySpeedX = 1 << PIXEL_SHIFT;
        if(pcFacing==0){
            pcFacing = 1;
        }
    }

    fractionX += ghostySpeedX;

    while(fractionX >= (1<<PIXEL_SHIFT)){
        ghostyX += 1;
        fractionX -= (1<<PIXEL_SHIFT);
    } 

    while(fractionX <= -(1<<PIXEL_SHIFT)){
        ghostyX -=1;
        fractionX += (1<<PIXEL_SHIFT);
    }


    if(pcFacing==1){
        move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
    }
    
    if(pcFacing==0){
        move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
    }
}