#include <stdio.h>
#include <math.h>
#include <complex.h>
#include "bsort.h"
#include "sf-types.h"
#include <stdlib.h>
#include <stdbool.h>
#include <float.h>

double PI;
int MAX = 8;

void _fft(complex double buf1[], complex double out[], int n, int step)
{
    if (step < n)
    {
        _fft(out, buf1, n, step * 2);
        _fft(out + step, buf1 + step, n, step * 2);
        for (int i = 0; i < n; i += 2 * step)
        {
            complex double t = (cos(PI * i/n) -I*sin(PI*i/n)) * out[i + step];
            buf1[i / 2]     = out[i] + t;
            buf1[(i + n)/2] = out[i] - t;
        }
    }
}

void fft(complex double buf1[], int n)
{
    complex double out[n];
    for (int i = 0; i < n; i++) out[i] = buf1[i];

    return _fft(buf1, out, n, 1);
}

void ifft(complex double ifft_data[], complex double fft_data[])
{
    // conjugate the complex numbers
    for(int i=0; i<MAX ;i++)
    {
        ifft_data[i] = conj(fft_data[i]);

    }
    // forward fft
    fft(ifft_data, MAX);
 
    // conjugate the complex numbers again
    for(int i=0; i<MAX ;i++)
    {
        ifft_data[i] = conj(ifft_data[i]);
        ifft_data[i] /= MAX;

    }
}
#define ULP_N 4

bool nearlyequal(complex double a, complex double b)
{
  double diff = pow((pow(creal(a-b),2) + pow(cimag(a-b),2)),0.5);
  double mag = (pow((pow(creal(a),2) + pow(cimag(a),2)),0.5) + pow((pow(creal(b),2) + pow(cimag(b),2)),0.5))/2;
  return diff <= (mag * DBL_EPSILON * (1ull << ULP_N));
}

void run()
{
    PI = atan2(1, 1) * 4;
    complex double buf[MAX];
    for(int i=0; i<MAX ;i++)
    {
        buf[i] = rand( )% 100 +I*(rand( )% 100);
    }

    complex double data[MAX]; // Initialise data array
    complex double fft_data[MAX];
    
    for(int i=0; i<MAX ;i++)
    {
        data[i] = buf[i];
    }
    fft(buf, MAX); // Compute FFT
    
    //buf is now fft data
    for(int i=0; i<MAX ;i++)
    {
        fft_data[i] = buf[i];
    }

    
    complex double ifft_data[MAX]; // Initialise iFFT data array
    ifft(ifft_data, fft_data);

    bool Equiv = true;
    for(int i = 0; i< MAX; i++)
    {
        if (nearlyequal(data[i], ifft_data[i]) != true)
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


