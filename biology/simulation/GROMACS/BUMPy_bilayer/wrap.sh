
python3 bumpy.py -f bilayer.pdb -o membrane.pdb -n index.ndx -p topol.top -s sphere -z 0 -g r_sphere:100


# There appears to be a bug in bumpy with Z values > 100
# bumpy.py:161: RuntimeWarning: Mean of empty slice.
#   self.coords[:, 0:2] -= self.coords.mean(axis=0)[0:2]
# /home/arthurdent/Programs/miniconda/lib/python3.7/site-packages/numpy/core/_methods.py:154: RuntimeWarning: invalid value encountered in true_divide
#   ret, rcount, out=ret, casting='unsafe', subok=False)
# []
# []
# Traceback (most recent call last):
#   File "bumpy.py", line 1500, in <module>
#     main()
#   File "bumpy.py", line 1464, in main
#     shape = shape_tobuild.gen_shape(template_bilayer, zo, **geometric_args)
#   File "bumpy.py", line 934, in gen_shape
#     top_half = shapes.semisphere.gen_shape(template_bilayer, zo, r_sphere, False)
#   File "bumpy.py", line 782, in gen_shape
#     bot_leaflet.scale_flat_to_spherical(r_sphere, r_sphere - zo[0])
#   File "bumpy.py", line 260, in scale_flat_to_spherical
#     print(phi_sections.max())
#   File "/home/arthurdent/Programs/miniconda/lib/python3.7/site-packages/numpy/core/_methods.py", line 30, in _amax
#     return umr_maximum(a, axis, None, out, keepdims, initial, where)
# ValueError: zero-size array to reduction operation maximum which has no identity
