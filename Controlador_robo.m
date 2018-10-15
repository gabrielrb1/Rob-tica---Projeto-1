clear all
clc
xd = 8;  %Coordenadas da posi��o desejada
yd = 10; %para o robo

x = 0;  %Coordenadas da posi��o inicial
y = 0;  %do robo
theta = 0;
dt = 0.1;

plotaRoboMovel(x,y,theta) %Plota posi��o inicial do robo
hold on

%Calculo dos erros de posi��o e orienta��o
ro = sqrt((x-xd)^2+(y-yd)^2);
beta = atan2d((yd-y),(xd-x));
alfa = beta - theta;

%Determina��o das constantes de velocidade
kv = 0.5;
kw = 0.4;


while (ro > 0.1)
    v = kv*tanh(ro)*cosd(alfa)
    w = kw*alfa+kv*cosd(alfa)*sind(alfa)*(tanh(ro)/ro)
    x = v*cosd(theta)*dt+x
    y = v*sind(theta)*dt+y
    theta = w*dt+theta
    ro = sqrt((x-xd)^2+(y-yd)^2)
    beta = atan2d((yd-y),(xd-x))
    alfa = beta - theta
    plotaRoboMovel(x,y,theta)
    axis([-1 20 -1 10])
    pause(dt)
    
end