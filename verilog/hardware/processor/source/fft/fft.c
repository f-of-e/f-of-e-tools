#include <stdio.h>
#include <math.h>
#include <complex.h>
#include "bsort.h"
//#include "sf-types.h"
#include <stdlib.h>
#include <stdbool.h>

double PI = 3.141592653589793238;
int MAX = 4;

void _fft(complex double buf1[], complex double out[], int step)
{
    if (step < MAX)
    {
        _fft(out, buf1, step * 2);
        _fft(out + step, buf1 + step, step * 2);
        for (int i = 0; i < MAX; i += 2 * step)
        {
            complex double t = (cos(PI * i/MAX) -I*sin(PI*i/MAX)) * out[i + step];
            buf1[i / 2]     = out[i] + t;
            buf1[(i + MAX)/2] = out[i] - t;
        }
    }
}

void fft(complex double buf1[])
{
    complex double out[MAX];
    for (int i = 0; i < MAX; i++) out[i] = buf1[i];

    return _fft(buf1, out, 1);
}

void ifft(complex double buf[])
{
    // conjugate the complex numbers
    for(int i=0; i<MAX ;i++)
    {
        buf[i] = conj(buf[i]);

    }
    // forward fft
    fft(buf);
 
    // conjugate the complex numbers again
    for(int i=0; i<MAX ;i++)
    {
        buf[i] = conj(buf[i]);
        buf[i] /= MAX;

    }
}

#define ULP_N 4

bool nearlyequal(complex double a, complex double b)
{
  double diff = pow((pow(creal(a-b),2) + pow(cimag(a-b),2)),0.5);
  double mag = (pow((pow(creal(a),2) + pow(cimag(a),2)),0.5) + pow((pow(creal(b),2) + pow(cimag(b),2)),0.5))/2;
  return diff <= (mag * 1e-1 * (1ull << ULP_N));
}

void run()
{
    complex double buf[MAX];
    buf[0] = 1;
    buf[1] = 0;
    buf[2] = -1;
    buf[3] = 1;
    /*
    for(int i=0; i<MAX ;i++)
    {
        buf[i] = rand( )% 100 +I*(rand( )% 100);
    }
     */
    complex double data[MAX]; // Initialise data array
    // complex double fft_data[MAX];
    
    for(int i=0; i<MAX ;i++)
    {
        data[i] = buf[i];
    }
    fft(buf); // Compute FFT
    /*
    //buf is now fft data
    for(int i=0; i<MAX ;i++)
    {
        fft_data[i] = buf[i];
    }
     */
    
    //complex double ifft_data[MAX]; // Initialise iFFT data array
    ifft(buf);
    
    bool Equiv = true;
    for(int i = 0; i< MAX; i++)
    {
        if (nearlyequal(data[i], buf[i]) != true)
        {
            Equiv = false;
            break;
        }
    }
    
    if (Equiv)
    {
        *gDebugLedsMemoryMappedRegister = 0xFF;
    }
     

}

int main()
{
    *gDebugLedsMemoryMappedRegister = 0x00;
    run();
    return 0;
}


