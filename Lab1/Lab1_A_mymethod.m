% 1. (2.5 marks)
% Create a signal of length 1 second in Matlab representing a sinusoid at 1kHz, 
% sampled at 5kHz. Plot that signal against the
% correct time base so that it is clear that your signal is correct.
clear variables
close all
clc

f=1000;
Amp=1;
Fsample = 5000;
Tsample = 1/Fsample;
T = 1;
t=0:Tsample:T-Tsample;
y=sin(2*pi*f*t);
figure(1)
subplot(2,1,1)
plot(t,y)
subplot(2,1,2)
plot(t,y)
xlim([0,0.01])
%% 
% 2. (2.5 marks)
% Draw on paper the spectrum you expect to see for this sampled signal. Take the FFT of this signal and plot it against a
% properly labeled frequency axis, with 0Hz in the middle. What is the frequency resolution of this plot?
N = length(y);
y_fft = fftshift(fft(y));
x_freqaxis = (-N/2:N/2-1)*(Fsample/N); % frequency range
figure(2)
plot(x_freqaxis,abs(y_fft)/N)
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|FFT(f)|')
xlim([-2500, 2500])
%% 
clc
clear variables
close all
% 3. (2.5 marks)
% Create a new sinusoid with magnitude 1.0, still sampled at 5kHz but having frequency 2.25kHz. Clip this signal to a
% maximum absolute value of 0.3, i.e. any value above 0.3 should become 0.3 and any below -0.3 should become -0.3. Plot
% that signal against the correct time base so that it is clear that your signal is correct.
Fsample = 5000;
t = [0:1:Fsample-1].*1/Fsample;
y = sin(2*pi*2250*t);
figure(3)
subplot(2,1,1)
plot(y(1:50))
title('original signal')
y(y>0.3) = 0.3;
y(y<-0.3) = -0.3;
subplot(2,1,2)
plot(y(1:50))
title('After clamping')
%% 4. (2.5 marks)
% Draw on paper the spectrum you expect to see for this type of clipping in the continuous time (i.e. not sampled) domain.
% Then draw the version you expect for this sampling example. Take the FFT of this signal and plot it against a properly
% labeled frequency axis, with 0Hz in the middle. What do you expect to see in this plot? Is that what you see?
% Fs = 10000;            % Sampling frequency                    
% T = 1/Fs;             % Sampling period       
% L = 1*Fs;             % Length of signal is 1 sec
% t = (0:L-1)*T;        % Time vector
N = length(y);
y_fft = abs(fftshift(fft(y)));
freq_range = (-N/2:N/2-1)*(Fsample/N);
plot(freq_range,y_fft/N)
xlim([-2500,2500]);