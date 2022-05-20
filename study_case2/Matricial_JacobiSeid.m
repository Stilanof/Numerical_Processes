%MatJacobiSeid: Calcula la solución del sistema
%Ax=b con base en una condición inicial x0,mediante el método de Jacobi o
%de Gauss Seidel (Matricial), depende del método elegido, se elige 0 o 1 en met
%respectivamente

%x0=input('Ingrese la condición incial (x0->en columna): ');
%A=input('Ingrese la matriz A: ');
%b=input('Ingrese la matriz b: ');
%Tol=input('Ingrese la tolerancia: ');
%niter=input('Ingrese el número de iteraciones: ');
%met=input('Ingrese el método (Jacobi=0, Gauss=1) ');
%norma=input('Ingrese la norma a utilizar (1,2,'inf'): ');

function [E,s] = Matricial_JacobiSeid_sintabla(x0,A,b,Tol,niter,met,norma)
    c=0;
 
    error=Tol+1;
    D=diag(diag(A));
    L=-tril(A,-1);
    U=-triu(A,+1);
    while error>Tol && c<niter
        if met==0
            T=inv(D)*(L+U);
            gf = max(abs(eig(T)));
            C=inv(D)*b;
            x1=T*x0+C;
        end
        if met==1
            T=inv(D-L)*(U);
            gf = max(abs(eig(T)));
            C=inv(D-L)*b;
            x1=T*x0+C;
        end
        E(c+2)=norm(x1-x0,norma);
        error=E(c+2);
        x0=x1;
        c=c+1;
        n(c+1)=c;
        
    end
    if error < Tol
        s=x0;
        n(c+1)=c;
        s;
        fprintf('es una aproximación de la solución del sistmea con una tolerancia= %f',Tol)
    else 
        s=x0;
        n(c+1)=c;
        fprintf('Fracasó en %f iteraciones',niter) 
    end
    table(n', E','VariableNames', {'Iteración', 'Error'})
    
    disp("Radio espectral (Bueno si es menor a 1)")
    disp(gf)
radio=max(abs(eig(T))) 
end