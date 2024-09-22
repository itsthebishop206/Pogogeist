#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdint.h>
#include <gbdk/platform.h>
#include <gb/metasprites.h>
#include <bone.h>
#include <projectiles.h>
#include <loadGame.h>
#include <rand.h>
#include <stdlib.h>
#include <stdio.h>
#include <joypad.h>
#include <ghosty.h>
#include <playArea.h>
#include <subPixCalc.h>

#pragma disable_warning 115

#pragma region definitions

// static uint16_t accumX;
// static uint16_t accumY;
static uint8_t boneCounter = 0;
static uint8_t activeBones = 0;
Projectile bones[MAX_BONE];
static uint8_t frameCounter = 0;
int16_t* deltas;
// we need pointers if we are to use subpixcalc
// i need to point to the address of the x/y coords for bones on the bone table

#pragma endregion

void initRandXY(int16_t* prX, int16_t* prY){

    // uint8_t r = ((uint8_t)rand()) % (uint8_t)4;
    //     if(r==0){
    //         *prX = -14;
    //         *prY = -14;
    //     } else if(r==1){
    //         *prX = 174;
    //         *prY = -14;
    //     } else if(r==2){
    //         *prX = 174;
    //         *prY = 158;
    //     } else if(r==3){
    //         *prX = -14;
    //         *prY = 158;
    //     }

        uint8_t r = ((uint8_t)rand()) % (uint8_t)4;
        if(r==0){
            *prX = 20;
            *prY = 20;
        } else if(r==1){
            *prX = 130;
            *prY = 20;
        } else if(r==2){
            *prX = 130;
            *prY = 130;
        } else if(r==3){
            *prX = 20;
            *prY = 130;
        }
}

void initBoneTable(void){
    // INITIALIZE BONE TABLE...
    // for loops repeat code a set number of times
    // for each index in this array:

    uint8_t oambt = 4;

    for(uint8_t b = 0; b < MAX_BONE; b++){

        bones[b].x = 0;
        bones[b].y = 0;
        bones[b].spdX = 0;
        bones[b].spdY = 0;
        bones[b].active = 0;
        bones[b].fired = 0;
        bones[b].metasprite = boneMS;
        bones[b].OAMindex = oambt;
        bones[b].w = 16;
        bones[b].h = 16;
        // bones[b].deltaX = 1;
        // bones[b].deltaY = 1;
        //bones[b].speed = 0;
        initRandXY(&bones[b].x, &bones[b].y);
        projSPCAlpha(&bones[b].x, ghostyX, &bones[b].y, ghostyY);
        bones[b].deltaX = deltas[0];
        bones[b].deltaY = deltas[1];
        
        move_metasprite_ex(bones[b].metasprite,4,0,bones[b].OAMindex,bones[b].x,bones[b].y);
        //bones[b].deltaF = deltas[2];

        // if(bones[b].x < ghostyX){
        //     bones[b].deltaX = -(bones[b].deltaX);
        // }

        // if(bones[b].y < ghostyY){
        //     bones[b].deltaY = -(bones[b].deltaY);
        // }      

        oambt += 2;
    }    
}

void throwBone(uint8_t b){

    if(frameCounter >= FRAME_PER_SPAWN){
        bones[b].fired = 1;
        frameCounter = 0;
    }

    frameCounter++;
}

void updateBone(void){

    uint8_t oambt = 4;
    activeBones = 0; 
    static uint16_t accumX = 0;
    static uint16_t accumY = 0;  

        for(uint8_t b = 0; b < MAX_BONE; b++){            
            
            accumX += bones[b].deltaX >> PIXEL_SHIFT;
            accumY += bones[b].deltaY >> PIXEL_SHIFT;
            oambt = bones[b].OAMindex;
            
            if((bones[b].x > PROJ_LEFT_BOUND) && (bones[b].x < PROJ_RIGHT_BOUND) && (bones[b].y < PROJ_BOT_BOUND) && (bones[b].y > PROJ_TOP_BOUND)){

                bones[b].active = 1;
            
            } else{

                bones[b].active = 0;
            }

            if(!bones[b].fired && bones[b].active){

                throwBone(b);
            }

            if(bones[b].active){
                      
                // if(accumX > (1<<PIXEL_SHIFT)){
                    
                //     // ternary operator
                //     // condition ? if true : if false;
                //     bones[b].x += (accumX > 0) ? 1 : -1;
                //     accumX -= (1<<PIXEL_SHIFT);
                // }

                // if(accumY > (1<<PIXEL_SHIFT)){

                //     bones[b].y += (accumY > 0) ? 1 : -1;
                //     accumY -= (1<<PIXEL_SHIFT);
                // }

                // bones[b].x += bones[b].deltaX;
                // bones[b].y += bones[b].deltaY;
                // move_metasprite_ex(bones[b].metasprite,4,0,bones[b].OAMindex,bones[b].x,bones[b].y);
                oambt += 2;
                activeBones++;
                
            } else if(!(bones[b].active)){
                
                activeBones --;
                bones[b].fired = 0;
                initRandXY(&bones[b].x, &bones[b].y);
                projSPCAlpha(&bones[b].x, ghostyX, &bones[b].y, ghostyY);
                // if(bones[b].x < *pghostyX){
                //     bones[b].deltaX = -(bones[b].deltaX);
                // }

                // if(bones[b].y < *pghostyY){
                //     bones[b].deltaY = -(bones[b].deltaY);
                // }   
            }
        }
}