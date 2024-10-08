#include <stdint.h>
#include <gbdk/platform.h>
#include <gb/metasprites.h>
#include <gamechar.h>

#define ghostyTilesBank 0
#define GHOSTY_W 10
#define GHOSTY_H 10

extern unsigned char ghostyTiles[];
static int16_t ghostyX, ghostyY, ghostySpeedX, ghostySpeedY;
static int16_t *pghostyX, *pghostyY;
extern const metasprite_t ghostyMS[];
extern gameChar PC;
extern void ghostCollision(void);
extern void updateGhost(void);

/* End of GHOSTY.H */
