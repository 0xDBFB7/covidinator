
#include <cmath>
#include "dbg.h"

//g++ pb.cpp -o pb -fopenmp && ./pb


#define base_type double
//


const int n = 100;
const int ncubed = (n*n*n);

int idx(int x, int y, int z){
  return ((n*n*z) + (n*y) + x);
}

base_type mesh[ncubed];
base_type eps[ncubed];
base_type pot[ncubed];
base_type kappa_squared[ncubed];

int main(){

    #pragma omp parallel
    {
        for(int iter = 0; iter < 1000; iter++){
            #pragma omp for
            for(int x = 1; x < ncubed-1; x++){
                for(int y = 1; y < ncubed-1; y++){
                    for(int z = 1; z < ncubed-1; z++){
                        base_type value = 0;
                        value += -1.0*eps[x-1][y][z] * (pot[x-1][y][z]-pot[idx(x,y,z)]);
                        value += -1.0*eps[idx(x,y,z)] * (pot[x+1][y][z]-pot[idx(x,y,z)]);
                        value += -1.0*eps[x][y-1][z] * (pot[x][y-1][z]-pot[idx(x,y,z)]);
                        value += -1.0*eps[idx(x,y,z)] * (pot[x][y+1][z]-pot[idx(x,y,z)]);
                        value += -1.0*eps[x][y][z-1] * (pot[x][y][z-1]-pot[idx(x,y,z)]);
                        value += -1.0*eps[idx(x,y,z)] * (pot[x][y][z+1]-pot[idx(x,y,z)];
                        value -= eps[idx(x,y,z)]; //space charge term
                        // value -= eps[idx(x,y,z)]*kappa_squared[idx(x,y,z)]*pot[idx(x,y,z)];

                        value /= 6;
                        pot[idx(x,y,z)] = value;
                    }
                }
            }

        }
        #pragma omp barrier
        dbg(pot[0][0][0]);
    }
}



//coefficients may not be right
//compare to Born
