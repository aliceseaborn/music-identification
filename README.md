# Music Identification

Our challenge was to replicate the Shazam music detection algorithm proposed by Avery Wang. Reading Wang's paper, *An Industrial-Strength Audio Search Algorithm*, we realized that an identical approach using hashing and constellation analysis would be tedious and besides the point of the project. Rather, our goal is to learn how Fourier series analysis can be applied to real world problems such as audio analysis. We developed a system where a wav file can be converted into a constellation (fingerprint) of dominant frequency points across time and then compared to new inputs through correlative analysis. This approach requires time to create the database of initial fingerprints but has very little performance overhead to analyze new files once the database has been completed.

This code leans heavily on file hierarchies, particularly for the WAV files under `project/Music/WAV` and the fingerprints under `project/Development/Fingerprints`. I have left everything setup so that new prints don't need to be manufactured and new plots don't need to be generated but you could easily delete the plots and the fingerprints and execute `Doc_GetAllFingerPrints.m` after setting up the correct path to wav files. Then you could experiment with the settings in `Doc_RunAnalysis.m` and try changing the tolerance and noise ranges to validate the algorithms robustness, this would require confirming the path so that the fingerprints can be accessed by the analysis.

This project was completed as a requirement for ECE 460, Digital Signal Processing, to earn an undergraduate degree in Electrical & Computer Engineering.


*alice seaborn.*

