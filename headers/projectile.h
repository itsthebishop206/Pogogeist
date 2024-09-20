#include <stdint.h>
#include <gb/metasprites.h>

// this does not need the external keyword
// extern is only for variables, not defining types
// so a specific instance (or array as you see below) needs the keyword, but not the definition
typedef struct{ // typedef lets you define your own identifiers. i am defining "Projectile"

    int16_t x;
    int16_t y;
    int16_t speed;
    uint8_t prActive;
    const metasprite_t* metasprite;

} Projectile;

extern Projectile bones[];
// this is set to zero in gameFirstLoad
extern uint8_t activeBones;
// this is set to zero in gameFirstLoad
extern uint8_t boneCounter;

extern int16_t prX, prY;
extern int16_t prSpeed;

void initBoneTable(void);
void throwBone(void);
void updateBone(void);

#define FRAME_PER_SPAWN 6
#define FRAME_PER_MOVE 2
#define MAX_BONE 6