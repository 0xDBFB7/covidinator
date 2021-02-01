
#include <cmath>
#include "dbg.h"
#include <stdint.h>
#include <fstream>

//g++ pb.cpp -o pb -fopenmp && ./pb


#define base_type double
//


const int n = 10;
const int ncubed = (n*n*n);

//tolerable even at 700. nice!

uint16_t idx(int x, int y, int z){
  return ((n*n*z) + (n*y) + x);
}

std::vector<base_type> mesh(ncubed);
std::vector<base_type> eps(ncubed);
std::vector<base_type> V(ncubed);
std::vector<base_type> V_new(ncubed);

std::vector<base_type> kappa_squared(ncubed);
std::vector<base_type> charge(ncubed);

double epsilon_0 = 8.85e-12;
double electron_charge = 1.602e-19;


int main(){

    std::fill(V.begin(), V.end(), 0);
    std::fill(V_new.begin(), V_new.end(), 0);
    std::fill(eps.begin(), eps.end(), 1);
    std::fill(charge.begin(), charge.end(), 0);

    charge[idx(n/2.0,n/2.0,n/2.0)] = electron_charge;

    // for(int i = 0; vector



    for(int iter = 0; iter < 5000; iter++){

        #pragma omp parallel
        {
            #pragma omp for
            for(int x = 1; x < n-1; x++){
                for(int y = 1; y < n-1; y++){
                    for(int z = 1; z < n-1; z++){
                        base_type value = 0;
                        value += 1.0*eps[idx(x-1,y,z)] * (V[idx(x-1,y,z)]);
                        value += 1.0*eps[idx(x,y,z)] * (V[idx(x+1,y,z)]);
                        value += 1.0*eps[idx(x,y-1,z)] * (V[idx(x,y-1,z)]);
                        value += 1.0*eps[idx(x,y,z)] * (V[idx(x,y+1,z)]);
                        value += 1.0*eps[idx(x,y,z-1)] * (V[idx(x,y,z-1)]);
                        value += 1.0*eps[idx(x,y,z)] * (V[idx(x,y,z+1)]);
                        value -= charge[idx(x,y,z)] / epsilon_0; //space charge term
                        // value -= eps[idx(x,y,z)]*kappa_squared[idx(x,y,z)]*V[idx(x,y,z)];

                        value /= 6.0;
                        V[idx(x,y,z)] = value;
                    }
                }
            }
        }
        #pragma omp barrier
        dbg(V[idx(0,0,0)]);
        std::cout << "test\n";
        // V.swap(V_new);
        // std::fill(V_new.begin(), V_new.end(), 0);
    }


    std::ofstream streams("out.raw", std::fstream::out | std::fstream::binary);
        streams.write(reinterpret_cast<const char*>(V.data()), (size_t)(sizeof(base_type) * V.size()));

}



//coefficients may not be right
//compare to Born
