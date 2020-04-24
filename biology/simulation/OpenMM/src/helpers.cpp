
#include "helpers.hpp"

std::vector<OpenMM::Vec3> import_PDB(std::string filename){
    std::vector<OpenMM::Vec3> positions;

    std::fstream fs;
    fs.open(filename, std::fstream::in);

    PDB record;


    while (fs >> record) {
        if((record.type() == PDB::ATOM || record.type() == PDB::HETATM)) {
            OpenMM::Vec3 position(
                record.atom.xyz[X] / 10.0,
                record.atom.xyz[Y] / 10.0,
                record.atom.xyz[Z] / 10.0
            );
            positions.push_back(position);
        }
    }
    std::cout << "Imported " << positions.size() << " particles." << "\n";
    return positions;
}

void dump_to_xyz_file(std::string filename, int iteration, const OpenMM::State& state){
    //visualize with Chimera: under MD / Ensemble analysis, MD Movie, set XYZ.

    // std::vector<char> tag_atom_lookup = {'C','O'};

    std::fstream fs;
    filename += std::to_string(iteration);
    filename += ".xyz";
    fs.open(filename, std::fstream::out);

    const std::vector<OpenMM::Vec3>& positions = state.getPositions();

    fs << (int)positions.size() << "\n";
    // fs << time << "\n";
    fs << "\n"; // description on second line


    for (int a = 0; a < (int)positions.size(); a++){
        fs << "O" <<
            " " << positions[a][X]*10.0 << // nm -> angstrom conversion factor
            " " << positions[a][Y]*10.0 <<
            " " << positions[a][Z]*10.0 << "\n";
    }
    fs.close();
}


// // Handy homebrew PDB writer for quick-and-dirty trajectory output.
// void writePdbFrame(int frameNum, const OpenMM::State& state)
// {
//     std::fstream fs;
//     filename += std::to_string(iteration);
//     filename += ".xyz";
//     // Reference atomic positions in the OpenMM State.
//     const std::vector<OpenMM::Vec3>& posInNm = state.getPositions();
//
//     // Use PDB MODEL cards to number trajectory frames
//     printf("MODEL     %d\n", frameNum); // start of frame
//     for (int a = 0; a < (int)posInNm.size(); ++a)
//     {
//         printf("ATOM  %5d  AR   AR     1    ", a+1); // atom number
//         printf("%8.3f%8.3f%8.3f  1.00  0.00\n",      // coordinates
//             // "*10" converts nanometers to Angstroms
//             posInNm[a][0]*10, posInNm[a][1]*10, posInNm[a][2]*10);
//     }
//     printf("ENDMDL\n"); // end of frame
// }
