clc
clear
a=1.9;
b=2;
r=logspace(-4,4,100);
Ta=650;
Ti=30;
Tb=20;
alfa=117e-6;
nr=length(r);
n=1;
t=[2 15 100];

for i=1:3
    T(i,:) = Ta+(Ti-Ta)*erf(r/(2*sqrt(alfa*t(i))));  
end
figure(1)
semilogx(r,T(1,:),r,T(2,:),r,T(3,:))
grid on
title('Distribuição de temperatura pela distância em meio semi infinito de cobre')
xlabel('Distância(m)')
ylabel('Temperatura (°C)')
legend('t=2s','t=15s','t=100s','Location', 'best')
axis([10^-4 10^1 0 700])  % Ajuste da escala do eixo x para [1, 10^3]