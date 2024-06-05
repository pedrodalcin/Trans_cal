clc
clear
a=1.9;
b=2;
Ta=650;
Ti=30;
Tb=20;
alfa=117e-6;
r=a:(b-a)/100:b;
alfa/(b-a)^2
t=logspace(-8,4,10000);
nt=length(t);
nr=length(r);
n=1;
Tss = @(r) -a*b*(Tb-Ta)/((b-a)*r)+(Tb-Ta)*b/(b-a) + Ta;
Ttn = @(t,r,n) (2/(n*r*pi))*(a*(Ti-Ta)-b*(Ti-Tb)*(-1)^n)*sin(n*pi*(r-a)/(b-a))*exp((-alfa*(n*pi/(b-a))^2)*t);
T=zeros(nt,nr);
k=zeros(nt,nr);

% for l=1:nt
%     for i=1:nr
%         T(l,i) = Tss(r(i));
%         for j=1:100
%             T(l,i) = T(l,i)+ Ttn(t(l),r(i),j);
%         end
%     end
% end

aux1=0;
for l=1:nt
    for i=1:nr
        T(l,i) = Tss(r(i));
        for j=1:10^3
            aux2 = Ttn(t(l),r(i),j+1)/r(i);
            if abs(aux2) > abs(Ttn(t(l),r(i),j)/r(i))/10000
                T(l,i) = T(l,i) + Ttn(t(l),r(i),j);
            else
                k(l,i)=j;
                break
            end
        end
    end
end

re = [10 25 50 75 90];

figure(1)
semilogx(t,T(:,re(1)),t,T(:,re(2)),t,T(:,re(3)),t,T(:,re(4)),t,T(:,re(5)))
grid on
title('Distribuição transiente da temperatura da casca esférica de cobre')
xlabel('Tempo (s)')
ylabel('Temperatura (°C)')
legend('r=1.91m','r=1.925m','r=1.95m','r=1.975m','r=1.99m','Location', 'best')
axis([10^-4 10^2 0 700])  % Ajuste da escala do eixo x para [1, 10^3]

% aux1=0;
% for l=1:nt
%     for i=1:nr
%         T(l,i) = Tss(r(i));
%         for j=1:10^3
%             aux2 = Ttn(t(l),r(i),j+1)/r(i);
%             if abs(aux2) > abs(Ttn(t(l),r(i),j)/r(i))/10000000
%                 T(l,i) = T(l,i) + Ttn(t(l),r(i),j);
%             else
%                 k(l,i)=j;
%                 break
%             end
%         end
%     end
% end
