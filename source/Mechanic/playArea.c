#include <stdlib.h>
#include <stdint.h>
#include <playArea.h>

uint8_t active = 0;

uint8_t isActive(uint8_t x, uint8_t y){

    if((x > SCREEN_LEFT_BOUND) && (x < SCREEN_RIGHT_BOUND) && (y > CEILING) && (y < FLOOR)){

        active = 1;
        
    } else{
        
        active = 0;

    }

    return active;
}