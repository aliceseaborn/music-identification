% ECE 460 - PROJECT 3
%   GET PRINT FUNCTION
%
%   AUSTIN  DIAL
%   RAMYA   SAMBULO
%   TYLER   BUCHANAN
%
%   05/06/2019
%
% Using the PeaksDensity function, this function finds the unique
% fingerprint for a sound sample by iterating through the sample by way of
% a window and appending the dominant frequencies in the window to a set of
% frequencies which it returns. Additionally, it creates a time signature
% for the frequencies to ensure that they are related to the duration of
% the song that is being segmented.
%


function [peaks, time] = GetPrint( sample, freq, den, steps, ext, fRange )

    % Calculate window settings
    step_size = round(length(sample) / steps);
    start = step_size;
    
    % Initiate window
    Window = sample( 1 : start );
    
    % Initiate arrays
    peaks = [];
    time = [];
    
    % Iterate through windows
    for i = 1:steps-1
        
        % Callout for debugging
        % fprintf('%d\n', i);
        
        % Use TwinPeaks on range
        fSet = PeaksDensity( Window, freq, den, fRange );
        
        % Append to peaks array
        peaks = [peaks, fSet];
        
        % Append to time array
        %   Convert from sample number to time using the sampling frequency
        %   and the inverse exponential for the time series conversion.
        time = [time, (start) * 1e-3 * freq^-1 ];
        
        % Iterate window
        %   Step window forward
        Window = sample( start : start + step_size );
        start = start + step_size;
        
    end
    
    % Duplicate Time    
    %   Repeat time system by den
    for i = 1:den:den*length(time)
        for j = 1:den-1
            time = [time( 1 : i ) time(i) time( i+1 : end )];

            % Callout for debugging
            % fprintf('%d %d\n', i, j);
        end
    end
    
    % Print fingerprint
    % Plot
    p = figure('Renderer', 'painters', 'Position', [10 10 900 300]);
    scatter(1000 * time, peaks);
    title(sprintf('FFT Finger Print (density %d)', den));
    xlabel('Time (s)');
    ylabel('Dominant Frequencies (Hz)');
    
    % Save
    name = ['/Plots/' 'Fingerprint' '_' ext '.jpg'];
    saveas( p, [pwd name] );
    
end
