close all
clear
clc
%%
N  = 512; % number of samples
fe = 50e6; % sampling frequency

t = (0:N-1) * 1/fe; % time

%% input signal 
f0 = 5e6; % transmit frequency
x  = cos(2*pi*f0.*t); 

%% output signal
y  = rand*cos(2*pi*f0.*t) + ... % fundamental
    rand*cos(2*pi*2*f0.*t) + ... % second harmonic
    rand*cos(2*pi*3*f0.*t); % third harmonic 
%%
ordre   = 3; % order
memoire = 3; % memory

%% Hammerstein modelisation

[y_model, y_decomp] = Hammerstein(x, y, ordre, memoire);

%% Figure
figure,
subplot(211)
plot(t,x,...
    t,y,...
    t,y_model)

N = 8192;
freq = (0:N-1)/N * fe;
subplot(212)
plot(freq,20*log10(abs(fft(x,N))),...
    freq,20*log10(abs(fft(y,N))),...
    freq,20*log10(abs(fft(y_model,N))))