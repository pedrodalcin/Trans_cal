clc
clear
r=logspace(-6,0,100);
a=0.4;
b=0.403;
Ta=90;
Ti=30;
Tb=25;
alfa=0.43e-6;
n=1;
t=[2 15 100];

for i=1:3
    T(i,:) = Ta+(Ti-Ta)*erf(r/(2*sqrt(alfa*t(i))));  
end
figure(1)
semilogx(r,T(1,:),r,T(2,:),r,T(3,:))
grid on
title('Distribuição de temperatura pela distância em meio semi infinito de fibra de vidro')
xlabel('Distância(m)')
ylabel('Temperatura (°C)')
legend('t=2s','t=15s','t=100s','Location', 'best')
axis([10^-6 10^0 20 100])  % Ajuste da escala do eixo x para [1, 10^3]