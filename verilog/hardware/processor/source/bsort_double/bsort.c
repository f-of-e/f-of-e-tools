#include "sf-types.h"
#include "bsort.h"
#include "bsort-input.h"
#include "string.h"

void run(void)
{
        int i;
        int maxindex = bsort_input_len - 1;

        uchar bsort_input_copied[bsort_input_len];
        memcpy(&bsort_input_copied, &bsort_input, bsort_input_len);

        while (maxindex > 0)
        {
                for (i = 0; i < maxindex; i++)
                {
                        if (bsort_input_copied[i] > bsort_input_copied[i+1])
                        {
                                /*              swap            */
                                bsort_input_copied[i] ^= bsort_input_copied[i+1];
                                bsort_input_copied[i+1] ^= bsort_input_copied[i];
                                bsort_input_copied[i] ^= bsort_input_copied[i+1];
                        }
                }

                maxindex--;
        }

        while (maxindex > 0)
        {
                for (i = 0; i < maxindex; i++)
                {
                        if (bsort_input_copied[i] < bsort_input_copied[i+1])
                        {
                                /*              swap            */
                                bsort_input_copied[i] ^= bsort_input_copied[i+1];
                                bsort_input_copied[i+1] ^= bsort_input_copied[i];
                                bsort_input_copied[i] ^= bsort_input_copied[i+1];
                        }
                }

                maxindex--;
        }
}

int main(void)
{
        while (1)
        {
                *gDebugLedsMemoryMappedRegister = 0xFF;
                run();
                *gDebugLedsMemoryMappedRegister = 0x00;
                run();
        }
        return 0;
}
