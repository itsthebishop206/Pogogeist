#include <gb/gb.h>
#include <stdint.h>
#include <gb/metasprites.h>
#include <bone.h>
#include <projectile.h>
#include <loadGame.h>
#include <rand.h>
#include <stdlib.h>
#include <stdio.h>

#define FRAME_PER_SPAWN 5
#define FRAME_PER_MOVE 2
#define MAX_BONE 6

#pragma region notes
// I NEED AN ARRAY OF PROJECTILE STRUCTURES THAT INCLUDES:
// projectile X and Y values
// projectile speed
// projectile active (onscreen or not)
// projectile metasprite

// so first, create the structure
// then i need to create a array of type Projectile

// then i need to fill the array with Projectiles
#pragma endregion

#pragma region variables

uint8_t pXValue = 0;
uint8_t pYValue = 0;
uint8_t pSpawn = 0;
uint8_t pSpd = 0;

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
    for(uint8_t b; b < MAX_BONE; b++){

        bones[b].metasprite = boneMS;
        bones[b].active = 1;
        bones[b].x = pXValue;
        bones[b].x = pYValue;
        bones[b].speed = pSpd;

    }
}
#pragma endregion

//i need a program that will choose between 2 x coordinates and 4 y coordinates
uint8_t choose4(void){
        uint8_t r = ((uint8_t)rand()) % (uint8_t)4;
        printf("%u",r);
}