#pragma disable_warning 115
#include <stdlib.h>
#include <gb/gb.h>
#include <joypad.h>
#include <subPixCalc.h>
#include <stdio.h>
#include <projectiles.h>
#include <bone.h>
#include <gb/metasprites.h>

#pragma region notes
// so, i want each sprite to have their own x and y values
// i want to have different functions per sprite that calculate each sprite's x and y values
// i want these different functions to all be able to use the subPixCalc() function
// i want the sprite's movement function to pass subPixCalc() their own speed value which is used in place of speedX
// then i want subPixCalc() to return valueX and valueY
// then, i want to set the sprite's X and Y values to the returned variables valueX and valueY
// i want to be able to call this each frame, so i want valueX, valueY, speedX and speedY to keep their value between function calls

// simply put, the way this function works is:
// it is passed pointers to x and y coords
// it is passed speed values that are being updated every frame
// the function updates the x and y coords that are being pointed to

#pragma endregion

// this one is for speed values that are constantly changing
void subPixCalc(int16_t *valueX, int16_t *valueY, int16_t speedX, int16_t speedY){
    
    static int16_t fractionX, fractionY = 0;
    fractionX += speedX; // adds speed (which we have as 8 or -8) to the fractional value each frame. we are gaining "8" speed a frame, which becomes 0.03 pixels per frame
    fractionY += speedY;
    // *valueX dereferences the pointer
    while(fractionX >= (1<<PIXEL_SHIFT)){
    // shifting the bits left by 8 multiplies by 2^8 (256)
    // as long as fractionX is greater than or equal to 256, move object by one pixel
        *valueX += 1;
        fractionX -= (1<<PIXEL_SHIFT); // subtracts 256, which resets the fractional part to 0
    }// however, objectSpeed has been accumulating this entire time!! so eventually when you add speed to fraction it is greater than 256 which results in movement that is faster than one pixel per frame
    // as of writing this i do not have a max speed set for X so it just increases infinitely. dont forget to do that
    while(fractionX <= -(1<<PIXEL_SHIFT)){
        *valueX -=1;
        fractionX += (1<<PIXEL_SHIFT);
    }

    while(fractionY >= (1<<PIXEL_SHIFT)){
        *valueY += 1;
        fractionY -= (1<<PIXEL_SHIFT);
    } 

    while(fractionY <= -(1<<PIXEL_SHIFT)){
        *valueY -=1;
        fractionY += (1<<PIXEL_SHIFT);
    }
}

uint16_t newton(uint16_t n){

    int16_t result = n;
    int16_t last = 0;
// use a while loop since the values are not reset between functions
    while(result != last){
// f(x) = x^2 - n
// (x^2 - n)/2x
// simplifies to (x+(n/x))/2
    last = result;
    result = (last+(n/last))/2;
    }

    return result;

#pragma region newtonNotes
// --- NEWTONS METHOD NOTES ---

// f(x) = x^2 - n
// n is the variable we are passing in
// basically it's trying to get x as close to the square root of n as possible
// it does this by trying to get the result of the equation as close to 0 as possible
// ... because if the result is zero, x^2 = n, meaning we know the square root of n

// derivative = as x changes in (f(x) = x^2 - n), the derivative measures how it changes (increases/decreases)
// (basically the derivative of a function measures the slope of the function at a single point)
// we need to find the derivative of f(x) to understand how our approximations are changing
// the formula for finding derivatives is called the Power Rule
// (d/dx)x^k = k(x^(k-1)) "differentiate x^k with respect to x" basically d/dx just signifies you are finding the derivative
// so, for our function (x^2 - n), the derivative is 2x

// to find the root of f(x) ("to find when f(x) = 0") use this iterative formula
// (x^2 -n)/2x
// newx = (oldX^2 - n)/2oldX
// this iteration continues until the difference between guesses is smaller than a chosen value
#pragma endregion
}

int16_t* createDeltasArray(int size)
{
    // Allocate memory for the array
    int* deltas = (int*)malloc(size * sizeof(int));

    // Check if memory allocation was successful
    if (deltas == NULL) {
        printf("Memory allocation failed!\n");
        exit(1); // Exit the program if allocation fails
    }

    // Initialize the array with example values
    for (int i = 0; i < size; i++) {
        deltas[i] = i * 2;
    }

    // Return the pointer to the allocated array
    return deltas;
}

// this one is for constant speed values
//bones, ghost, bones, ghost
void projSPC(uint16_t* x1, uint16_t x2, uint16_t* y1, uint16_t y2, int16_t* delX, int16_t* delY){

    int16_t pPPF = 1;
    int16_t slp = 0;
    *delX = 1;
    *delY = 1;

    // make sure we can't divide by zero
        if(*x1 != x2){
            // y = mx+b
            // m = (*y2-y1)/(*x2-x1)
            slp =  (*y1 - (y2)) / (*x1 - (x2)) << PIXEL_SHIFT;
            //fslp = (y1 - (*y2)) % (x1 - (*x2)) >> PIXEL_SHIFT;
        } else{
            *x1 += 1;
        }

    // "^" is a bitwise operation in C. does not work for exponents
    // calculate xy deltas pPPF = projectile pixel per frame
    *delX = (pPPF / newton(1+slp*slp));
    *delY = slp*(*delX);

    // // increment bone xy values by delta
    // x1 += deltaX;
    // y1 += deltaY;
    // for now im ignoring fslp. im tired boss
}

int16_t* projSPCAlpha(uint16_t* x1, uint16_t x2, uint16_t* y1, uint16_t y2){

    int16_t pPPF = 1;
    int16_t slp = 0;

    // make sure we can't divide by zero
        if(*x1 != x2){
            // y = mx+b
            // m = (*y2-y1)/(*x2-x1)
            slp =  (*y1 - (y2)) / (*x1 - (x2)) << PIXEL_SHIFT;
            //fslp = (y1 - (*y2)) % (x1 - (*x2)) >> PIXEL_SHIFT;
        } else{
            *x1 += 1;
        }

    // "^" is a bitwise operation in C. does not work for exponents
    // calculate xy deltas pPPF = projectile pixel per frame
    int16_t deltaX = (pPPF / newton(1+slp*slp));
    int16_t deltaY = slp*(deltaX);
    int16_t deltas[2] = {deltaX,deltaY};
    return deltas;

    // // increment bone xy values by delta
    // x1 += deltaX;
    // y1 += deltaY;
    // for now im ignoring fslp. im tired boss
}