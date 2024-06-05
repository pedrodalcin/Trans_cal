clc
clear
a=1.9;
b=2;
Ta=650;
Ti=30;
Tb=20;
alfa=117e-6;
x=0:(b-a)/100:b-a;
t=logspace(-4,4,10000);
nt=length(t);
nr=length(x);
n=1;
Tss = @(x) (Tb-Ta)*x/(b-a) + Ta;
Ttn = @(t,x,n) (2/(n*pi))*((Ti-Ta)*(1-(-1)^n)+(Tb-Ta)*(-1)^n)*sin(n*pi*x/(b-a))*exp((-alfa*(n*pi/(b-a))^2)*t);
T=zeros(nt,nr);
for l=1:nt
    for i=1:nr
        T(l,i) = Tss(x(i));
        for j=1:10^2
            T(l,i) = T(l,i)+ Ttn(t(l),x(i),j);
        end
    end
end

re = [10 25 50 75 90];

figure(1)
semilogx(t,T(:,re(1)),t,T(:,re(2)),t,T(:,re(3)),t,T(:,re(4)),t,T(:,re(5)))
grid on
title('Distribuição transiente da temperatura da parede plana de cobre')
xlabel('Tempo (s)')
ylabel('Temperatura (°C)')
legend('r=1.91m','r=1.925m','r=1.95m','r=1.975m','r=1.99m','Location', 'best')
axis([10^-4 10^2 0 700])  % Ajuste da escala do eixo x para [1, 10^3]
