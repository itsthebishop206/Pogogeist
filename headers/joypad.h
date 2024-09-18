#include <stdint.h>

extern uint8_t pcFacing;
extern uint8_t joypadCurrent, joypadPast;
extern void joypadMgr(void);
#define PIXEL_SHIFT 8