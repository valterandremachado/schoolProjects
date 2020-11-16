import warnings
warnings.filterwarnings("ignore", category = FutureWarning)

import os
import keras
import h5py
import librosa
import itertools
import numpy as np
import matplotlib.pyplot as plt
from collections import OrderedDict

from keras.utils import to_categorical
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix

from keras.models import Sequential
from keras.layers import Input, Dense
from keras.layers import Dropout
from tensorflow.keras.callbacks import EarlyStopping
from keras.layers import Conv1D, GlobalAveragePooling1D, MaxPooling1D

from keras.utils.vis_utils import plot_model
from sklearn.metrics import classification_report
from mlxtend.evaluate import scoring


# plot_confusion_matrix method
def plot_confusion_matrix(cm, classes,
                          normalize=False,
                          title='Confusion matrix',
                          cmap=plt.cm.Blues):
    if normalize:
        cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]
        print("Normalized confusion matrix")
    else:
        print('Confusion matrix, without normalization')

    plt.imshow(cm, interpolation='nearest', cmap=cmap)
    plt.title(title)
    plt.colorbar()
    tick_marks = np.arange(len(classes))
    plt.xticks(tick_marks, classes, rotation=45)
    plt.yticks(tick_marks, classes)
    
    fmt = '.2f' if normalize else 'd'
    thresh = cm.max() / 2.
    for i, j in itertools.product(range(cm.shape[0]), range(cm.shape[1])):
        plt.text(j, i, format(cm[i, j], fmt),
                 horizontalalignment="center",
                 color="white" if cm[i, j] > thresh else "black")

    plt.tight_layout()
    plt.ylabel('True label')
    plt.xlabel('Predicted label')

# accurancy method
def acc(y_true, y_pred):
    return np.equal(np.argmax(y_true, axis=-1), np.argmax(y_pred, axis=-1)).mean()




num_guitar = {'acoustic': 0, 'bass': 1, 'electric': 2}

# Load the data
X = np.load('./data/featureInMFCC.npy')
y = np.load('./data/featureInRange.npy')
print(len(X))

# One hot encoding of the labels
y = to_categorical(y)

test_size = 0.2

# # Dataset Split
X_stack = np.squeeze(np.stack((X,) * 3, -1))
X_stack.shape

X_train, X_test, y_train, y_test = train_test_split(X_stack, y, test_size=test_size, random_state=42, stratify = y)

print(X_train.shape, X_test.shape, y_train.shape, y_test.shape)

# Histogram for train and test 
values, count = np.unique(np.argmax(y_train, axis=1), return_counts=True)
plt.bar(values, count)

values, count = np.unique(np.argmax(y_test, axis=1), return_counts=True)
plt.bar(values, count)
plt.figure(figsize=(20,10))
plt.show()

input_shape = X_train[0].shape 
num_guitar_type = 3
print(input_shape)

# Neural Network Construction
model = Sequential()
# Architecture
model.add(Conv1D(64, 3, activation='relu', input_shape = input_shape)) # Input layer
model.add(Conv1D(64, 3, activation='relu')) 
model.add(MaxPooling1D(3))
model.add(Conv1D(128, 3, activation='relu')) 
model.add(Conv1D(128, 3, activation='relu'))
model.add(GlobalAveragePooling1D())
model.add(Dropout(0.5))
model.add(Dense(3, activation='softmax')) # Output layer

optimiser = keras.optimizers.Adam(learning_rate=0.0001)
model.compile(loss='categorical_crossentropy',
              optimizer=optimiser,
              metrics=['accuracy'])

# Early stop function
early_stopping_callback = EarlyStopping(monitor='val_loss', mode="min", patience=5, restore_best_weights=True)

# Save model summary
model.summary()

#Save model summary in a png file
plot_model(model, to_file='model_summary.png', show_shapes=True, show_layer_names=True)

model.compile(loss=keras.losses.categorical_crossentropy,
              optimizer=keras.optimizers.Adam(),
              metrics=['accuracy'])

hist = model.fit(X_train, y_train,
          batch_size=64,
          epochs=200,
          verbose=1,
          validation_data=(X_test, y_test),
          shuffle=True,
          callbacks=[early_stopping_callback])
print("Learning stoped on epoch:", early_stopping_callback.stopped_epoch)

# Save the model
# model.save('./trained_model/GuitarClassifier.h5')
print("Model saved to disk!")

# Computes the loss & accuracy based on the input you pass it
score = model.evaluate(X_test, y_test, batch_size=5) 
y_pred = model.predict(X_test)

# [0] for loss, [1] for accuracy 
print("%s: %.2f%%" % (model.metrics_names[1], score[1]*100))



plt.figure(figsize=(15,7))
plt.subplot(1,2,2)
plt.plot(hist.history['loss'], label='train')
plt.plot(hist.history['val_loss'], label='validation')
plt.title('Loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()

plt.tight_layout()
plt.show()

# Setup confusion matrix
preds = np.argmax(model.predict(X_test), axis = 1)
y_orig = np.argmax(y_test, axis = 1)
cm = confusion_matrix(preds, y_orig)

y_indx = np.argmax(y_test, axis = 1)
pred_indx = np.argmax(y_pred, axis = 1)
print(classification_report(y_indx, pred_indx))

keys = OrderedDict(sorted(num_guitar.items(), key=lambda t: t[1])).keys()

fig, ax = plt.subplots(figsize=(20,10))
ax.set_ylim([-0.5,2.5])

# Display confusion matrix (works only with jupyter notebook)
plot_confusion_matrix(cm, keys, normalize=False)






