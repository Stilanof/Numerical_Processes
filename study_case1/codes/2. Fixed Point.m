%Punto fijo: se ingresa el valor inicial (x0), la tolerancia del error (Tol) y el màximo nùmero de iteraciones (niter) 

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
g= (((P+(sin(k*t)))/((P+(sin(k*t)))*(1+((P/P0)-1)*exp((-k*P)*(t-t0)))))-Pi)*t; 


fplot(f,[a  b])

PF(f, g, t0, Tol, niter)

function [n,xn,fm,E] = PF(f, g, x0,Tol,niter)
    
        c=0;
        fm(c+1) = eval(subs(f,x0));
        fe=fm(c+1);
        E(c+1)=Tol+1;
        error=E(c+1);
        xn(c+1)=x0;
        N(c+1)=c;
        while error>Tol && fe~=0 && c<niter
            xn(c+2)=eval(subs(g,x0));
            fm(c+2)=eval(subs(f,xn(c+2)));
            fe=fm(c+2);
            E(c+2)=abs((xn(c+2)-x0));
            error=E(c+2);
            x0=xn(c+2);
            N(c+2)=c+1;
            c=c+1;
        end
        if fe==0
           s=x0;
           n=c;
           fprintf('%f es raiz de f(x)',x0)
           disp(['     n       Xn      Fx     Error'])
           D=[N' xn' fm' E'];
        elseif error<Tol
           s=x0;
           n=c;
           %fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f',x0,Tol)
           disp(['    n        Xn         Fx        Error'])
           D=[N' xn' fm' E'];
            disp(D)
        else 
           s=x0;
           n=c;
           fprintf('Fracasó en %f iteraciones',niter) 
        end       
end