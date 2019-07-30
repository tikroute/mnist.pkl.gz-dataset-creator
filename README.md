# mnist.pkl.gz-dataset-creator
This simple script converts your own images to mnist.pkl.gz dataset to train your model for DBN.py from deeplearning.net

# how to use
step 1: First prepare your images in 3 sets in 3 folders like below:

tran

test

valid

step 2: Then make 3 csv file containing your classess. I made them like this:

train.csv

test.csv

valid.csv

step 3: You have to make your images resized and in garyscale format, for doing so use the `resize-script.sh` script with the following commands: 

```bash
sudo chmode +x resize-script.sh
./resize-script.sh
```
It checks all images and converts them into grayscale 28x28 png images. 

step 4: Finally run the `image-to-mnist.py` with the following command:

```bash
python image-to-mnist.py

```

# enjoy ;)

I searched lots of websites and read a lot of comments to finnaly found this solution, hope you use it and save you a lot of headache and time.
