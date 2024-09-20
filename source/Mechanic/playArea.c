#include <stdlib.h>
#include <stdint.h>
#include <playArea.h>

uint8_t isActive(int16_t x, int16_t y){

    uint8_t active = 0;

    if((x > SCREEN_LEFT_BOUND) && (x < SCREEN_RIGHT_BOUND) && (y > CEILING) && (y < FLOOR)){

        active = 1;
        
    } else{
        
        active = 0;

    }

    return active;
}