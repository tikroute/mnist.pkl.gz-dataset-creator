from PIL import Image
from numpy import genfromtxt
import gzip, cPickle
from glob import glob
import numpy as np
import pandas as pd

def dir_to_dataset(glob_files, loc_train_labels=""):
    print("Gonna process:\n\t %s"%glob_files)
    dataset = []
    for file_count, file_name in enumerate( sorted(glob(glob_files),key=len) ):
        image = Image.open(file_name)
        img = Image.open(file_name).convert('LA') #tograyscale
        pixels = [f[0] for f in list(img.getdata())]
        dataset.append(pixels)
        if file_count % 1000 == 0:
            print("\t %s files processed"%file_count)
    # outfile = glob_files+"out"
    # np.save(outfile, dataset)
    if len(loc_train_labels) > 0:
        df = pd.read_csv(loc_train_labels, names = ["class"])
        return np.array(dataset), np.array(df["class"])
    else:
        return np.array(dataset)


Data1, y1 = dir_to_dataset("train/*.png","train.csv")
Data2, y2 = dir_to_dataset("valid/*.png","valid.csv")
Data3, y3 = dir_to_dataset("test/*.png","test.csv")

# Data and labels are read 

train_set_x = Data1[:7717]
train_set_y = y1[:7717]
val_set_x = Data2[:1653]
val_set_y = y2[:1653]
test_set_x = Data3[:1654]
test_set_y = y3[:1654]


# Divided dataset into 3 parts. I had 6281 images.

train_set = train_set_x, train_set_y
val_set = val_set_x, val_set_y
test_set = test_set_x, val_set_y

dataset = [train_set, val_set, test_set]

f = gzip.open('mnist.pkl.gz','wb')
cPickle.dump(dataset, f, protocol=2)
f.close()
