GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"


#insane -x 10 -y 10 -z 10 -pbc cubic  -o waterbox.pdb

rm ./output/s3/*

#dodecahedron
#cubic

$GMX_DIR/gmx_mpi editconf -d 20 -f ./output/s2/minimized_bilayer.pdb -o ./output/s3/centered.gro -bt cubic

#$GMX_DIR/gmx_mpi solvate -cs polarize-water.gro -cp ./output/s3/centered.pdb -p output/topol.top -o output/s3/solvated.pdb -shell 30

$GMX_DIR/gmx_mpi solvate -cs water.gro -cp ./output/s3/centered.gro -p output/topol.top -o output/s3/solvated.gro -shell 15

$GMX_DIR/gmx_mpi solvate -cs water_name_2.gro -cp ./output/s3/solvated.gro -p output/topol.top -o output/s3/solvated.gro -shell 2


$GMX_DIR/gmx_mpi grompp -f s2_minimize_settings.mdp -r ./output/s3/solvated.gro -c ./output/s3/solvated.gro -p output/topol.top -o ./output/s3/solvated_bilayer.tpr

#$GMX_DIR/gmx_mpi trjconv -pbc mol -ur compact

#specify bath coupling
