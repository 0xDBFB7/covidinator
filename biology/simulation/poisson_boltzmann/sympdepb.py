from sympde import grad, dot
from sympde import FunctionSpace
from sympde import TestFunction
from sympde import BilinearForm

V = FunctionSpace('V', ldim=2)
U = FunctionSpace('U', ldim=2)

v = TestFunction(V, name='v')
u = TestFunction(U, name='u')

a = BilinearForm((v,u), dot(grad(v), grad(u)) + v*u)
