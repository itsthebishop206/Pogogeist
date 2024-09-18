#include <gb/gb.h>
#include <stdint.h>
#include <gb/metasprites.h>
#include <bone.h>
#include <projectile.h>
#include <loadGame.h>
#include <rand.h>
#include <stdlib.h>
#include <stdio.h>
#include <joypad.h>
#include <ghosty.h>

#define FRAME_PER_SPAWN 6
#define FRAME_PER_MOVE 2
#define MAX_BONE 6

#pragma disable_warning 115

#pragma region notes
// I NEED AN ARRAY OF PROJECTILE STRUCTURES THAT INCLUDES:
// projectile X and Y values
// projectile speed
// projectile active (onscreen or not)
// projectile metasprite

// so first, create the structure
// then i need to create a array of type Projectile

// then i need to fill the array with Projectiles

// then i need a program that will generate a number from (0,1,2,3)

// then i need a program that sets pX and pY depending on the result of choose4()
// do i want to combine choose4 and boneSpawn? here's what i need:
// first, check number of bones on screen
// if number of bones on screen < MAX_BONE, begin spawning a bone
// roll 4-sided die. depending on result, choose one of four sets of coordinates
// those should probably be rolled into initBoneTable

// ok, that's done, so now i need to shoot the bones across the screen every FRAME_PER_SPAWN

#pragma endregion

#pragma region variables

uint8_t pX = 0;
uint8_t pY = 0;
uint8_t pSpd = 0;
uint8_t boneCounter = 0;

typedef struct{ // typedef lets you define your own identifiers. i am defining "Projectile"

    uint8_t x;
    uint8_t y;
    uint8_t speed;
    uint8_t active;
    const metasprite_t* metasprite;

} Projectile;

Projectile bones[MAX_BONE];
#pragma endregion

#pragma region initBoneTable()
// INITIALIZE BONE TABLE...
void initBoneTable(void){
    // for loops repeat code a set number of times
    // for each index in this array:
    for(uint8_t b = 0; b < MAX_BONE; b++){
        
        uint8_t r = ((uint8_t)rand()) % (uint8_t)4;
        if(r==0){
            pX = 0;
            pY = 0;
        } else if(r==1){
            pX = 160;
            pY = 0;
        } else if(r==2){
            pX = 160;
            pY = 144;
        } else if(r==3){
            pX = 0;
            pY = 144;
        }

        bones[b].metasprite = boneMS;
        bones[b].active = 1;
        bones[b].x = pX;
        bones[b].y = pY;
        bones[b].speed = pSpd;

    }
}
#pragma endregion

#pragma region throwBone()

void throwBone(void){

    uint8_t frameCounter = 5;
    frameCounter++;

    // if there are few than MAX bones on the screen
    // and if frameCounter is over spawnrate limit
    // aim at the ghost, then incrementally increase X/Y in that direction
    // so we need to find whether the bones X/Y are < or > ghostyX/Y, and adjust accordingly
    // but really, the speed by which we increment is the important thing
    // we're going to need subpixels again
    // 

    if((boneCounter < MAX_BONE) & (frameCounter==6)){
            
        frameCounter = 0;

        if(bones[boneCounter].x < ghostyX){

        }
        
    }

}