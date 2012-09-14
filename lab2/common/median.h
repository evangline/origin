#ifndef _MEDIAN_H
#define _MEDIAN_H
#include <stdint.h>
uint8_t getMedian(uint8_t *data, int len);
void medianFilter(uint8_t *in, uint8_t *out, int radius, int width, int height);
#endif
