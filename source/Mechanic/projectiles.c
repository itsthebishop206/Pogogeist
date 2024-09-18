#include <gb/gb.h>
#include <stdint.h>
#include <bone.h>

#define FRAME_PER_SPAWN 5
#define FRAME_PER_MOVE 2
#define MAX_BONE 6

uint8_t frameMoveCount = 0;
uint8_t frameSpawnCount = 0;
uint8_t boneX = 150;
uint8_t boneY = 120;

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

  //move_metasprite_ex(boneMS,4,0,4,boneX,boneY);

}