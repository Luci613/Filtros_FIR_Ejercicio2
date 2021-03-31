function analizaFiltro_FIR_Casa(b,a,fs)
%Lucía Lorenzo

%fs: frecuencia de muestreo
%a: array coeficientes parte recurrente ecuación en diferencias
%b: array coeficientes parte no-recurrente ecuación en diferencias
%En filtros FIR ak=1

%% Respuesta  en  frecuencia
N = 2^13; % Numero  de  puntos
[H, fa] = freqz(b,a,N,fs); %%La salida de freqz es H y fa
%% Atenuacion
alpha= -20*log10(abs(H)/max(abs(H)));
%% Retardo  de fase
P_d=phasedelay(b,a,N); 
%% Retardo  de grupo
G_d=grpdelay(b,a,N);

%% Respuesta Impulsional
h = b;
n = 0:length(h)-1; % Para el eje en muestras, generamos un nº de muestras


%% GRAFICAS
%% Módulo
subplot(3,2,1);plot(fa,abs(H));xlabel('frecuencia (Hz)'); title('|H(f)|');
set(gca, 'XLim',[0 fs/2]);
%% Atenuacion
subplot(3,2,2);plot(fa,alpha); xlabel('frecuencia (Hz)');title('\alpha (dB)');
set(gca, 'YLim',[0 90]);set(gca, 'XLim',[0 fs/2]);
%% Retardo  de fase
subplot(3,2,3);plot(fa,P_d);xlabel('frecuencia (Hz)');title('Retardo de fase: \tau_f (f)');
set(gca, 'YLim',[0 60]);
%% Retardo  de grupo
subplot(3,2,4);plot(fa,G_d);
xlabel('frecuencia (Hz)');title('Retardo de fase: \tau_g (f)');
set(gca, 'YLim',[0 60]);
set(gca, 'XLim',[0 fs/2]);
%% Respuesta impulsional
subplot(3,1,3); stem(n,h);xlabel('n (muestras)');title('h[n]');

%% Diagrama Polo-Cero -->
% No tiene sentido, todo ceros.

end



