#include "sf-types.h"
#include "bsort.h"
#include "bsort-input.h"
#include "string.h"


void run()
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
                    if (bsort_input_copied[i] < bsort_input_copied[i+1])
                    {
                            /*              swap            */
                        bsort_input_copied[i] ^= bsort_input_copied[i+1];
                        bsort_input_copied[i+1] ^= bsort_input_copied[i];
                        bsort_input_copied[i] ^= bsort_input_copied[i+1];
                        
                    }
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
	if (bsort_input_copied[0] == 0x20 && bsort_input_copied[12] == 0x2c && \
			bsort_input_copied[24] == 0x65 && bsort_input_copied[30] == 0x68 && \
			bsort_input_copied[45] == 0x72 && bsort_input_copied[58] == 0x77)
        *gDebugLedsMemoryMappedRegister = 0xFF;
	else
        *gDebugLedsMemoryMappedRegister = 0x00;
}

int main(void)
{
        while (1)
        {
                *gDebugLedsMemoryMappedRegister = 0x00;
                run();
                run();
        }
        return 0;
}
