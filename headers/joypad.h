#include <stdint.h>

extern uint8_t joypadCurrent, joypadPast, pcFacing, gravity;
extern uint16_t actions;
void setJoypad(void);
extern int16_t joypadMgr(void);