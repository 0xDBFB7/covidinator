python2 lipidwrapper_py2.py\
    --surface_equation "z = math.sqrt((x*x)+(y*y)+(500*500))"\
    --min_x -500\
    --max_x 500\
    --min_y -500\
    --max_y 500\
    --step_x 100\
    --step_y 100\
    --lipid_pdb_filename lipid_example.pdb \
    --delete_clashing_lipids TRUE \
    --clash_cutoff 1.0 \
    --fill_holes TRUE \
    --fill_hole_exhaustiveness 10 \
    --output_directory output \
    --number_of_processors 16 \
    --clashing_potential_margin 15.0 \
    #--memory_optimization_factor 1


#python2 lipidwrapper_py2.py --surface_filename influenza_mesh.pdb --lipid_pdb_filename lipid_example.pdb --delete_clashing_lipids TRUE --fill_holes TRUE --clash_cutoff 1.0 --output_directory output --number_of_processors 24 --use_disk_instead_of_memory FALSE --show_grid_points TRUE --create_triangle_tcl_file TRUE --clashing_potential_margin 15.0 --memory_optimization_factor 1
