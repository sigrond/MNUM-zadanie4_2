function [ output_args ] = Zadanie4_2( input_args )
%Zadanie4_2 rozwi¹zanie zadania z projektu 4
%   Detailed explanation goes here

dx = @(x) [  x(2)+x(1)*(0.9-x(1)^2-x(2)^2) , ...
            -x(1)+x(2)*(0.9-x(1)^2-x(2)^2) ];

przedzial=[0,20];
                
x0a=[10, 8];



[T,Y]=ode45(@(t,x)dx(x)', przedzial, x0a);

figure;
plot(T,Y);

krok=0.0146583;
                
[ x, Tx, errx, t ]=RK4_staly_krok(dx, x0a, przedzial, krok);

figure;
plot(Tx,x);

end

