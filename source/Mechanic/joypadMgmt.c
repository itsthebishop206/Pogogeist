#pragma disable_warning 115
#include <stdint.h>
#include <gb/gb.h>
#include <joypad.h>
#include <ghosty.h>
#include <gb/metasprites.h>
#include <loadGame.h>
#include <stdlib.h>
#include <playArea.h>
#include <subPixCalc.h>
#include <stdio.h>

#pragma region definitions

#define SPD_CHANGE 8 // in 16.8 fixed point, this becomes 0.03 pixels/frame after all the math
#define MAX_SPD_DOWN 1000
#define MAX_SPD_UP -1000
#define MAX_SPD_LEFT -1000
#define MAX_SPD_RIGHT 1000

int16_t ghostySpeedX = 0;
int16_t ghostySpeedY = 0;
int16_t ghostyY = 80;
int16_t ghostyX = 80;
uint8_t pcFacing = 1;
uint16_t gravity = 1;

int16_t *pghostyX = &ghostyX;
int16_t *pghostyY = &ghostyY;

#pragma endregion

void joypadMgr(void){

    uint8_t joypadCurrent = 0;
    joypadCurrent = joypad();

    if(joypadCurrent & J_A){

    }
    
    if(joypadCurrent & J_B){
        //ghostyY -= 4;
        //joypadPast = joypadCurrent;
    }

    if(joypadCurrent & J_UP){
        
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

        while(pcFacing!=0){
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

    // since this function is changing the X and Y values, we need a pointer to those values
    // this is because standard c can only return one variable per function, so return will not be useful in this case
    // we do not need the same for speed, because it is only using those for calculation, not changing them
    // this is not written as subPixCalc(*pghostyX,*pghostyY,ghostySpeedX,ghostySpeedY);
    // because the inclusion of the asterisks tells the program to dereference the pointers
    // since we want to pass the function the pointers themselves, do not dereference them yet
    subPixCalc(pghostyX,pghostyY,ghostySpeedX,ghostySpeedY);

    if(ghostyY <= CEILING){
        
        if(ghostySpeedY < 0){

            ghostyY = CEILING;
            ghostySpeedY = ghostySpeedY >> 1;
            ghostySpeedY = -ghostySpeedY;
        }
    } else if (ghostyY >= FLOOR){
        
        ghostySpeedY = 0;
        ghostyY = FLOOR;
    }
    
    if(ghostyX <= SCREEN_LEFT_BOUND){

        if(ghostySpeedX < 0){            
            
            ghostyX = SCREEN_LEFT_BOUND;
            ghostySpeedX = ghostySpeedX >> 1;
            ghostySpeedX = -ghostySpeedX;
        }
    }

    if(ghostyX >= SCREEN_RIGHT_BOUND){

        if(ghostySpeedX > 0){            
            
            // originally, this (and above) was written as ghostySpeedX = (-(ghostySpeedX/2)), but the compiler didnt like that.
            // turns out gbdk does bit shifting (x >> 1 = x/2) before negation, so maybe the parantheses didnt matter?
            // could also just be that too much was going on at once. however, it only threw the warning up for the right side of the screen. odd.
            ghostyX = SCREEN_RIGHT_BOUND;
            ghostySpeedX = ghostySpeedX >> 1;
            ghostySpeedX = -ghostySpeedX;
        }
    }

    if(pcFacing==0){
        move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
    } else if(pcFacing==1){
        move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
    }
}