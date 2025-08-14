#include <stdint.h>
#include <math.h>
#include <limits.h>
#include <float.h>
#include "signalprocessing.h"

#define a 0.25 
#define NUM_SAMPLES 25

void sig_proc(float fs[], float fssp[]) {
    
    float fslpf[NUM_SAMPLES] = {0};

    lpf(fs, fslpf);
    derivative(fslpf, fssp);
}

void lpf(float fs[], float fslpf[]) {
    fslpf[0] = fs[0];

    for(int i = 1; i < NUM_SAMPLES; i++) {
         fslpf[i] = (float)a * fs[i] + (float)(1-a) * fslpf[i-1];
    }
}

void derivative(float fslpf[], float fssp[]) {
    for (int i = 0; i < NUM_SAMPLES; i++) {
        if (i == 0) {
            fssp[i] = fslpf[i+1] - fslpf[i];
        } else if (i == NUM_SAMPLES - 1) {
            fssp[i] = fslpf[i] - fslpf[i-1];
        } else {
            fssp[i] = (fslpf[i+1] - fslpf[i-1]) / (float)2.0;
        }
    }
}

int condenser(float fssp[]) {

    int imax = INT_MIN;
    int imin = INT_MAX;
    float max = FLT_MIN;
    float min = FLT_MAX;   

    

    for(int i = 0; i < NUM_SAMPLES; i++) {
        if(fssp[i] > max) { 
            max = fssp[i];
            imax = i;
        }
        if(fssp[i] < min) { 
            min = fssp[i];
            imin = i;
        }
    }

    float amplitude = max - min;

    if(amplitude < 5) {
        return 0;
    }
    else if(imax < imin) { 
        return -1;
    }
    else {
        return 1;
    }

    return 0;
}

State cap_decision(float fssp[], State current) {
    int output = condenser(fssp);

    if(current == init && (output == 0 || output == -1)) {
        return init;
    }
    else if(current == init && output == 1) {
        return high;
    }
    
    switch(current) {
        case init:
            if(output == 0 || output == -1) {
                return init;
            }
            else return high;
            
        case high:
            if(output == 0) {
                return init;
            }
            else if(output == -1) {
                return low;
            }
            else return high;
        
        case low:
            if(output == 1) return init;
            else if(output == 0) return done;
            else return low;

        default: return init;
    }

}

