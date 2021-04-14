## 4th-year Honour Project XDU-HWU
Thanks for your visiting.

This is my 4th-year project files. Many  thanks  to  my  supervisors,  Prof.  Marc  Desmulliez  and  Dr.  Sumanth  Kumar Pavuluri for their help in the project.They guided me through the project and provided sensor data in training and testing the proposed model.

# Intro
As quality of food is paid increasing attention, a real-time, accurate food detection method is required by food manufacturers. MicroSense Technology Ltd. had developed a contactless, accurate and non-destructive sensor, the “FoodSense” sensor. The sensor receives  reflected  signals of  the  ingredient by a  modified frequency modulated continued wave(FMCW) radar to detect the permittivity and permeability of food products. This project aims to implement a pattern recognition system to detect various food types.A food of unqualified quality can be identified because it has a different physical property than a qualified food. This pattern recognition system was based on convolutional neural network(CNN), which isa hotspot of deep learning in the field of computer vision in recent years.The CNN was employed in the project because of its wide applications in computer vision and high accuracy in large amounts of data processing.The CNN contained structures of convolution layers, activation layers and pooling layers, which could effectively extract local features of an image. The data pre-processing was simpler than that in ANNs. CNN was trained to process a data set consisting of spectrogram fragments.The validation and tests were also conducted to analyse the performance of CNN. For the tasks in this project, CNN could achieve more than 96% accuracy with aprocessing time less than 49.38us per samplein test. 

# To run the codes
Please download the MATLAB 2019 from Mathwork website and contact with me to download the data files. To run the codes, follow the instructions below.
1. Modify the file path in "make_dat.m".
    Run the "make_dat.m".
2. Run the "recipe_##_process.m"
3. Build a folder as the image data set. 
    Modify the file path to the folder in "CalNumPerImage.m". 
4. Run the "spectro_make.m".
5. Build subfolder for each recipe. The name of subfolder is the label of classification. 
    Store images into corresponding subfolder according the name of produced images.
6. Run the "CNN_TrainingAndTest.m"  

If you have any question about the project, please do not heasitate to contact with me: <jeff_z.wu@qq.com>
