%Obtener coeficientes de polinomio de interpolación con vardemonde y
%grafica dicho polinomio
%Pide los datos x y y color de grafica

x=input('Ingrese las x []: ');
y=input('Ingrese las y []: ');
color=input('Ingrese el color de la función "b-r-y": ');

[A,a] = vander(x,y)

p = toPlot(x, a, color,y)

%valor=polyval(a,x(1))

%% Vander

%x=[3 3.7 4.4]';
%y=[6 10 15]';

function [A,a] = vander(x,y)

    n=length(x);
    A=zeros(n);
%p=a(1)*xpol.^3+a(2)*xpol.^2+a(3)*xpol+a(4);
    for i=1:n
        for j=1:n
          A(i,n-j+1)=x(i)^(j-1);
        end 
    end 
  
  b=y';
  a= A\b;
  a = a';

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



