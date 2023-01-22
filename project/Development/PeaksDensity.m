% ECE 460 - PROJECT 3
%   PEAKS DENSITY FUNCTION
%
%   AUSTIN  DIAL
%   RAMYA   SAMBULO
%   TYLER   BUCHANAN
%
%   05/04/2019
%
% This function takes a sound sample and the sampling frequency and finds
% the 'den' number of dominant peaks in the FFT spectrogram of the sample.
%


function fSet = PeaksDensity( sample, freq, den, fRange )

    % Initiate fPair
    fSet = [];

    % Perform FFT within frequency range 1 to 2 kHz
    sampleSpectrum = fft(sample, freq);
    sampleSpectrum = sampleSpectrum( fRange(1):fRange(2) );

%     % PLOT
%     plot(abs(sampleSpectrum));
%     xlabel('Frequency [Hz]');
%     ylabel('Amplitude');
%     grid on;

    % Find peaks
    tempTime = linspace( fRange(1), fRange(2), length(sampleSpectrum( fRange(1):fRange(2) )) );
    pks = findpeaks(abs(sampleSpectrum( fRange(1):fRange(2) )), tempTime, 'MINPEAKDISTANCE', 50);

    % Capture two highest peaks

        % Grab maximums
        maxs = maxk(pks, den);

        % Find den number of max values
        for j = 1:den
            indx = find( abs(sampleSpectrum) == maxs(j) );
            fSet(j) = indx(1);
        end
    
end