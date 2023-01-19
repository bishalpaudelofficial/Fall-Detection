# Fall-Detection

With Regards Bishal Paudel ;)

The Following codes is to be run in MATLAB r2020a version or newer. The data given are personal, it should not be duplicated or altered.

## 1. [dataprocessing.m](https://github.com/Bishal1022/Fall-Detection/blob/main/dataprocessing.m):
  This code preprocess the data for training the model for yolov2 network. The data is primarily 3D video taken from orbbec astra 3D camera and converted into mp4. The data consist of human walking, falling down, getting up and sitting to test the model against falling down of subject in cluttered background.


## 2. [designtrain.m](https://github.com/Bishal1022/Fall-Detection/blob/main/designtrain.m):
This code primarily focuses on designing of the neural network and training of the model. We have used YOLOv2 neural network for identifying of the subject and drawing a bounding box around it. Further we have checked the Human aspect ratio(HAR) and rate of change of human aspect ratio to identify the posture and speed of change in posture to detect if the subject has fallen down.
    
  Further we have determined the error to evaluate the missRate and average precision.
    
   ![error](https://user-images.githubusercontent.com/62088646/199351805-f7a82ebb-d9cc-46d7-a7a3-bc9aec9ffcae.jpg)


## 3. [data](https://github.com/Bishal1022/Fall-Detection/tree/main/data):
It contains the sample training and testing data in mp4 format used for testing the model.

## 4. [TestData](https://github.com/Bishal1022/Fall-Detection/tree/main/TestData):
It contains of sample frame-wise data used for testing.

## 5. [Utilities](https://github.com/Bishal1022/Fall-Detection/tree/main/utilities):

It contains detectorYoloV2.mat which is the trained YOLOv2 model for human body detection. It is necessary to draw bounding box aroud the human body to get the co-ordinates.
It also contains train and test mat files required to execute the code.

## 6.Results: 

## 7.Achievement:

**◉ Published Paper:**  [Automatic fall detection using Orbbec Astra 3D pro depth images](https://content.iospress.com/articles/journal-of-intelligent-and-fuzzy-systems/ifs219272)

<p align="center">
<img width="700" alt="Screenshot_20230119_204828" src="https://user-images.githubusercontent.com/62088646/213480989-083ccaad-0db1-483f-9a4c-d03e9d18b7bb.png">
</p>



