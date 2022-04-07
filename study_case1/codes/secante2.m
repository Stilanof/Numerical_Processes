syms x
f=input('Ingrese la función continua a resolver: ');
x0=input('Ingrese la condición incial 1 (x0): ');
x1=input('Ingrese la condición incial 2 (x1): ');
Tol=input('Ingrese la tolerancia (Tol): ');
niter=input('Ingrese el número de iteraciones(niter): ');

%f = abs(x)^{x-1}-(2.5*x)-5;

%x0 = -3; x1 = -2; Tol = 0.000005; niter = 100;

secante1(f, x0, x1, Tol, niter)

function [n, xn, fxn, E] = secante1(f,x0,x1,Tol,niter)

    n(1) = 1;
    n(2) = 2;
    xn(1) = x0;
    xn(2) = x1;
    fxn(1) = eval(subs(f,xn(1)));
    fxn(2) = eval(subs(f,xn(2)));
    E(1) = nan;
    E(2) = nan;
    xn(1) = x0;
    xn(2) = x1;

    c = 3;
    error = inf;

    if fxn(1) == 0

        fprintf("Raíz en %f", xn(1));
        return
    elseif fxn(2) == 0

        fprintf("Raíz en %f", xn(2));
        return
    end
        
    while error > Tol && c < niter && fxn(c-1) ~= 0

        xn(c) = xn(c-1)-((fxn(c-1)*(xn(c-1)-xn(c-2)))/(fxn(c-1)-fxn(c-2)));
        fxn(c) = eval(subs(f,xn(c)));
        %absoluto
        % E(c) = abs(xn(c)-xn(c-1));
        %relativo
        E(c) = abs((xn(c)-xn(c-1))/xn(c));
        error = E(c);
        n(c) = c;

        c = c+1;
    end

    if fxn(c-1) == 0
       fprintf('%f es raiz de f(x) \n', xn(c-1))

    elseif fxn(c-1)-fxn(c-2) == 0
       fprintf('No se puede continuar, división entre cero en %f iteraciones \n', c-1) 

    elseif error < Tol
       fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f \n', xn(c-1), E(c-1))

    else
       fprintf('Fracasó en %f iteraciones \n', c-1) 
    end
    
    n = n-2; %E(3) = nan;
    n(1) = nan; n(2) = nan;
    table(n',xn',fxn',E', 'VariableNames', {'Iteración', 'x', 'f(x)', 'Error absoluto'})
end