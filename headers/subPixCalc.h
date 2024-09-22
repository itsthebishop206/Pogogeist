#include <stdlib.h>

void subPixCalc(int16_t *valueX, int16_t *valueY, int16_t speedX, int16_t speedY);
extern int16_t fractionX, fractionY;
extern int16_t* deltas;
extern void projSPC(uint16_t* x1, uint16_t x2, uint16_t* y1, uint16_t y2, int16_t* delX, int16_t* delY);
int16_t* projSPCAlpha(uint16_t* x1, uint16_t x2, uint16_t* y1, uint16_t y2);