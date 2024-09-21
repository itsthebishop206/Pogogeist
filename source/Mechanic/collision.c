#include <stdint.h>
#include <stdio.h>

// Check if two rectangles from x1,y1, and extending out w1, h2, 
//  overlap with another, x2,y2, and extending out w2, h2
uint8_t collisionCheck(uint8_t x1, uint8_t y1, uint8_t w1, uint8_t h1, uint8_t x2, uint8_t y2, uint8_t w2, uint8_t h2) {

	if ((x1 < (x2+w2)) && ((x1+w1) > x2) && (y1 < (h2+y2)) && ((y1+h1) > y2)) {
		
		return 1;
	
	} else {
		
		return 0;
	
	}

}