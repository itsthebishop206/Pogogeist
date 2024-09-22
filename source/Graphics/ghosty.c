#include <stdint.h>
#include <gbdk/platform.h>
#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <ghosty.h>
#include <palette.h>
#include <gamechar.h>
#include <projectiles.h>
#include <playArea.h>
#include <joypad.h>

extern struct gameChar* PC;

unsigned char ghostyTiles[] =
{
  0x00,0x01,0x01,0x02,0x03,0x04,0x07,0x08,
  0x0F,0x10,0x0F,0x10,0x0F,0x10,0x0F,0x10,
  0x00,0xE0,0xE0,0x10,0xF0,0x08,0xF8,0x04,
  0xFE,0x00,0xFE,0x62,0xFE,0xF6,0xFE,0xF6,
  0x0F,0x10,0x0F,0x10,0x0F,0x10,0x1F,0x20,
  0x3F,0xC0,0x0F,0x70,0x00,0x1F,0x00,0x00,
  0xFE,0x62,0xFE,0x00,0xFE,0x00,0xFC,0x02,
  0xE0,0x1C,0x00,0xE0,0x00,0x00,0x00,0x00
};

const metasprite_t ghostyMS[] = {
    {.dy=-8, .dx=-8, .dtile=0, .props=0},
    {.dy=0, .dx=8, .dtile=1, .props=0},
    {.dy=8, .dx=-8, .dtile=2, .props=0},
    {.dy=0, .dx=8, .dtile=3, .props=0},
	METASPR_TERM
};

void updateGhost(void){

  // since this function is changing the X and Y values, we need a pointer to those values
  // this is because standard c can only return one variable per function, so return will not be useful in this case
  // we do not need the same for speed, because it is only using those for calculation, not changing them
  // this is not written as subPixCalc(*pghostyX,*pghostyY,ghostySpeedX,ghostySpeedY);
  // because the inclusion of the asterisks tells the program to dereference the pointers
  // since we want to pass the function the pointers themselves, do not dereference them yet
  // remember, these already point to the addresses
  // static int16_t *pghostyX = &ghostyX;
  // static int16_t *pghostyY = &ghostyY;    
  subPixCalc(pghostyX,pghostyY,ghostySpeedX,ghostySpeedY);

  if(ghostyY <= CEILING){

      if(ghostySpeedY < 0){
          
          //gravity -= SPD_CHANGE;
          ghostyY = CEILING;
          ghostySpeedY = ghostySpeedY >> 1;
          ghostySpeedY = -ghostySpeedY;
      }
  } else if (ghostyY >= FLOOR){
      
      //ghostySpeedY = 0;
      ghostyY = FLOOR;
      //gravity = 0;
      ghostySpeedY = ghostySpeedY >> 1;
      ghostySpeedY = -ghostySpeedY;
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

void ghostCollision(void){

  for(uint8_t b = 0; b < MAX_BONE; b++){
          
    if(checkCollideGhostProj(&PC.x,&PC.y,&PC.w,&PC.h,&bones[b].x,&bones[b].y,&bones[b].w,&bones[b].h)){
        
        if(&PC.x < &bones[b].x && &PC.spdX > 0){

        ghostySpeedX = ghostySpeedX >> 1;
        ghostySpeedX = -ghostySpeedX;
      }
    }              
  }
}