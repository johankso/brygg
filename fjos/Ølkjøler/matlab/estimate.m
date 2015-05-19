clc
clf
clear all
close all
%%
DATA= load('måledata.mat','t','T','Tvann');

t=DATA.t;
T=DATA.T;
Tvann=DATA.Tvann;
Tmax=20;

figure(1)
N=length(t);

indices=1:N;
keepData=4:N;
discardData=indices;
discardData(keepData)=[];

x=t(keepData);
y=T(keepData);

scatter(t(discardData),T(discardData),'kx')
legtxt{1} = 'Ubrukt data';
hold on
plot(t(keepData),T(keepData),'k.')
legtxt{2} = 'Brukt data';
%% LS-fit
Tf=@(a,tdata) a(1)+a(2)*exp(a(3)*tdata);
a = lsqcurvefit(Tf,[0,0,0],t(keepData),T(keepData));

tfit=0:0.1:40;
Tfit=Tf(a,tfit);

%Adjust so that 

plot(tfit,Tfit,'k')
legtxt{3} = 'Fit';

% Vanntemp
plot(tfit,Tvann*ones(length(tfit),1),'red')
legtxt{4} ='Vanntemperatur';

% Gjærtemp

plot(tfit,Tmax*ones(length(tfit),1),'blue')
legtxt{5} = 'M{\aa}ltemperatur, v{\o}rter';

% Romtemp
% Trom=23;
% plot(tfit,Trom*ones(length(tfit),1),'green')
% legtxt{6} = 'Romtemp';

% Siste plotting
legend(legtxt)
ylim([0,50])
ylabel('T [C]')
xlabel('t [min]')
text(10,30,['T = ' num2str(a(1),3) ' + ' num2str(a(2),3) ' \cdot e^{' num2str(a(3),3) ' t}'])
% xlim([0 60])
box on
matlab2tikz('Fig1.tikz','height','\figureheight','width','\figurewidth')

%% Shift
figure
tfit2=-100:0.001:60;
Tfit2=Tf(a,tfit2);

startT=100;
[~,ixStart] = min(abs(Tfit2-startT));
[~,ix0] = min(abs(tfit2));
dt=tfit2(ixStart)-tfit2(ix0);

b1=a(1);
b2=a(2)*exp(a(3)*dt);
b3=a(3);

tshifted=0:0.1:60;
Tshifted =b1+b2*exp(b3*tshifted); 

plot(tshifted,Tshifted,'k')
legtxt{1} = 'Forskjøvet fit';
text(20,30,['T = ' num2str(b1,3) ' + ' num2str(b2,3) ' \cdot e^{' num2str(b3,3) ' t}'])
xlabel('t [min]')
ylabel('T [C]')
hold on

% Vanntemp
figure(2)
plot(tshifted,Tvann*ones(length(tshifted),1),'red')
legtxt{2} ='Vanntemperatur';

% Gjærtemp
plot(tshifted,Tmax*ones(length(tshifted),1),'blue')
legtxt{3} = 'M{\aa}ltemperatur, v{\o}rter';

legend(legtxt)
box on
matlab2tikz('Fig2.tikz','height','\figureheight','width','\figurewidth')