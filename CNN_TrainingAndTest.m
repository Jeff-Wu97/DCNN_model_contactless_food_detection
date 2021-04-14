%% Load and explore image data
SpectroDatasetPath = fullfile('D:\','All_MATLAB_Codes_ZheWu','CNNCodes','ImageDataSet');
imds = imageDatastore(SpectroDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');
figure(1);
perm = randperm(2509,20);
for i = 1:20               
    subplot(4,5,i);
    imshow(imds.Files{perm(i)});
end
labelCount = countEachLabel(imds);

img = readimage(imds,1);
graph_size=size(img);

%% Specify Training and Validation Sets
[imdsTrain,imdsValidationTest] = splitEachLabel(imds,0.5,'randomize');
[imdsValidation,imdsTest] = splitEachLabel(imdsValidationTest,0.5,'randomize');

%% Define Network Architecture
layers = [
    imageInputLayer(graph_size,'Name','input')
    
    convolution2dLayer(11,2,'Padding','same','Name','conv1')
    batchNormalizationLayer('Name','BN_1')
    reluLayer('Name','relu1')
    
    maxPooling2dLayer(2,'Stride',2,'Name','maxpool_1')
    
    convolution2dLayer(5,3,'Padding','same','Name','conv2')
    batchNormalizationLayer('Name','BN2')
    reluLayer('Name','relu2')
    
    maxPooling2dLayer(2,'Stride',2,'Name','maxpool_2')
    
    convolution2dLayer(3,3,'Padding','same','Name','conv3')
    batchNormalizationLayer('Name','BN3')
    reluLayer('Name','relu3')
    
    fullyConnectedLayer(6,'Name','FC')
    softmaxLayer('Name','softmax')
    classificationLayer('Name','classOutput')];

%% Specify Training Options
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',180, ...%300
    'MiniBatchSize',30,...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

%% Train Network Using Training Data
net = trainNetwork(imdsTrain,layers,options);

%% Classify Validation Images and Compute Accuracy
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation);
fprintf('accuracy = %f\n',accuracy);

%% Display Structure of CNN
lgraph = layerGraph(layers);
figure(2),
plot(lgraph);
%% Display Confusion Matrix
figure(3),
plotconfusion(imdsValidation.Labels,YPred),
title('Validation Confusion Matrix');

YPred_Test = classify(net,imdsTest);
figure(4),
plotconfusion(imdsTest.Labels,YPred_Test),
title('Test Confusion Matrix');