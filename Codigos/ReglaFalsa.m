%Bisección: se ingresa el valor inicial y final del intervalo (xi, xs), la tolerancia del error (Tol) y el màximo nùmero de iteraciones (niter) 
clear all
clc

syms t

Tol=input('Ingrese la tolerancia (Tol): ');
niter=input('Ingrese el número de iteraciones(niter): ');
ti=input('Ingrese el menor valor del intervalo (ti): ');
ts=input('Ingrese el mayor valor del intervalo (ts): ');
E=input('La rugosidad de la superficie (ε) en metros: ');
D=input('El diametro de la tubería (D) en metros: ');
V=input('La velocidad en m/s del fluido: ');
de=input('La densidad del fluido en Kg/m^3 ');
m=input('La viscosidad dinamica (Pa/s): ');
t0=input('Ingrese la condición incial 1 (f0): ');

R=(V*D*de)/m;
f = -(2*log10(((E/D)/3.7)+(2.51/(R*sqrt(t)))))-(1/(sqrt(t))); 



fplot(f,[0 20])


[n, xmi, fm, s, E] = reglafalsa(f,ti,ts,Tol,niter);

function [n, xmi, fm, s, E] = reglafalsa(f,xi,xs,Tol,niter)
    
    fi=eval(subs(f,xi)); %f(a)
    fs=eval(subs(f,xs)); %f(b)
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
        xm = xi - (fi*(xs-xi))/(fs-fi);
        xmi(c+1,1) = xm;
        fm(c+1,1)=eval(subs(f,xm));
        fe=fm(c+1,1);
        E(c+1,1)=Tol+1;
        error=E(c+1);
        while error>Tol && fe~=0 && c<niter
            if fi*fe<0
                xs=xm;
                fs=eval(subs(f,xs)); %f(b)
            else
                xi=xm;
                fi=eval(subs(f,xi)); %f(a)
            end
            xa=xm;
            xm =  xi - (fi*(xs-xi))/(fs-fi);
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
           fprintf('El factor de fricción para este caso sería: %g',xm) 
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