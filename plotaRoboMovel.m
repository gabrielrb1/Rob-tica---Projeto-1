function plotaRoboMovel(x, y, theta)

x_robo = [0   0.1 0.2 0.3 0.6 0.3  0.2  0.1  0   0];
y_robo = [0.2 0.2 0.2 0.2 0  -0.2 -0.2 -0.2 -0.2 0.2];

% Centroide. Apenas para efeito de desenho
x_c = mean(x_robo(2:end));
y_c = mean(y_robo(2:end));

x_robo = x_robo - x_c;
y_robo = y_robo - y_c;

robo = [x_robo; y_robo];

% Matriz de Rotação em torno do eixo-z
M = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];

% Rotacionando o robo de um angulo theta

robo = M*robo;

% Transladando o robo para a posição (x, y)

x_robo = robo(1,:)+x;
y_robo = robo(2,:)+y;

plot(x_robo, y_robo, 'b', 'linewidth', 2);
hold on
plot(x, y, 'or')
%axis equal
hold off