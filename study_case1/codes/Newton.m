% Newton: se ingresa el valor inicial (x0), la tolerancia del error (Tol) y el màximo nùmero de iteraciones (niter) 
clear all
clc

%f=input('Ingrese la función continua a resolver: ');
%x0=input('Ingrese la condición incial 1 (x0): ');
%Tol=input('Ingrese la tolerancia (Tol): ');
%niter=input('Ingrese el número de iteraciones(niter): ');


x0 = 1.5; %comentarlo para proyecto
Tol = 0.5e-3;%comentarlo para proyecto
niter = 100;%comentarlo para proyecto

[n,xn,fm,dfm,E] = Newton1(x0,Tol,niter);%comentarlo para proyecto

function [n,xn,fm,dfm,E] = Newton1(x0,Tol,niter)
    syms x

        f = x^2 - 2;
        df=diff(f);
        c=0;
        n(c+1, 1)=c;
        fm(c+1) = eval(subs(f,x0));
        fe=fm(c+1);
        dfm(c+1) = eval(subs(df,x0));
        dfe=dfm(c+1);
        E(c+1, 1)=Tol+1;
        error=E(c+1);
        xi(c+1, 1)=x0;
        while error>Tol && c<niter
            xn=x0-fe/dfe;
            fm(c+2, 1)=eval(subs(f,xn));
            fe=fm(c+2, 1);
            dfm(c+2, 1)=eval(subs(df,xn));
            dfe=dfm(c+2, 1);
            E(c+2, 1)=abs(xn-x0);
            error=E(c+2);
            x0=xn;
            xi(c+2, 1) = xn;
            c=c+1;
            n(c+1, 1) = c;
        end
        table(n, xi, fm, dfm, E)
        if fe==0
           s=x0;
           n=c;
           fprintf('%f es raiz de f(x) \n',x0)

        elseif error<Tol
           s=x0;
           fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f \n',x0,Tol)

        elseif dfe==0
           s=x0;
           n=c;
           fprintf('%f es una posible raiz múltiple de f(x) \n',x0)
        else 
           s=x0;
           n=c;
           fprintf('Fracasó en %f iteraciones \n',niter) 
        end
        
end