#pragma disable_warning 115
#include <stdint.h>
#include <gb/gb.h>
#include <gb/cgb.h>
#include <joypad.h>
#include <ghosty.h>
#include <gbdk/platform.h>
#include <gb/metasprites.h>
#include <loadGame.h>
#include <stdlib.h>
#include <playArea.h>
#include <subPixCalc.h>
#include <stdio.h>
#include <collision.h>
#include <projectiles.h>

#pragma region definitions

#define SPD_CHANGE 8 // in 16.8 fixed point, this becomes 0.03 pixels/frame after all the math
#define MAX_SPD_DOWN 1000
#define MAX_SPD_UP -1000
#define MAX_SPD_LEFT -1000
#define MAX_SPD_RIGHT 1000
#define MAX_GRAVITY 500
#define MIN_GRAVITY 10

static int16_t ghostySpeedX = 0;
static int16_t ghostySpeedY = 0;
static int16_t ghostyY = 80;
static int16_t ghostyX = 80;
uint8_t pcFacing = 1;
uint16_t gravityGhost = 1;

static int16_t *pghostyX = &ghostyX;
static int16_t *pghostyY = &ghostyY;

#pragma endregion

void joypadMgr(void){

    // if(ghostySpeedY < MAX_SPD_DOWN){
        
    //     ghostySpeedY += gravityGhost;

    //     if(gravityGhost < MAX_GRAVITY){            
    //         gravityGhost++;
    // }

    uint8_t joypadCurrent = 0;
    joypadCurrent = joypad();

    if(joypadCurrent & J_A){

    }
    
    if(joypadCurrent & J_B){
        //ghostyY -= 4;
        //joypadPast = joypadCurrent;
    }

    if(joypadCurrent & J_UP){
        
        //gravityGhost = 0;
        // if(gravityGhost > MIN_GRAVITY){


        // } else if(gravityGhost <= MIN_GRAVITY){
        //     gravityGhost++;
        // }
        if(ghostySpeedY > MAX_SPD_UP){            
            ghostySpeedY -= SPD_CHANGE;
        }
    } else if(joypadCurrent & J_DOWN){
        
        if(ghostySpeedY < MAX_SPD_DOWN){
            ghostySpeedY += SPD_CHANGE;
        }
    } else {
        if(ghostySpeedY > 0){
            
            ghostySpeedY -= SPD_CHANGE;
            
            if(ghostySpeedY < 0){
                ghostySpeedY = 0;
            }
        } else if(ghostySpeedY < 0){
            
            ghostySpeedY += SPD_CHANGE;
            
            if (ghostySpeedY > 0){
                ghostySpeedY = 0;
            }
        }
    }

    if(joypadCurrent & J_LEFT){
        
        if(ghostySpeedX > MAX_SPD_LEFT){
            ghostySpeedX -= SPD_CHANGE;
        }

        if(pcFacing!=0){
            pcFacing = 0;
        }

    } else if(joypadCurrent & J_RIGHT){
        
        if(ghostySpeedX < MAX_SPD_RIGHT){

            ghostySpeedX += SPD_CHANGE;
        }

        if(pcFacing==0){
            pcFacing = 1;
        }
    } else {
        if(ghostySpeedX > 0){
            
            ghostySpeedX -= SPD_CHANGE;
            
            if(ghostySpeedX < 0){
                ghostySpeedX = 0;
            }
        } else if(ghostySpeedX < 0){
            
            ghostySpeedX += SPD_CHANGE;
            
            if (ghostySpeedX > 0){
                ghostySpeedX = 0;
            }
        }
    }
}