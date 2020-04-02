#include "../common/common.h"
#include <stdio.h>

__global__ void helloFromGPU()
{
    printf("Hello World from GPU!\n");
}

int main(int argc, char **argv)
{
    printf("Hello World from CPU!\n");

    helloFromGPU<<<1, 10>>>();
    // device code will be executed
    CHECK(cudaDeviceSynchronize());
    return 0;
}