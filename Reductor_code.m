%?????????????????
%??????????????????
%??????????????????????
%???????????????????????

%Autor: Rafael Ferrari
%Version: 1.0
%Convertidor DC-DC Elevador o Boost ideal

close all
tsim   =    0.150;         % Tiempo para la simulacion

%Datos
Fs     =    20e3;          % Frecuencia de conmutacion 
Ts     =    1/Fs;          % Periodo 
D      =    0.5;           % Ciclo de trabajo
Vd     =    12;            % Voltaje de entrada       
R      =    100;           % Carga Resistiva
L      =    470e-6;        % Bobina o Inductor (uH)
C      =    120e-6;        % Capacitor (uF)


%Calculo de paraetros del convertidor:

Vo = D* Vd;

%Codigo con la vinculacion de codigo y simulacion
mysets=simset('Solver', 'ode23tb','MaxStep',1e-6,'RelTol',10^-5);
tt1=sim('Reductor',tsim,mysets);

%Graficas
figure(1)
plot(tt1,V_o)
hold on
xlabel('Tiempo (segundos)')
ylabel('Tension (Volts)')
title('Tension de salida en la carga  V_{O}')
grid

figure(2)
plot(tt1,I_d,tt1,I_dprom)
hold on
xlabel('Tiempo (segundos)')
ylabel('Corriente (Amperes)')
title('Corriente de entrada i_{d} y su promedio I_{dprom}')
grid

figure(3)
plot(tt1,I_ws,tt1,I_l)
hold on
xlabel('Tiempo (segundos)')
ylabel('Corriente (Amperes)')
title('Corriente de MOSFET I_{ws} y en el inductor I_{l}')
grid


figure(4)
plot(tt1,V_ws)
hold on
xlabel('Tiempo (segundos)')
ylabel('Tension (Volts)')
title('Tension en el MOSFET V_{ws}')
grid




