import warnings
warnings.filterwarnings("ignore", category = FutureWarning)

import os
import librosa
import numpy as np


# Method to split a audio into multiple audio using overlapping windows
def splitAudios(X, y, window = 0.1, overlap = 0.5):
    # Empty lists to hold our results
    temp_X = []
    temp_y = []

    # Get the input audio array size
    xshape = X.shape[0]
    chunk = int(xshape*window)
    offset = int(chunk*(1.-overlap))
    
    # Split the audio and create new ones on windows
    spaudio = [X[i:i+chunk] for i in range(0, xshape - chunk + offset, offset)]
    for s in spaudio:
        temp_X.append(s)
        temp_y.append(y)

    return np.array(temp_X), np.array(temp_y)

# Method to convert a list of audios to a np array of melspectrograms
def to_melspectrogram(audios, n_fft = 1024, hop_length = 512):
    # Transformation function
    melspec = lambda x: librosa.feature.melspectrogram(x, n_fft = n_fft,
        hop_length = hop_length)[:,:,np.newaxis]

    # map transformation of input audios to melspectrogram using log-scale
    taudios = map(melspec, audios)
    return np.array(list(taudios))

def read_data(src_dir, num_guitar, audio_samples, spec_format, debug = True):    
    # Empty array of dicts with the processed features from all files
    arr_specs = []
    arr_guitar = []

    # Read files from the folders
    for x,_ in num_guitar.items():
        folder = src_dir + x
        
        for root, subdirs, files in os.walk(folder):
            for file in files:
                # Read the audio file
                file_name = folder + "/" + file
                signal, sr = librosa.load(file_name)
                if len(signal) < audio_samples:
                    print('Error in {}\nNum of samples ( >= {}): {}'.format(file_name, audio_samples, len(signal)))
                signal = signal[:audio_samples]
                
                # Debug process
                if debug:
                    print("Reading file: {}".format(file_name))
                
                # Convert to dataset of spectograms/melspectograms
                signals, y = splitAudios(signal, num_guitar[x])

                # Convert to "spec" representation
                specs = spec_format(signals)
                
                # Save files
                arr_guitar.extend(y)
                arr_specs.extend(specs)
                
                
    return np.array(arr_specs), np.array(arr_guitar)

# Parameters
dataPath = './audio/'
audio_samples = 600
num_guitar = {'acoustic': 0, 'bass': 1, 'electric': 2}

# Read the data
X, y = read_data(dataPath, num_guitar, audio_samples, to_melspectrogram, debug=True)
np.save('./data/featureInMFCC.npy', X)
np.save('./data/featureInRange.npy', y)
print("Saved npy")

