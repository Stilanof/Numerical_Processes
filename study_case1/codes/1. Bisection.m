%Bisección: se ingresa el valor inicial y final del intervalo (xi, xs), la tolerancia del error (Tol) y el màximo nùmero de iteraciones (niter) 
clear all
clc

syms t

Tol=input('Ingrese la tolerancia (Tol): ');
niter=input('Ingrese el número de iteraciones(niter): ');
ti=input('Ingrese el menor valor del intervalo (ti): ');
ts=input('Ingrese el mayor valor del intervalo (ts): ');
t0=input('Ingrese la condición incial 1 (t0): ');
P=input('Ingrese la Población total (P): ');
Pi=input('Ingrese la población infectada (Pi) en el momento: ');
k=input('Ingrese la constante de infección (k): ');
P0=input('Ingrese la población inicial (P0):  ');
a=input('Ingrese el dominio incial de la gráfica:  ');
b=input('Ingrese el dominio superior de la gráfica  ');


f = ((P+(sin(k*t)))/((P+(sin(k*t)))*(1+((P/P0)-1)*exp((-k*P)*(t-t0)))))-Pi; 



fplot(f,[a  b])


[n, xmi, fm, s, E] = biseccion(f,ti,ts,Tol,niter);

function [n, xmi, fm, s, E] = biseccion(f,xi,xs,Tol,niter)
    syms x
    fi=eval(subs(f,xi));
    fs=eval(subs(f,xs));
    if fi==0
        s=xi;
        E=0;
        fprintf('%f es raiz de f(x)',xi)
    elseif fs==0
        s=xs;
        E=0;
        fprintf('%f es raiz de f(x)',xs)
    elseif fs*fi<0
        c=0;
        n(c+1, 1)=c;
        xm=(xi+xs)/2;
        xmi(c+1,1) = xm;
        fm(c+1,1)=eval(subs(f,xm));
        fe=fm(c+1,1);
        E(c+1,1)=Tol+1;
        error=E(c+1);
        while error>Tol && fe~=0 && c<niter
            if fi*fe<0
                xs=xm;
                fs=eval(subs(f,xs));
            else
                xi=xm;
                fi=eval(subs(f,xi));
            end
            xa=xm;
            xm=(xi+xs)/2;
            xmi(c+2,1) = xm;
            fm(c+2,1)=eval(subs(f,xm));
            fe=fm(c+2,1);
            E(c+2,1)=abs((xm-xa));
            error=E(c+2);
            c=c+1;
            n(c+1, 1) = c;
        end
        table(n, xmi, fm, E)
        if fe==0
           s=xm;
           fprintf('%f es raiz de f(x)',xm) 
        elseif error<Tol
           s=xm;
           fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f',xm,Tol)
        else 
           s=xm;
           fprintf('Fracasó en %f iteraciones',niter) 
        end
    else
       fprintf('El intervalo es inadecuado')         
    end    
    
end