#pragma disable_warning 115
#include <stdint.h>
#include <gb/gb.h>
#include <joypad.h>
#include <ghosty.h>
#include <gb/metasprites.h>
#include <loadGame.h>
#include <stdlib.h>

#pragma region definitions
#define PIXEL_SHIFT 8 // bit shift amount
#define SPD_CHANGE_X 8 // in 16.8 fixed point, this becomes 0.03 pixels/frame after all the math
#define FLOOR 132
#define MAX_SPD_DOWN 2040
#define MAX_SPD_UP -2040
#define MAX_SPD_LEFT -1080
#define MAX_SPD_RHGT 1080
#define SCREEN_LEFT_BOUND 10
#define SCREEN_RIGHT_BOUND 160
#define SCREEN_TOP_BOUND 10
#define SCREEN_BOT_BOUND 134

int16_t ghostySpeedX, fractionX, fractionY = 0;
int16_t ghostySpeedY = 1;
uint8_t pcFacing = 1;
int16_t ghostyX = 80, ghostyY = 80;
uint16_t gravity = 1;
#pragma endregion

void joypadMgr(void){

    uint8_t joypadCurrent = 0;
    joypadCurrent = joypad();

    if(ghostyY < FLOOR){
        
        uint16_t counter = 0;
        counter++;
        ghostySpeedY += (gravity += counter);

        if(ghostySpeedY > MAX_SPD_DOWN){
            ghostySpeedY = MAX_SPD_DOWN;
            counter = 0;
            //gravity = 1;
        }
    }

    if(joypadCurrent & J_A){

    }
    
    if(joypadCurrent & J_B){
        ghostyY -= 4;
        //joypadPast = joypadCurrent;
    }

    if(joypadCurrent & J_UP){

    }

    if(joypadCurrent & J_DOWN){

    }

    if(joypadCurrent & J_LEFT){
        
        if(ghostySpeedX > MAX_SPD_LEFT){
            ghostySpeedX -= SPD_CHANGE_X;
        }

        while(pcFacing!=0){
            pcFacing = 0;
        }

    } else if(joypadCurrent & J_RIGHT){
        
        if(ghostySpeedX < MAX_SPD_RHGT){

            ghostySpeedX += SPD_CHANGE_X;
        }

        if(pcFacing==0){
            pcFacing = 1;
        }
    } else {
        if(ghostySpeedX > 0){
            
            ghostySpeedX -= SPD_CHANGE_X;
            
            if(ghostySpeedX < 0){
                ghostySpeedX = 0;
            }
        } else if(ghostySpeedX < 0){
            
            ghostySpeedX += SPD_CHANGE_X;
            
            if (ghostySpeedX > 0){
                ghostySpeedX = 0;
            }
        }
    }

    fractionX += ghostySpeedX; // adds speed (which we have as 8 or -8) to the fractional value each frame. we are gaining "8" speed a frame, which becomes 0.03 pixels per frame
    fractionY += ghostySpeedY;

    while(fractionX >= (1<<PIXEL_SHIFT)){ // shifting the bits left by 8 multiplies by 2^8 (256), so as long as fractionX is greater than or equal to 256, move ghosty by one pixel
        ghostyX += 1;
        fractionX -= (1<<PIXEL_SHIFT); // subtracts 256, which resets the fractional part to 0
    }// however, ghostySpeed has been accumulating this entire time!! so eventually when you add speed to fraction it is greater than 256 which results in movement that is faster than one pixel per frame
    // as of writing this i do not have a max speed set for X so it just increases infinitely. dont forget to do that
    while(fractionX <= -(1<<PIXEL_SHIFT)){
        ghostyX -=1;
        fractionX += (1<<PIXEL_SHIFT);
    }

    while(fractionY >= (1<<PIXEL_SHIFT)){
        ghostyY += 1;
        fractionY -= (1<<PIXEL_SHIFT);
    } 

    while(fractionY <= -(1<<PIXEL_SHIFT)){
        ghostyY -=1;
        fractionY += (1<<PIXEL_SHIFT);
    }

    if(ghostyY > FLOOR){
        ghostyY = FLOOR;
    }

    if(ghostyX <= SCREEN_LEFT_BOUND){

        if(ghostySpeedX < 0){            
            
            ghostySpeedX = ghostySpeedX >> 1;
            ghostySpeedX = - ghostySpeedX;
        }
    }

    if(ghostyX >= SCREEN_RIGHT_BOUND){

        if(ghostySpeedX > 0){            
            
            // originally, this (and above) was written as ghostySpeedX = (-(ghostySpeedX/2)), but the compiler didnt like that.
            // turns out gbdk does bit shifting (x >> 1 = x/2) before negation, so maybe the parantheses didnt matter?
            // could also just be that too much was going on at once. however, it only threw the warning up for the right side of the screen. odd.
            ghostySpeedX = ghostySpeedX >> 1;
            ghostySpeedX = - ghostySpeedX;
        }
    }

    if(pcFacing==0){
        move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
    } else {
        move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
    }
}