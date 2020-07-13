using Test
import LinearAlgebra: norm
import PhysicalConstants.CODATA2014: Z_0

function dipole_E_field_at_point(point::Vector{Float64}, phase::Float64, lambda::Float64, dipole_length::Float64)
    # The real part of equation 3 from
    # Design Criteria for Near-Field-Focused Planar Arrays,
    # [Buffi 2012]
    R = norm(point)
    
    a = (Z_0 / (4 * lambda * R)) * l * excite_current * sin(2*pi*R/lambda)

end


println("result 1: ")


@test dipole_E_field_at_point() == 9


#https://github.com/rdeits/MeshCat.jl#contours
# using MeshCat
# vis = Visualizer()
# open(vis)
# meshcat?
# Visualize a mesh from the level set of a function
# using Meshing
# f = x -> sum(sin, 5 * x)
# sdf = SignedDistanceField(f, HyperRectangle(Vec(-1, -1, -1), Vec(2, 2, 2)))
# mesh = HomogenousMesh(sdf, MarchingTetrahedra())
# setobject!(vis, mesh,
#            MeshPhongMaterial(color=RGBA{Float32}(1, 0, 0, 0.5)))

# https://github.com/JuliaPlots/Makie.jl
# using LinearAlgebra
#
# using AbstractPlotting
#
# function test(x, y, z)
#     xy = [x, y, z]
#     ((xy') * Matrix(I, 3, 3) * xy) / 20
# end
# x = range(-2pi, stop = 2pi, length = 100)
# scene = Scene()
# # c[4] == fourth argument of the above plotting command
# c = contour!(scene, x, x, x, test, levels = 6, alpha = 0.3, transparency = true)[end]
# xm, ym, zm = minimum(scene_limits(scene))
# contour!(scene, x, x, map(v-> v[1, :, :], c[4]), transformation = (:xy, zm), linewidth = 2)
# heatmap!(scene, x, x, map(v-> v[:, 1, :], c[4]), transformation = (:xz, ym))
# contour!(scene, x, x, map(v-> v[:, :, 1], c[4]), fillrange = true, transformation = (:yz, xm))
# # reorder plots for transparency
# scene.plots[:] = scene.plots[[1, 3, 4, 5, 2]]
# scene
