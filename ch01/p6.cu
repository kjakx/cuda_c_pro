#include "../common/common.h"
#include <stdio.h>

__global__ void helloFromGPU()
{
    // a thread index threadIdx.x is assigned to each thread in karnel
    if (threadIdx.x == 5)
    {
        printf("Hello World from GPU thread %d!\n", threadIdx.x);
    }
}

int main(int argc, char **argv)
{
    printf("Hello World from CPU!\n");

    helloFromGPU<<<1, 10>>>();
    CHECK(cudaDeviceSynchronize());
    return 0;
}
