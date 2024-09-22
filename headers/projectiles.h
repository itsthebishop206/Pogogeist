#include <stdint.h>
#include <gb/metasprites.h>

// this does not need the external keyword
// extern is only for variables, not defining types
// so a specific instance (or array as you see below) needs the keyword, but not the definition
typedef struct{ // typedef lets you define your own identifiers. i am defining "Projectile"

    int16_t x;
    int16_t y;
    //int16_t speed;
    int16_t deltaX;
    int16_t deltaY;
    int16_t spdX;
    int16_t spdY;
    uint8_t w;
    uint8_t h;
    //int16_t deltaF;
    uint8_t active;
    uint8_t fired;
    uint16_t OAMindex;
    const metasprite_t* metasprite;

} Projectile;

extern Projectile bones[];
// this is set to zero in gameFirstLoad
static uint8_t activeBones;
// this is set to zero in gameFirstLoad
static uint8_t boneCounter;
static uint8_t frameCounter;

extern int16_t prX, prY;
extern int16_t prSpeed;

void initBoneTable(void);
void throwBone(uint8_t b);
void updateBone(void);
extern uint8_t checkCollideGhostProj(gameChar* x1, gameChar* y1, gameChar* w1, gameChar* h1, Projectile* x2, Projectile* y2, Projectile* w2, Projectile* h2);

#define FRAME_PER_SPAWN 75
#define MAX_BONE 6
#define BONE_SPD 15