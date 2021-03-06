function [ x, T, errx, t ] = RK4_zmienny_krok( dx, x0, przedzial )
%RK4_zmienny_krok Metoda Rungego-Kutty czwartego rz�du ze zmiennym krokiem
%   dx - uk�ad r�wna� r�niczkowych pierwszego rz�du
%   x0 - punkt pocz�tkowy
%   przedzia� - zadany przedzia� (od zera)
%   x - rozwi�zanie
%   T - interwa�y przedzia�u (potrzebne do wykresu itp) tutaj wa�niejsze
%   ni� wcze�niej ze wzgl�du na zmienny krok
%   errx - b��d rozwi�zania
%   t - czas oblicze�
tic;
yn=x0;%y0
krok=0.001;
alpha=1;%wsp�czynnik korekcji kroku
epsylon=1e-3;%dok�adno�� oblicze�
epsylonWzg=1e-3;%dok�adno�� wzgl�dna
epsylonBezWzg=1e-6;%dok�adno�� bezwzgl�dna
s=0.9;
beta=5;
maxiter=1e4;
h=krok;
h2=0.5*h;
j=1;
%x=zeros(length(przedzial(1):krok:przedzial(2)),2);
%errx=zeros(length(przedzial(1):krok:przedzial(2)),2);
%T=zeros(length(przedzial(1):krok:przedzial(2)),1);
x(j,:)=yn';
T(j)=0;
while T(j)+h<przedzial(2) && j<maxiter
    j=j+1;
    k1=dx(yn);%zmiana oznacze� w celu zgodno�ci z podr�cznikiem
    k2=dx(yn+0.5*h*k1);
    k3=dx(yn+0.5*h*k2);
    k4=dx(yn+h*k3);
    ynp1=yn+1/6*h*(k1+2*k2+2*k3+k4);
    x(j,:)=ynp1';
    h2=h/2;
    for i2=1:2%obliczenie yn+1 w dw�ch o po�ow� mniejszych krokach na potrzeby oszacownaia b��du
        k1=dx(yn);
        k2=dx(yn+0.5*h2*k1);
        k3=dx(yn+0.5*h2*k2);
        k4=dx(yn+h2*k3);
        yn=yn+1/6*h2*(k1+2*k2+2*k3+k4);
    end
    errx(j,:)=abs(16/15*(yn-ynp1));
    yn=ynp1;
    T(j)=T(j-1)+h;
    epsylon=abs(yn)*epsylonWzg+epsylonBezWzg;
    alpha=min(epsylon/errx(j,:))^(1/5);
    hs=s*alpha*h;
    if s*alpha>=1
        if T(j)+h<przedzial(2)
            h=min([hs, beta*h, przedzial(2)-T(j)]);
        end
    elseif hs<1e-9
        disp('nie mozliwe rozwiazanie z zadana dokaladnoscia');
    else
        h=hs;
    end
        
    
end
t=toc;
end

