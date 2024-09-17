#include <stdint.h>
#include <gb/metasprites.h>
#define boneTileBank 0

/* SGB palette entries. */
#define boneTileSGB0 0

/* CGB palette entries. */
#define boneTileCGB0 0
extern unsigned char boneTile[];
extern const metasprite_t boneMS[];
extern uint8_t boneX, boneY;
void setBone(void);
void throwBone(void);