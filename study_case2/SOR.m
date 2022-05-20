%SOR: Calcula la solución del sistema
%Ax=b con base en una condición inicial x0,mediante el método Gauss Seidel (relajado), depende del valor de w 
%entre (0,2)
%x0=0
% A=[3+(0/10) 3 -3;4 -8 6;7 8 -11]
% b=[12;13;14]
% Tol=0.0005
% niter=100
% 0.3  0.4  0.5  0.6  0.7  0.8   0.9  1  1.1  1.2
% w=1.2
% norma='inf'

x0=input('Ingrese la condición incial (x0->en columna): ');
A=input('Ingrese la matriz A: ');
b=input('Ingrese la matriz b: ');
Tol=input('Ingrese la tolerancia: ');
niter=input('Ingrese el número de iteraciones: ');
w=input('Ingrese el valor de relajación w entre 0-2: ');
norma=input("Ingrese la norma a utilizar (1,2,inf): ")
[E,s] = SORs(x0,A,b,Tol,niter,w,norma)

%%
function [E,s] = SORs(x0,A,b,Tol,niter,w,norma)
    c=0;
    error=Tol+1;
    D=diag(diag(A));
    L=-tril(A,-1);
    U=-triu(A,+1);
    while error>Tol && c<niter

        T=inv(D-w*L)*((1-w)*D+w*U);
        C=w*inv(D-w*L)*b;
        x1=T*x0+C;
        E(c+2)=norm(x1-x0,norma);
        error=E(c+2);
        x0=x1;
        s(c+1,:)=x0(:,1)';
        c=c+1;
        n(c+1)=c;
    end
    if error < Tol
        s(c+1,:)=x0(:,1)';
        n(c+1)=c;
        s;
        fprintf('es una aproximación de la solución del sistmea con una tolerancia= %f',Tol)
    else 
        s(c+1,:)=x0(:,1)';
        n(c+1)=c;
        fprintf('Fracasó en %f iteraciones',niter) 
    end
    table(n', E',s,'VariableNames', {'Iteración', 'Error','X'})
    
   %radio=max(abs(eig(T))) 
end

