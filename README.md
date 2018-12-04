# Skynet
Welcome to Skynet, an automated address canvassing model using satellite imagery.
First, download [training data, initialization weights, and trained weights](https://www.dropbox.com/sh/u1lqqjn5gg9wust/AABX7pcjD12miRImKZWgVAXua?dl=0)

###### *We strongly reccomend running this on linux*

# 1. Preprocessing and Config file
First, ensure your data has been partitioned into training and validation sets. Then place the images and the corresponding the labels into two separete directories for each set. This should produce four directories: 
```python
    /train_images/ #Directory for training image files
    /train_annotations/ #Directory for training annotation labels
    /val_images/ #Directory for validation image files
    /val_annotations/ #Directory for validation annotation labels
```
These directories should be defined in the ```config.json``` file under their respective fields. 

Any appropriate changes to any other fields should be made at this time. This includes editing the names of the 
class labels, generating anchor boxes with the command ```python gen_anchors.py -c config.json```, and specifying the weights file to be used. 

If the model is being trained for the first time, then ensure the ```backend.h5``` file is in the YOLOv3 directory as those
weights will be used to kick off the training. (This does not need to be specified in the config file) 

# 2. Train the Model
To train the model, run the command:

```python 
python train.py -c config.json
```

Training the model will produce a weights file that contains the model weights for your particular data set. 
This weights file name is designated by the ```saved_weights_name``` field in the config file and can be used
as a checkpoint for restarting training. Training concludes after 5 consecutive epochs did not have an improve in loss. 

# 3. Address Canvassing 
To perform address canvassing on a set of before and after images, run the appropriate canvassing command. For square images, that would be:

```python
python canvassing_square.py
```
Make sure the before and after images are in the root Skynet directory and are named ```old.tif``` and ```new.tif``` respectivly. In the current version, these images will be broken down into tiles to better resemble our training set; this way the model will be able to make accurate predictions. The model will then identify residences in the images and highlight the differences, indicating where new addresses have appeared, and stitch the tiles back together. These differences can be seen in the ```diff.png``` output image.  


# Training/Validation Set Creation
In order to create our training set, we took advantage of the Label Maker package in python. To create your own training/validation 
set using label maker, start by editing the ```config.json``` file specific to label maker. Specific coordinates if desired can be entered in, as well as specific class labels. A free access token from open map box must be obtained via their website and placed in the ```config.json``` file before any data can be download. Once the ```config.json``` file has been configured accordingly, run ```run.py``` to obtain the labeled training images. Once these images have been obtained, we recommend running the ```validate-labels.ipynb``` to manually filter out the more poorly labeled images. Finally, run ```split.sh``` to split the data into training and validation sets. 

# TODO 
+ Finish GUI
+ Canvassing on rectangular images
+ Distiction between if addresses were added or removed

