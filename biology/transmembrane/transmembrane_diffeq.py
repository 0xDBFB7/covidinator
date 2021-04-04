from sympy import *
x, y, z = symbols('x y z')
init_printing()
expr = exp(x*y*z)
deriv = Derivative(expr, x, y, y, z, 4)
pprint(deriv)
