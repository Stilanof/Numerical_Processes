%Iterativos: Calcula la solución del sistema Ax=b, con una condición
%inicial dada x0, y una tolerancia dada Tol, así como el número de
%iteraciones máximas deseadas niter; dependiendo el método
%elegido: Jacobi o Gauss Seidel; se elige 0,1  respectivamente en met.

x0=input('Ingrese la condición incial (x0): ');
A=input('Ingrese la matriz A: ');
b=input('Ingrese la matriz b: ');
Tol=input('Ingrese la tolerancia: ');
niter=input('Ingrese el número de iteraciones: ');
met=input('Ingrese el valor de relajación Jacobi(0) Gauss(1): ');
norma=input("Ingrese la norma a utilizar (1,2,'inf'):") 

[E,s] = Iterativoss(x0,A,b,Tol,niter,met,norma)

%%
function [E,s] = Iterativoss(x0,A,b,Tol,niter,met,norma)
    c=0;
    error=Tol+1;
    while error>Tol && c<niter
        x1=NewJacobiSeid(x0,A,b,met);
        
        E(c+2)=norm(x1-x0,norma);
        error=E(c+2);
        x0=x1;
        c=c+1;
        n(c+1)=c;
        s(c+1,:)=x0;
    end
    if error < Tol
        s(c+1,:)=x0;
        n(c+1)=c;
        %s
        fprintf('es una aproximación de la solución del sistmea con una tolerancia= %f',Tol)
    else 
        s(c+1,:)=x0;
        n(c+1)=c;
        fprintf('Fracasó en %f iteraciones',niter) 
    end
    Table=table(n',E',s,'VariableNames',{'Iteración', 'Error','X'})
end
%%
%NewJacobiSeid: Calcula la aproximación siguiente a la solución del sistema
%Ax=b con base en una condición inicial x0,mediante el método de Jacobi o
%de Gauss Seidel, depende del método elegido, se elige 0 o 1 en met
%respectivamente

function x1 = NewJacobiSeid(x0,A,b,met)
    n=length(A);
    x1=x0;
    for i=1:n
        sum=0;
        for j=1:n
            if j~=i && met==0
                sum=sum+A(i,j)*x0(j);
            elseif j~=i && met==1
                sum=sum+A(i,j)*x1(j);
            end
        end
        x1(i)=(b(i)-sum)/A(i,i);
    end
end