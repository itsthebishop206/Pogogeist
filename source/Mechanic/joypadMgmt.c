#include <stdint.h>
#include <gb/gb.h>
#include <joypad.h>
#include <ghosty.h>
#include <gb/metasprites.h>
#include <loadGame.h>

#pragma region BITMASK DEFINITIONS

#define ACTION_LEFT       0x0001  // 0000 0000 0000 0001
#define ACTION_RIGHT      0x0002  // 0000 0000 0000 0010
#define ACTION_UP         0x0004  // 0000 0000 0000 0100
#define ACTION_DOWN       0x0008  // 0000 0000 0000 1000
#define ACTION_ATTACK     0x0010  // 0000 0000 0001 0000
#define ACTION_SPECIAL    0x0020  // 0000 0000 0010 0000
#define ACTION_NEUTRALA   0x0040  // 0000 0000 0100 0000
#define ACTION_UPA        0x0080  // etc
#define ACTION_DOWNA      0x0100
#define ACTION_LEFTA      0x0200
#define ACTION_RIGHTA     0x0400
#define ACTION_NEUTRALB   0x0800
#define ACTION_UPB        0x1000
#define ACTION_DOWNB      0x2000
#define ACTION_LEFTB      0x4000
#define ACTION_RIGHTB     0x8000
//remember, B is attack and A is special

#pragma endregion

int16_t joypadMgr(){

    joypadCurrent = joypad();
    int16_t actions = 0;

// KEEP IN MIND - UPDATE THE BITMASK TO TURN BITS OFF

    if(joypadCurrent & J_A){
        actions |= ACTION_SPECIAL;
    }
    
    if(joypadCurrent & J_B){
        actions |= ACTION_ATTACK;
    }

    if(joypadCurrent & J_UP){
        actions |= ACTION_UP;
    }

    if(joypadCurrent & J_DOWN){
        actions |= ACTION_DOWN;
    }

    if(joypadCurrent & J_LEFT){

        actions |= ACTION_LEFT;

        if(pcFacing==1){
            //move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);
            pcFacing = 0;
        }

        //ghostyX = ghostyX - 2;
        //move_metasprite_flipx(ghostyMS,0,0,0,ghostyX,ghostyY);

    }    

    if(joypadCurrent & J_RIGHT){
        
        actions |= ACTION_RIGHT;

        if(pcFacing==0){
            //move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
            pcFacing = 1;
        }

        //ghostyX = ghostyX + 2;
        //move_metasprite_ex(ghostyMS,0,0,0,ghostyX,ghostyY);
    } 

    return actions;
    //check

}