clear
clc

load Darknet19.mat
load KNN_Dark_Mld3.mat
tic
[fname,path]=uigetfile('.jpg','folderPath');
fname=strcat(path,fname);
img=imread(fname);

Resizeimg = imresize(img, [256, 256]);

[label,scores] = classify(myNet,Resizeimg);
predictedLabel = myNet.classify(Resizeimg);
KNN_predictedLabel = KNN_Dark_Mld3.predictFcn(scores);

imshow(Resizeimg);
title(['الشخص المتوقع هو: ' char(KNN_predictedLabel) ])



%% 

toc


