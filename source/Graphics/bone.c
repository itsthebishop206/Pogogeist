#include <gb/gb.h>
#include <gb/cgb.h>
#include <palette.h>
#include <gb/metasprites.h>
#include <bone.h>

#define OFFSCREEN_RIGHT 154
#define OFFSCREEN_LEFT -20
#define FRAME_PER_SPAWN 5
#define FRAME_PER_MOVE 2
#define MAX_BONE 6

uint8_t frameMoveCount = 0;
uint8_t frameSpawnCount = 0;
uint8_t boneX = 150;
uint8_t boneY = 120;

metasprite_t* boneTable[MAX_BONE];

unsigned char boneTile[] =
{
  0x00,0x66,0x66,0xFF,0x7E,0xFF,0x18,0x7E,
  0x00,0x18,0x18,0x3C,0x18,0x3C,0x18,0x3C,

  0x18,0x3C,0x18,0x3C,0x18,0x3C,0x00,0x18,
  0x18,0x7E,0x7E,0xFF,0x66,0xFF,0x00,0x66
};

const metasprite_t boneMS[] = {
    {.dy=0, .dx=0, .dtile=0, .props=0},    // Original tile
    {.dy=8, .dx=0, .dtile=1, .props=0},    // Mirrored tile
    METASPR_TERM
};

void throwBone(void){
  
  frameMoveCount++;
  frameSpawnCount++;

  if(frameSpawnCount > FRAME_PER_SPAWN){

    frameSpawnCount = 0;

  }
  if(frameMoveCount > FRAME_PER_MOVE){

    boneX--;
    frameMoveCount = 0;
    
  }

  move_metasprite_ex(boneMS,4,0,4,boneX,boneY);

}