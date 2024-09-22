#include <stdint.h>
#include <gb/metasprites.h>

typedef struct{ 

    int16_t x;
    int16_t y;
    int16_t deltaX;
    int16_t deltaY;
    int16_t spdX;
    int16_t spdY;
    uint8_t w;
    uint8_t h;
    uint16_t OAMindex;
    const metasprite_t* metasprite;

} gameChar;