% ECE 460 - PROJECT 3
%   PRINT COMPARE FUNCTION
%
%   AUSTIN  DIAL
%   RAMYA   SAMBULO
%   TYLER   BUCHANAN
%
%   05/07/2019
%
%   Generating finger prints is half the battle, this function loads those
%   finger prints and compares them together using a correlation table. If
%   a correlation between the input and the prints on file exceed the given
%   threshhold then the function returns its conclusions and evidence to
%   the user.
%

%% RUN COMPARISON
%
    
    % Reset the system
    close; clear; clc;
    
    % Define known and unknown songs
    known_song = 'Ocean Drive';
    unknown_song = 'Tame Impala';
    
    % Define filesystem
    folder = 'C:\Users\adial\Documents\SCHOOL\9 SP19\ECE 460\Project\Project 3\Music\WAV';
    ext = '.wav';
    
    % Set correlation tolerance
    tolerance = 0.95;
    
    % TEST POSITIVE CASE
    fprintf('*** TESTING: %s ***\n\n', known_song);
    
        % Define directory and file to compare
        name = strcat(known_song, ext);
        
        % Establish full filename
        filename = fullfile( folder, name );
        
        % Find match within 95.00 %
        FindSong( filename, tolerance );
        
    % TEST NEGATIVE CASE
    fprintf('*** TESTING: %s ***\n\n', unknown_song);
    
        % Define directory and file to compare
        name = strcat(unknown_song, ext);
        
        % Establish full filename
        filename = fullfile( folder, name );
        
        % Find match within 95.00 %
        FindSong( filename, tolerance );
    
    
    
    
    
    