syms t


Tol=input('Ingrese la tolerancia (Tol): ');
niter=input('Ingrese el número de iteraciones(niter): ');
t0=input('Ingrese la condición incial 1 (t0): ');
t1=input('Ingrese la condición incial 2 (t1): ');
P=input('Ingrese la Población total (P): ');
Pi=input('Ingrese la población infectada (Pi) en el momento: ');
k=input('Ingrese la constante de infección (k): ');
P0=input('Ingrese la población inicial (P0):  ');
a=input('Ingrese el dominio incial de la gráfica:  ');
b=input('Ingrese el dominio superior de la gráfica  ');

f = ((P+(sin(k*t)))/((P+(sin(k*t)))*(1+((P/P0)-1)*exp((-k*P)*(t-t0)))))-Pi; 


fplot(f,[a  b])

secante1(f, t0, t1, Tol, niter) %comentar para proyecto

function [n, tn, ftn, E] = secante1(f, t0, t1, Tol, niter)

    n(1) = 1;
    n(2) = 2;
    tn(1) = t0;
    tn(2) = t1;
    ftn(1) = eval(subs(f,tn(1)));
    ftn(2) = eval(subs(f,tn(2)));
    E(1) = nan;
    E(2) = nan;
    tn(1) = t0;
    tn(2) = t1;

    c = 3;
    error = inf;

    if ftn(1) == 0

        fprintf("Raíz en %f", tn(1));
        return
    elseif ftn(2) == 0

        fprintf("Raíz en %f", tn(2));
        return
    end
        
    while error > Tol && c < niter+2 && ftn(c-1) ~= 0

        tn(c) = tn(c-1)-((ftn(c-1)*(tn(c-1)-tn(c-2)))/(ftn(c-1)-ftn(c-2)));
        ftn(c) = eval(subs(f,tn(c)));
        E(c) = abs(tn(c)-tn(c-1));
        error = E(c);
        n(c) = c;

        c = c+1;
    end

    if ftn(c-1) == 0
       fprintf('%f es raiz de f(x) \n', tn(c-1))

    elseif ftn(c-1)-ftn(c-2) == 0
       fprintf('No se puede continuar, división entre cero en %f iteraciones \n', c-1) 

    elseif error < Tol
       fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f \n', xn(c-1), E(c-1))

    else
       fprintf('Fracasó en %f iteraciones \n', c-1) 
    end
    
    n = n-2; E(3) = nan; n(1) = nan; n(2) = nan;
    table(n',tn',ftn',E', 'VariableNames', {'Iteración', 't', 'f(t)', 'Error absoluto'})
end