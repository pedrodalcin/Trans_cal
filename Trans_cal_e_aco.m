clc
clear
a=0.040;
b=0.045;
Ta=-196;
Ti=30;
Tb=25;
alfa=3.48e-6;
alfa/(b-a)^2
r=a:(b-a)/100:b;
t=logspace(-5,3,10000);
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
for l=1:nt
    for i=1:nr
        T(l,i) = Tss(r(i));
        for j=1:10^3
            aux2 = Ttn(t(l),r(i),j+1)/r(i);
            if abs(aux2) > abs(Ttn(t(l),r(i),j)/r(i))/1000
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
title('Distribuição transiente da temperatura da casca esférica de aço')
xlabel('Tempo (s)')
ylabel('Temperatura (°C)')
legend('r = 40.5mm','r =41.25mm','r = 42.5mm', 'r = 43.75mm', 'r = 44.5mm', 'Location','best')
axis([10^-4 10 -300 50]) 

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
