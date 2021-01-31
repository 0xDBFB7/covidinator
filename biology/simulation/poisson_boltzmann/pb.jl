
#=

don't want to fall into the same trap as with JAMES!

APBE and Pygpe both are more suited for atom-structure-like sims,
don't seem to support simple dielectrics?
fenics requires it in a "weak form",



=#

using PhysicalConstants.CODATA2018

VacuumElectricPermittivity

Nx, Ny, Nz = 100

A = zeros(Nx,Ny,Nz)

dielectric = ones(Nx,Ny,Nz)
charge_distribution = zeros(Nx,Ny,Nz)

kappa_external =


function poisson_boltzmann()
    for x = 1:Nx-2
        for y = 1:Nx-2
            for z = 1:Nx-2
        (2.0 / )
        #wait, julia is 1 indexed?
        # wtf?
        a1 =
    end


end
