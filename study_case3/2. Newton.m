% Interpolación Newton
x=input('Ingrese las x []: ');
y=input('Ingrese las y []: ');
color=input('Ingrese el color de la función "b-r-y": ');

[Tabla] = Newtoninte(x,y)
coef=diag(Tabla,+1);
[a] = Newtonor(x,coef)
p = toPlot(x, a, color,y)
%% Calcular tabla diferencias divididas

%Newtonint: Calcula los coeficienetes del polinomio de interpolación de
% grado n-1 para el conjunto de n datos (x,y), mediante el método de Newton
% con diferencias divididas.

function [Tabla] = Newtoninte(x,y)
    n=length(x);
    Tabla=zeros(n,n+1);
    Tabla(:,1)=x;
    Tabla(:,2)=y;
    for j=3:n+1
        for i=j-1:n
            Tabla(i,j)=(Tabla(i,j-1)-Tabla(i-1,j-1))/(Tabla(i,1)-Tabla(i-j+2,1));
        end
    end

end

%% Polinomio

%Newtonor: Calcula los coeficioentes del polinomio simplificado de Newton, 
% teniendo los coeficientes (coef) de la tabla de diferencias divididas y 
% los puntos el conjunto de datos conocidos en la x.
function [a] = Newtonor(x,coef)
    n=length(x);
    a=1;
    acum=a;
    a=coef(1)*acum;
    for i=1:n-1
        a=[0 a];
        acum=conv(acum,[1 -x(i)]);
        a=a+coef(i+1)*acum;
    end
    
end
%% Plot
function p = toPlot(x, a, color,y)

[s, z] = size(a);

dx = (x(end) - x(1))/1000;
xd = x(1):dx:x(end);

if s == 1 || z == 1
    
    yp = zeros(size(xd));
    
    for i = 0:length(a)-1
        yp = yp + a(length(a) - i)*xd.^i;
    end
    
else
    
    yp = [];
    xa1 = xd(xd >= x(1) & xd <= x(2));
    x = [x x(end)];
    
    for i = 1:s
        
        a1 = zeros(size(xa1));
        
        for j = 0:z-1
            a1 = a1 + a(i, z - j)*xa1.^j;
        end
        
        if color == '0'
            hold on
            plot(xa1, a1)
            plot(x,y,'*')
            
        end

        yp = [y a1];
        xa1 = xd(xd > x(i+1) & xd <= x(i+2));
        
    end
    
end

if color ~= '0'
    hold on
    p = plot(xd, yp, color);
    plot(x,y,'*')
    hold off
   
end
end