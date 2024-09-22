#include <stdint.h>
#include <stdio.h>
#include <ghosty.h>
#include <projectiles.h>
#include <gamechar.h>
#include <ghosty.h>

uint8_t checkCollideGhostProj(gameChar* x1, gameChar* y1, gameChar* w1, gameChar* h1, Projectile* x2, Projectile* y2, Projectile* w2, Projectile* h2){
    return (x1->x >= x2->x && x1->x <= x2->x + w2->w) && (y1->y >= y2->y && y2->y <= y2->y + y2->h) || (x2->x >= x1->x && x2->x <= x1->x + w1->w) && (y2->y >= y1->y && y1->y <= y1->y + y1->h);
}