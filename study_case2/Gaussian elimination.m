%GaussPiv: Calcula la solución de un sistema de ecuaciones Ax=b, ya sea
% sin pivoteo piv=0, usando pivoteo parcial piv=1 o pivoteo totalpiv=2. 
% Donde A es de tamaño nxn y b de tamaño nx1

A=input('Ingrese la matriz A []: ')
b=input('Ingrese la matriz b []: ')
n=input('Ingrese el tamaño matricial n: ')
Piv=input('Ingrese el tipo de pivoteo sin (0), pivoteo parcial (1) o pivoteo total (2): ')
[x, mark] = GaussPiv(A,b,n,Piv)
%%
function [x, mark] = GaussPiv(A,b,n,Piv)
    Ab=[A b];
    mark=1:1:n;
    for k=1:n-1
        if Piv==1
            Ab=pivpar(Ab,n,k);
        elseif Piv==2
            [Ab, mark]=pivtot(Ab,mark,n,k);
        end
        for i=k+1:n
            M=Ab(i,k)/Ab(k,k);
            for j=k:n+1
                Ab(i,j)=Ab(i,j)-M*Ab(k,j);
            end
        end
    end
    x=sustreg(Ab,n);

table(mark',x,'VariableNames',{'xi','Valor'})
end

%pivpar: realiza el pivoteo parcial (por filas) sobre la matriz aumentada AB del
%sistema Ax=b

function Ab = pivpar(Ab,n,k)
    mayor=abs(Ab(k,k));
    maxrow=k;
    for s=k+1:n
        if abs(Ab(s,k))>mayor
            mayor=abs(Ab(s,k));
            maxrow=s;
        end
    end
    if mayor==0
       fprintf('El sistema no tiene solución única')
    elseif maxrow~=k %intercambio de filas
        aux=Ab(k,:);
        Ab(k,:)=Ab(maxrow,:);
        Ab(maxrow,:)=aux;
    end
end
%%
%pivtot: realiza el pivoteo total(por filas y columnas) sobre la matriz aumentada AB del
%sistema Ax=b

function [Ab, mark]=pivtot(Ab,mark,n,k)
    mayor=0;
    maxrow=k;
    maxcol=k;
    for r=k:n
        for s=k:n
            if abs(Ab(r,s))>mayor
                mayor=abs(Ab(r,s));
                maxrow=r;
                maxcol=s;
            end
        end
    end
    if mayor==0
       fprintf('El sistema no tiene solución única')
    else
        if maxrow~=k %intercambio de filas
            aux=Ab(k,:);
            Ab(k,:)=Ab(maxrow,:);
            Ab(maxrow,:)=aux;
        end
        if maxcol~=k %intercambio de columnas
            aux=Ab(:,k);
            Ab(:,k)=Ab(:,maxcol);
            Ab(:,maxcol)=aux;
            aux2=mark(k);
            mark(k)=mark(maxcol);
            mark(maxcol)=aux2;
            
        end
    end
    
end
%%

%sustreg: realiza el despeje para la matriz triangular superior aumentada
% Ab, que da solución al sistema Ax=b Donde A es de tamaño nxn y b de tamaño nx1

function x=sustreg(Ab,n)
    x=zeros(n,1);
    x(n)=Ab(n,n+1)/Ab(n,n);
    for i=n-1:-1:1
        sum=0;
        for p=i+1:n
            sum=sum+Ab(i,p)*x(p);
        end
        x(i)=(Ab(i,n+1)-sum)/Ab(i,i);
    end
    
end
