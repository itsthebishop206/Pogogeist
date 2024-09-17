#include <stdint.h>
#include <gb/gb.h>
#include <joypad.h>
#include <ghosty.h>
#include <gb/metasprites.h>
#include <loadGame.h>

#define PIXEL_SHIFT 8
#define SPD_CHANGE_X 8
#define FLOOR 132
#define MAX_SPD 2040

int16_t ghostySpeedX, fractionX, fractionY = 0;
int16_t ghostySpeedY = 1;
uint8_t pcFacing = 1;
int16_t ghostyX = 80, ghostyY = 80;
uint16_t gravity = 1;

void joypadMgr(void){

    uint8_t joypadCurrent = 0;
    joypadCurrent = joypad();

    if(ghostyY < FLOOR){
        
        uint16_t counter = 0;
        counter++;
        ghostySpeedY += (gravity += counter);

        if(ghostySpeedY > MAX_SPD){
            ghostySpeedY = MAX_SPD;
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
        
        //ghostySpeedX = -128;
        ghostySpeedX -= SPD_CHANGE_X;

        if(pcFacing==1){
            pcFacing = 0;
        }        

    } else if(joypadCurrent & J_RIGHT){
        
        ghostySpeedX += SPD_CHANGE_X;

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

    fractionX += ghostySpeedX;
    fractionY += ghostySpeedY;

    while(fractionX >= (1<<PIXEL_SHIFT)){
        ghostyX += 1;
        fractionX -= (1<<PIXEL_SHIFT);
    } 

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

    if(pcFacing==1){
        move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
    }
    
    if(pcFacing==0){
        move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
    }
}