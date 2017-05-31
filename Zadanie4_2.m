function [ output_args ] = Zadanie4_2( input_args )
%Zadanie4_2 rozwi¹zanie zadania z projektu 4
%   Detailed explanation goes here

%% a
dx = @(x) [  x(2)+x(1)*(0.9-x(1)^2-x(2)^2) , ...
            -x(1)+x(2)*(0.9-x(1)^2-x(2)^2) ];

przedzial=[0,20];
                
x0a=[10, 8];



[T,Y]=ode45(@(t,x)dx(x)', przedzial, x0a);

figure;
plot(T,Y);

%krok=0.0146583;
krok=0.0146582;
%krok=0.001;
                
[ x, Tx, errx, t ]=RK4_staly_krok(dx, x0a, przedzial, krok);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);



t

%% a PK

krok=0.01;

[ x, Tx, errx, t ]=PKA(dx, x0a, przedzial, krok);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);

t
%% a RKz


[ x, Tx, errx, t ]=RK4_zmienny_krok(dx, x0a, przedzial);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);

t

%% b

x0b=[0, 9];

[T,Y]=ode45(@(t,x)dx(x)', przedzial, x0b);

figure;
plot(T,Y);

krok=0.0146582;
                
[ x, Tx, errx, t ]=RK4_staly_krok(dx, x0b, przedzial, krok);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);

t
%% b PK

krok=0.01;

[ x, Tx, errx, t ]=PKA(dx, x0b, przedzial, krok);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);

t
%% b RKz


[ x, Tx, errx, t ]=RK4_zmienny_krok(dx, x0b, przedzial);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);

t
%% c

x0c=[8, 0];

[T,Y]=ode45(@(t,x)dx(x)', przedzial, x0c);

figure;
plot(T,Y);

krok=0.038;
                
[ x, Tx, errx, t ]=RK4_staly_krok(dx, x0c, przedzial, krok);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);

t
%% c PK

krok=0.01;

[ x, Tx, errx, t ]=PKA(dx, x0c, przedzial, krok);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);

t
%% c RKz


[ x, Tx, errx, t ]=RK4_zmienny_krok(dx, x0c, przedzial);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);

t
%% d

x0d=[0.001, 0.001];

[T,Y]=ode45(@(t,x)dx(x)', przedzial, x0d);

figure;
plot(T,Y);

krok=0.2;
                
[ x, Tx, errx, t ]=RK4_staly_krok(dx, x0d, przedzial, krok);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);

t

%% d PK

krok=0.5;

[ x, Tx, errx, t ]=PKA(dx, x0d, przedzial, krok);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);

t
%% d RKz


[ x, Tx, errx, t ]=RK4_zmienny_krok(dx, x0d, przedzial);

figure;
plot(Tx,x);

figure;
plot(Tx, errx);

t
end

