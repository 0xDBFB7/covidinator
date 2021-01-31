

#define base_type double



base_type mesh[nx][ny][nz];
base_type eps[nx][ny][nz];
base_type pot[nx][ny][nz];
base_type kappa_squared[nx][ny][nz];


for(int x = 1; x < nx-1; x++){
    for(int y = 1; y < ny-1; y++){
        for(int z = 1; z < nz-1; z++){
            base_type value = 0;
            value += -1.0*eps[x-1][y][z] * (pot[x-1][y][z]-pot[x][y][z]);
            value += -1.0*eps[x][y][z] * (pot[x+1][y][z]-pot[x][y][z]);
            value += -1.0*eps[x][y-1][z] * (pot[x][y-1][z]-pot[x][y][z]);
            value += -1.0*eps[x][y][z] * (pot[x][y+1][z]-pot[x][y][z]);
            value += -1.0*eps[x][y][z-1] * (pot[x][y][z-1]-pot[x][y][z]);
            value += -1.0*eps[x][y][z] * (pot[x][y][z+1]-pot[x][y][z]);
            value += eps[x][y][z]*kappa_squared[x][y][z]*pot[x][y][z];
            
        }
    }
}



//coefficients may not be right
//compare to Born
