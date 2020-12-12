clear;

syms F(omega) G(omega) c0 z t n(omega) nr(omega) lambda Z0 eps_s eps_inf omega tau tau_f omega_res beta

G(omega) = 1/(omega_res^2 - (2*i*beta*omega) - omega^2)

n(omega) = sqrt(eps_inf + (eps_s - eps_inf)/((1-i*omega*tau)*(1-i*omega*tau_f)))


e_x = G(omega) * (F(omega)*exp(-1i*(omega/c0)*n(omega)*z)*exp(1i*omega*t))

W = (1/Z0) * real(n(omega))*abs(F(omega))^2

W = subs(W)

xi = -e_x + lambda*W
grad_xi = functionalDerivative(xi,F)

% note the sneaky n_i and n_r in the complex conjugate!

%isolate(solve(grad_xi == 0)==0, F(omega))

%class(solve(grad_xi == 0))

F_optimal = isolate(grad_xi==0,F(omega))



lambda = rhs(isolate(rhs(isolate(W == 1, F(omega))) == rhs(F_optimal), lambda))

F_optimal = subs(F_optimal, lambda)


%placeholder n, fix


F_optimal = subs(F_optimal)

F_optimal = subs(F_optimal, eps_inf, 4)
F_optimal = subs(F_optimal, eps_s, 75)
F_optimal = subs(F_optimal, tau_f, 5*10^-14)
F_optimal = subs(F_optimal, tau, 8*10^-12)
F_optimal = subs(F_optimal, omega_res, 8e9)
F_optimal = subs(F_optimal, beta, 10^-10)
F_optimal = subs(F_optimal, Z0, 377)
F_optimal = subs(F_optimal, c0, 3e8)

F_optimal = subs(F_optimal, t, 0)
F_optimal = subs(F_optimal, z, 0)


F(omega) = rhs(F_optimal)

%simplify(F(10))
fplot(real(F(omega)),[1e8, 10000e9])
fplot(imag(F(omega)),[1e8, 10000e9])

%sol = isolate(grad_xi,F(omega))
%pretty(sol)

%Dx(omega) = diff(F(omega),omega);
%xSol = dsolve(grad_xi);


%Dx(omega) = diff(y(omega),omega);
%xSol = dsolve(eqn,[x(0) == 10, Dx(0) == 0]) c