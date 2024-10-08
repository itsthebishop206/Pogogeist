#include <gb/gb.h>
#include <gb/cgb.h>
#include <palette.h>
#include <gb/metasprites.h>
#include <bone.h>

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