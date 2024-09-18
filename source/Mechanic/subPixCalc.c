#pragma disable_warning 115
#include <stdlib.h>
#include <gb/gb.h>
#include <joypad.h>
#include <subPixCalc.h>
#include <stdio.h>

#pragma region notes
// so, i want each sprite to have their own x and y values
// i want to have different functions per sprite that calculate each sprite's x and y values
// i want these different functions to all be able to use the subPixCalc() function
// i want the sprite's movement function to pass subPixCalc() their own speed value which is used in place of speedX
// then i want subPixCalc() to return valueX and valueY
// then, i want to set the sprite's X and Y values to the returned variables valueX and valueY
// i want to be able to call this each frame, so i want valueX, valueY, speedX and speedY to keep their value between function calls
#pragma endregion

void subPixCalc(int16_t *valueX, int16_t *valueY, int16_t speedX, int16_t speedY){
    
    static int16_t fractionX, fractionY = 0;
    fractionX += speedX; // adds speed (which we have as 8 or -8) to the fractional value each frame. we are gaining "8" speed a frame, which becomes 0.03 pixels per frame
    fractionY += speedY;
    // *valueX dereferences the pointer
    while(fractionX >= (1<<PIXEL_SHIFT)){ // shifting the bits left by 8 multiplies by 2^8 (256), so as long as fractionX is greater than or equal to 256, move object by one pixel
        *valueX += 1;
        fractionX -= (1<<PIXEL_SHIFT); // subtracts 256, which resets the fractional part to 0
    }// however, objectSpeed has been accumulating this entire time!! so eventually when you add speed to fraction it is greater than 256 which results in movement that is faster than one pixel per frame
    // as of writing this i do not have a max speed set for X so it just increases infinitely. dont forget to do that
    while(fractionX <= -(1<<PIXEL_SHIFT)){
        *valueX -=1;
        fractionX += (1<<PIXEL_SHIFT);
    }

    while(fractionY >= (1<<PIXEL_SHIFT)){
        *valueY += 1;
        fractionY -= (1<<PIXEL_SHIFT);
    } 

    while(fractionY <= -(1<<PIXEL_SHIFT)){
        *valueY -=1;
        fractionY += (1<<PIXEL_SHIFT);
    }
}