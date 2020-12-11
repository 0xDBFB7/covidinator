clear;

syms F(omega) c0 z t n(omega) nr(omega) lambda Z0
e_x = (F(omega)*exp(-1i*(omega/c0)*n(omega)*z)*exp(1i*omega*t))

W = (1/Z0) * nr(omega)*abs(F(omega))^2

xi = -e_x + lambda*W
grad_xi = functionalDerivative(xi,F)


isolate(grad_xi==0,F(omega))

%sol = isolate(grad_xi,F(omega))
%pretty(sol)

%Dx(omega) = diff(F(omega),omega);
%xSol = dsolve(grad_xi);


%Dx(omega) = diff(y(omega),omega);
%xSol = dsolve(eqn,[x(0) == 10, Dx(0) == 0]) c