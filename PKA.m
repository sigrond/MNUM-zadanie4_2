function [ x, T, errx, t ] = PKA( dx, x0, przedzial, krok )
%PKA Implementacja metody predyktor-korektor Adamsa ze sta�ym krokiem
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
beta=[55/24,-59/24,37/24,-9/24];
betag=[251/720,646/720,-264/720,106/720,-19/720];
x=zeros(length(przedzial(1):krok:przedzial(2)),2);
errx=zeros(length(przedzial(1):krok:przedzial(2)),2);
T=zeros(length(przedzial(1):krok:przedzial(2)),1);
x(1,:)=yn';
%obliczenie pierwszych 3 warto�ci (poza punktem pocz�tkowym) metod� RK4
for i=2:4
    k1=dx(yn);
    k2=dx(yn+0.5*h*k1);
    k3=dx(yn+0.5*h*k2);
    k4=dx(yn+h*k3);
    ynp1=yn+1/6*h*(k1+2*k2+2*k3+k4);
    x(i,:)=ynp1';
    for i2=1:2
        k1=dx(yn);
        k2=dx(yn+0.5*h2*k1);
        k3=dx(yn+0.5*h2*k2);
        k4=dx(yn+h2*k3);
        yn=yn+1/6*h2*(k1+2*k2+2*k3+k4);
    end
    errx(i,:)=abs(16/15*(yn-ynp1));
    yn=ynp1;
    T(i)=i*h;
end
for i=5:length(przedzial(1):krok:przedzial(2))
    suma=[0, 0];
    for j=1:4
        suma=suma+beta(j)*dx(x(i-j,:));
    end
    xo=x(i-1,:)+h*suma;
    f=dx(xo);
    suma=[0, 0];
    for j=1:3
        suma=suma+betag(j+1)*dx(x(i-j,:));
    end
    x(i,:)=(x(i-1,:)+h*suma+h*betag(1)*f)';
    errx(i,:)=abs(19/270*(xo-x(i,:)));
    T(i)=i*h;
end
t=toc;
end

