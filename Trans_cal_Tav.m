clc
clear
a=1.9;
b=2;
Ta=650;
Ti=30;
Tb=20;
alfa=117e-6;
r=a:(b-a)/100:b;
t=logspace(-6,4,10000);
nt=length(t);
nr=length(r);
n=1;
Tav=zeros(nt);
Tavt=zeros(nt);
Tavr=(Tb-Ta)*b/(b-a) + Ta - 3*a*b*(Tb-Ta)*(b+a)/(2*(b^3-a^3));
for l=1:nt
    for j=1:10^2
        Tavt(l) = Tavt(l) + 6*(a*(Ti-Ta)-b*(Ti-Tb)*(-1)^j)*(a*b-a^2-(b^2-a*b)*(-1)^j)*exp((-alfa*(j*pi/(b-a))^2)*t(l))/((j*pi)^2*(b^3-a^3));
    end
    Tav(l)=Tavt(l)+Tavr;
end
figure(1)
semilogx(t,Tav)
grid on
title('Distribuição transiente da temperatura média da casca esférica de cobre')
xlabel('Tempo (s)')
ylabel('Temperatura (°C)')
axis([10^-2 10^2 0 700])  % Ajuste da escala do eixo x para [1, 10^3]
%axis ([0 10 Ta Tb])