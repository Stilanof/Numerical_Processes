% Newton: se ingresa el valor inicial (x0), la tolerancia del error (Tol) y el màximo nùmero de iteraciones (niter) 
clear all
clc

syms t

Tol=input('Ingrese la tolerancia (Tol): ');
niter=input('Ingrese el número de iteraciones(niter): ');
t0=input('Ingrese la condición incial 1 (t0): ');
E=input('La rugosidad de la superficie (ε) en metros: ');
D=input('El diametro de la tubería (D) en metros: ');
V=input('La velocidad en m/s del fluido: ');
de=input('La densidad del fluido en Kg/m^3 ');
u=input('La viscosidad dinamica (Pa/s): ');
m=input('La multiplicidad del problema: ');


R=(V*D*de)/u;
f = -(2*log10(((E/D)/3.7)+(2.51/(R*sqrt(t)))))-(1/(sqrt(t))); 



fplot(f,[0   20])


[n,xn,fm,dfm,E] = Newton1(f, t0,Tol,niter,m);

function [n,xn,fm,dfm,E] = Newton1(f, x0,Tol,niter,m)
     
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
            xn=x0-m*(fe/dfe);%derivada de punto fijo 
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
           fprintf('El factor de fricción para este caso sería: %g',x0)

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