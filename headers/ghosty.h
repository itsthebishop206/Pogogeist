#include <stdint.h>
#include <gbdk/platform.h>
#include <gb/metasprites.h>

#define ghostyTilesBank 0
#define GHOSTY_W 10
#define GHOSTY_H 10

extern unsigned char ghostyTiles[];
extern int16_t ghostyX, ghostyY, ghostySpeedX, ghostySpeedY;
extern int16_t *pghostyX, *pghostyY;
extern const metasprite_t ghostyMS[];

/* End of GHOSTY.H */
