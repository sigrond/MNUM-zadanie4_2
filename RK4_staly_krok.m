function [ x, T, errx, t ] = RK4_staly_krok( dx, x0, przedzial, krok )
%RK4_staly_krok Metoda Rungego-Kutty czwartego rz�du ze sta�ym krokiem
%   dx - uk�ad r�wna� r�niczkowych pierwszego rz�du
%   x0 - punkt pocz�tkowy
%   przedzia� - zadany przedzia� (od zera)
%   x - rozwi�zanie
%   T - interwa�y przedzia�u (potrzebne do wykresu itp)
%   errx - b��d rozwi�zania
%   t - czas oblicze�

tic;

yn=x0;%y0
h=krok;
h2=0.5*h;
j=1;
x=zeros(length(przedzial(1):krok:przedzial(2)),2);
errx=zeros(length(przedzial(1):krok:przedzial(2)),2);
T=zeros(length(przedzial(1):krok:przedzial(2)),1);
x(j,:)=yn';
T(j)=0;

for i=przedzial(1):krok:przedzial(2)
    j=j+1;
    k1=dx(yn);%zmiana oznacze� w celu zgodno�ci z podr�cznikiem
    k2=dx(yn+0.5*h*k1);
    k3=dx(yn+0.5*h*k2);
    k4=dx(yn+h*k3);
    ynp1=yn+1/6*h*(k1+2*k2+2*k3+k4);
    x(j,:)=yn';
    for i2=1:2%obliczenie yn+1 w dw�ch o po�ow� mniejszych krokach na potrzeby oszacownaia b��du
        k1=dx(yn);
        k2=dx(yn+0.5*h*k1);
        k3=dx(yn+0.5*h*k2);
        k4=dx(yn+h*k3);
        yn=yn+1/6*h*(k1+2*k2+2*k3+k4);
    end
    errx(j,:)=16/15*(yn-ynp1);
    yn=ynp1;
    T(j)=i+h;
end


t=toc;
end

