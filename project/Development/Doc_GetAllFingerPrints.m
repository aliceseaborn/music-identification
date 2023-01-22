% ECE 460 - PROJECT 3
%   AUDIO FINGERPRINTING
%
%   AUSTIN  DIAL
%   RAMYA   SAMBULO
%   TYLER   BUCHANAN
%
%   05/03/2019
%


%% SETUP ENVIRONMENT
%
    
    % Reset the system
    clear all; clc;
    
    % Turn off automatic plotting
    set(0, 'DefaultFigureVisible', 'off');
    
    
%% LISTEN TO AUDIO
%
    
%     % Play audio sound
%     player = audioplayer(y, Fs);
%     play(player);
    
%     % Stop audio
%     stop(player);
    
    
%% GET FINGERPRINT & PLOT
%
    
    % ---------------------------------------- PREPARE ANALYSIS ---------------------------------------- %
    
    % SETUP FINGERPRINTING SETTINGS
    
        % Setup window
        steps = 100;
    
        % Function inputs
        den = 3;
        fRange = [ 1, 2000 ];
    
    % DEFINE FILES TO SOLVE
    
        folder = 'C:\Users\adial\Documents\SCHOOL\9 SP19\ECE 460\Project\Project 3\Music\WAV';
        files = [ "Fairmont", "Bob Marley", "Dire Straights", "Ty Dolla Sign", "Sam Cooke", "Cornucopia", "Ocean Drive", "Still Corners", "Sweater Weather" ];
    
    % ---------------------------------------- ANALYZE FILES ---------------------------------------- %
    
    for i = 1:length(files)
        
        % Callout for debugging
        fprintf('Started Sample %d\n', i);
        
        % Pull audio file
        [y, Fs] = audioread( strcat( folder, '\' + files(i) + '.wav' ) );  
        
        % Save name and remove spaces
        ext = char( files(i) );
        ext(isspace(ext)) = [];
        
        % Call GetPrint
        [peaks, time] = GetPrint( y, Fs, den, steps, ext, fRange );
        
        % Make finerprints file save name
        filename=( strcat('C:\Users\adial\Documents\SCHOOL\9 SP19\ECE 460\Project\Project 3\Development\Fingerprints\', ext, '.mat') );
        
        % Save files
        save(filename, 'peaks', 'time');
        
        % Callout for debugging
        fprintf('Finished Sample %d\n', i);
        
    end
    
    
%% SCRATCH PAD
%    
    
%     x = 1:3;
%     y = 1:5;
%     [X,Y] = meshgrid(x,y);
    
    
%     plot(time)
    
    
    
    
    