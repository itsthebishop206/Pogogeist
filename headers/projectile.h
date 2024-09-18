#include <stdint.h>

extern uint8_t prX, prY, prSpd;
void initBoneTable(void);
void throwBone(void);

#define FRAME_PER_SPAWN 6
#define FRAME_PER_MOVE 2
#define MAX_BONE 6