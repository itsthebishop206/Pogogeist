#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdint.h>
#include <gbdk/platform.h>
#include <gb/metasprites.h>
#include <bone.h>
#include <projectile.h>
#include <loadGame.h>
#include <rand.h>
#include <stdlib.h>
#include <stdio.h>
#include <joypad.h>
#include <ghosty.h>
#include <playArea.h>
#include <subPixCalc.h>

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

// how do we calculate directional speed?
// im assuming it's bone(X,Y)/ghosty(X,Y)

// if there are fewer than MAX bones on the screen
// and if frameCounter is over spawnrate limit
// aim at the ghost, then incrementally increase X/Y in that direction
// so we need to find whether the bones X/Y are < or > ghostyX/Y, and adjust accordingly
// but really, the speed by which we increment is the important thing
// we're going to need subpixels again (this led to me working on mvmt again to make x never == 0)
// we will need to set the speed, then 

#pragma endregion

#pragma region definitions

static uint8_t boneCounter = 0;
static uint8_t activeBones = 0;
Projectile bones[MAX_BONE];
static uint8_t frameCounter = 0;
int16_t* deltas;
// we need pointers if we are to use subpixcalc
// i need to point to the address of the x/y coords for bones on the bone table

#pragma endregion

void initRandXY(int16_t* prX, int16_t* prY){

    uint8_t r = ((uint8_t)rand()) % (uint8_t)4;
        if(r==0){
            *prX = 20;
            *prY = 20;
        } else if(r==1){
            *prX = 130;
            *prY = 20;
        } else if(r==2){
            *prX = 130;
            *prY = 125;
        } else if(r==3){
            *prX = 20;
            *prY = 125;
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
        bones[b].prActive = 0;
        bones[b].metasprite = boneMS;
        bones[b].speed = 0;
        initRandXY(&bones[b].x, &bones[b].y);
        move_metasprite_ex(bones[b].metasprite,4,0,oambt,bones[b].x,bones[b].y);
        oambt += 2;
    }    
}

void throwBone(void){

    if(activeBones < MAX_BONE){
        // check ghostXY coords
        // calculate deltaXY values based of the coords of bone[boneCounter].XY values
        // save those values to an array of deltaXY values
        if(frameCounter < FRAME_PER_SPAWN){
            int16_t* deltas = projSPC(bones[boneCounter].x, ghostyX, bones[boneCounter].y, ghostyY);
            activeBones++;
        }

    } else{
        activeBones = 0;
    }
}

void updateBone(void){
    
    // if !active, set initial xy values
    // set these to the result of snapshot function
    static int16_t newX = 0;
    static int16_t newY = 0;
    // int16_t deltaX = deltas[0];
    // int16_t deltaY = deltas[1];
    // free(deltas);
    newX += deltas[1];
    newY += deltas[0];
    move_metasprite_ex(bones[boneCounter].metasprite,4,0,4,newX,newY);

    if(boneCounter < MAX_BONE){
        boneCounter = 0;
    } else{
        boneCounter++;
    }
}