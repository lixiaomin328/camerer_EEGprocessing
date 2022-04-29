# camerer_EEGprocessing
Modified doc for EEG poker
Xiaomin Li,  Virginia Fedrigo and Yanrong Xu


STEP 0: MANUAL WORK, CHECK TRIGGER
Check trigger sequence. Make sure everything is correct. See Xiaomin’s toolbox.
Insert/delete trigger manually to make sure the trigger sequence matches perfectly with behavioral data. 
If step 2 not passed, manually insert trigger from behavioral data using RT and choices.
Match behavior data with event data at this stage. Attach trial number at eeg time stamp and also modify player2’s timestamp.
Slice the data into two. Do this within step 0, specifically before channel read.
Resample all data file into 500hz
Save the current dataset as a mile stone.


STEP 1: RAW PROCESSING (with help from pipeline)
Load in channel locations (use an *.elp file), make sure cz is the reference
Remove bad channel: pop_interp
Filter the data from 1hz to 50hz. Line noise happens at 50-60hz. At the moment, the higher frequency might not be useful for us. (do it in two steps, due to eeg lab)
Re-referencing the data. E.g., to average level 

STEP 2: EPOCHING AND EVENT PROCESSING
Epoch the data and adjust to the baseline accordingly.
Rejecting bad epoched data, can do it manually or through algorithm.
Partition data into target groups. E.g., control and treatment

STEP 3: ARTIFACT REJECTION
ICA step: https://sccn.ucsd.edu/wiki/Chapter_09:_Decomposing_Data_Using_ICA
Remove eye blinks by removing components (ICA based)
STEP 3: ANALYSIS
Check the existence of some well-established signal according to the task.
E.g., attention signal
If the target signal is known in previous study and the task has clear stimulus onset, check ERP signal directly locating in certain brain regions. 
If the signal is related to a period of time, check the event related time frequency 
analysis and spectrum analysis. Signal should be fourier transformed and plotted in    frequency space.
 https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2632478
If signal is very novel and little previous work can be referred to, do source localization. Reading and package are attached in the end.
If interested in connectivity analysis, https://sccn.ucsd.edu/wiki/SIFT

Package for EEG data:  EEGLAB, fieldtrip toolbox
Package for brain region visualization: brainstorm
Package for source localization: sloreta, besa
http://www.scholarpedia.org/article/Source_localization
Package for connectivity analysis: https://sccn.ucsd.edu/wiki/SIFT


