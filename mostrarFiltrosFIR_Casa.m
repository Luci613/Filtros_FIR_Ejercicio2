function mostrarFiltrosFIR_Casa
close all
%Lucía Lorenzo
% Dato
fs= 200; %frecuencia de muestreo
%Nota: para el valor de m, asuminos pesos iguales
%% 1. Método de las Ventanas
% Orden 90. 2 bandas eliminadas: 0-10 Hz y 50-80 Hz
%Utilizar ventana Hamming

n=90; %orden del filtro
%frecuencias
f1=10;
f2=50;
f3=80;
% Diseño del filtro. DC.0--> para filtros mutibanda
b= fir1(n,2*[f1 f2 f3]/fs,'DC-0',hamming(n+1));  
a=1; % Filtro FIR

figure('name','Metodo ventanas. Hamming');
analizaFiltro_FIR_Casa(b,a,fs);


%% 2. Muestreo en frecuencia
%Filtro paso bajo orden 50. BP hasta 35 Hz
%Ventana Hanning

n=50; % orden
f1=35;
f=[0 f1 f1 fs/2]; % Array de frecuencias normalizadas
m=[1 1 0 0]; % Banda de paso

b= fir2(n, 2*f/fs,m,hanning(n+1));
a=1; %Filtro FIR

figure('name','Metodo frecuencia. Paso bajo');
analizaFiltro_FIR_Casa(b,a,fs);


%% 3. Parks-McClellan
%Banda eliminada orden 80 
%BE: 15-75 Hz
%BTransición: 5Hz
%A rizado de BPaso: 5 veces mayor que la banda atenuada

n=80;
f=[0 10 15 75 80 fs/2];
m=[1 1 0 0 1 1]; 

b=firpm(n,2*f/fs,m,[1 5 1]);
a=1; %Filtro FIR

figure('name','Parks-McClellan. Banda eliminada');
analizaFiltro_FIR_Casa(b,a,fs);
end 