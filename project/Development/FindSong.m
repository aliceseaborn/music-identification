% ECE 460 - PROJECT 3
%   FIND SONG FUNCTION
%
%   AUSTIN  DIAL
%   RAMYA   SAMBULO
%   TYLER   BUCHANAN
%
%   05/06/2019
%
%   Generating finger prints is half the battle, this function loads those
%   finger prints and compares them together using a correlation table. If
%   a correlation between the input and the prints on file exceed the given
%   threshhold then the function returns its conclusions and evidence to
%   the user.
%


function match_name = FindSong( filename, tolerance, noise )

    % FINGERPRINT SONG INPUT
        
        % Load WAV file
        [Song_y, Song_Fs] = audioread( filename );
        
        % Set extension
        ext = 'Test';
        
        % Set fingerprint settings
        den = 3;
        steps = 100;
        fRange = [ 1, 2000 ];
        
        % Pass to GetPrint
        [songFP, ~] = GetPrint( Song_y, Song_Fs, den, steps, ext, fRange );
        
        % Add noise if desired
        songFP = songFP + (noise(2) - noise(1)).*rand(1, length(songFP)) + noise(1);

    % COMPARISON SETTINGS
    
        % Comparison window width
        width = 20;
        
    % DIRECTORY CONNECTION
    
        % Load file names
        folder = 'C:\Users\adial\Documents\SCHOOL\9 SP19\ECE 460\Project\Project 3\Development\Fingerprints\';
        files = dir( strcat(folder, '*.mat') );
        
    % RUN COMPARISON
    
    % Set control conditions
    match = 0;
    f = 1;
    
    % Iteratively compare
    while match == 0

        % LOAD A FINGERPRINT

            % Callout for debugging
            fprintf('Loading %s ... ', files(f).name);

            % Load file for comaprison
            file = fullfile( folder, files(f).name );
            compareFP = cell2mat(struct2cell( load(file, 'peaks') ));

            % Callout for debugging
            fprintf('Done.\n');

        % WINDOWING SYSTEM

            % Setup window values
            count = width;
            songWin = songFP( 1:count );
            compareWin = compareFP( 1:count );

            % Find the smaller fingerprint to avoid exceeding lengths
            M = min( round( length(songFP) / width ), round( length(compareFP) / width ) );

            % Run logic
            cont = 1;
            i = 1:M-1;

            while(cont == 1)

                % Iterate i
                i = i+1;

                % CORRELATIVE ANALYSIS

                    % Get correlation
                    corr = corrcoef( songWin, compareWin );

                    % Check for correlation error
                    if isnan(corr)
                        fprintf('ERROR: Correlation matrix is NaN.\n');

                    % Check for match
                    elseif ( corr(1, 2) >= tolerance )
                        match_name = files(f).name;
                        fprintf('Input has a %.2f %% match with %s.\n\n', round(corr(1, 2)*100, 2), match_name);
                        match = 1;
                        cont = 0;
                        break;
                    end

                % Iterate window window values
                songWin = songFP( count : (i * width) );
                compareWin = compareFP( count : (i * width) );
                count = i * width;

                % Make sure we don't exceed sample length
                if ( round(i) >= M-1 )
                    cont = 0;
                    break;
                end
            
            end
            
        % Make sure we don't exceed files in directory
        %   Otherwise, iterate...
        if ( f == length(files) && match == 0 )
            fprintf('No matches found.\n\n');
            match = 1;
            break;
        else
            f = f+1;
        end
    
    end
    
end
    