clear all

Cp_vann = 4.2e3;     % volumspesifikk varmekapasitet til vann (enhet J / [ liter(!!) * K ])
Tstart = 70;
Tslutt = 100;
dT = Tslutt-Tstart;
V= 50;  %liter (!!)

E = dT * Cp_vann * V;   % = integralet av effekten fra 0 til t => t = E/W

U = 220;     %spenning
%% Strømsconstraint
Imax = 16;  %ampere (sett denne)

Wmax = Imax * U;
t = E/Wmax;

disp(['For maksimal strømstyrke på ' num2str(Imax) 'A (' num2str(Wmax/1000,'%0.2f') 'kW), vil det ta ' num2str(t/60,'%.1f') ' minutter å varme opp ' num2str(V,'%.0f') 'l vann fra ' num2str(Tstart) '*C til ' num2str(Tslutt) '*C.'])

%% Tidsstyrt
tmax = 90; %minutter
W = E/(tmax*60);    %effekt
I = W/U;    %strøm

disp(['For maksimal tidsforbruk på ' num2str(tmax) ' min, vil det kreve ' num2str(I,'%.1f') 'A (' num2str(W/1000,'%0.2f') 'kW) ved ' num2str(U,'%.0f') 'V, for å varme opp ' num2str(V,'%.0f') ' l vann fra ' num2str(Tstart) '*C til ' num2str(Tslutt) '*C.'])