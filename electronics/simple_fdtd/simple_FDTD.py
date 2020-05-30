
import fdtd




fdtd.set_backend('numpy')


grid.run(50, progress_bar=True)

print(grid.E[0:10, :, :])


grid.visualize(z=0)
