%Newton 1: se ingresa el valor inicial (x0), la multiplicidad (m), la tolerancia del error (Tol) y el màximo nùmero de iteraciones (niter) 

syms x
f=input('Ingrese la función f(x) a resolver: ');
x0=input('Ingrese la condición incial (x0): ');
m=input('Ingrese la multiplicidad (m): ');
Tol=input('Ingrese la tolerancia (Tol): ');
niter=input('Ingrese el número de iteraciones(niter): ');

newton1(x0,Tol,niter,m,f)

function [n,xn,fm,dfm,E] = newton1(x0,Tol,niter,m,f)
    syms x

        %f=sin(2*x)-(x/(3))^3+0.1;
        %f=log((sin(x/100)+20))-x/(3/10)
        df=diff(f);
        c=0;
        fm(c+1) = eval(subs(f,x0));
        fe=fm(c+1);
        dfm = eval(subs(df,x0));
        dfe=dfm;
        E(c+1)=Tol+1;
        error=E(c+1);
        xn(c+1)=x0;
        while error>Tol && fe~=0 && c<niter
            xn(c+2)=x0-(m*fe/dfe);
            fm(c+2)=eval(subs(f,xn(c+2)));
            fe=fm(c+2);
            dfm(c+2)=eval(subs(df,xn(c+2)));
            dfe=dfm(c+2);
            %Absoluto
            %E(c+2)=abs(xn(c+2)-x0);
            %Relativo
            E(c+2)=abs((xn(c+2)-x0)/xn(c+2));
            error=E(c+2);
            x0=xn(c+2);
            c=c+1;
            n(c+1)=c;
        end
        if fe==0
           xn(c+1)=x0;
           n(c+1)=c;
           fprintf('%f es raiz de f(x) \n',x0)

        elseif error<Tol
           xn(c+1)=x0;
           n(c+1)=c;
           fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f \n',x0,Tol)

        elseif dfe==0
           xn(c+1)=x0;
           n(c+1)=c;
           fprintf('%f es una posible raiz múltiple de f(x) \n',x0)
        else 
           xn(c+1)=x0;
           n(c+1)=c;
           fprintf('Fracasó en %f iteraciones \n',niter) 
        end
        
          E(1)=nan;

    table(n',xn',fm',E',  'VariableNames', {'Iteración', 'xn', 'fx', 'Error'})
end