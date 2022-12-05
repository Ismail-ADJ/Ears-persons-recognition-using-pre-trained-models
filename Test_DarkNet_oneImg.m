clear
clc

load Darknet19.mat
load Classes
tic
[fname,path]=uigetfile('.jpg','folderPath');
name = erase(fname,'.jpg');
index=str2num(name);
result = Test_label2(index,:);

fname=strcat(path,fname);
img=imread(fname);

Resizeimg = imresize(img, [256, 256]);

[label,scores] = classify(myNet,Resizeimg);
predictedLabel = myNet.classify(Resizeimg);
actualLabel = result
% KNN_predictedLabel = KNN_Dark_Mld3.predictFcn(scores);

imshow(Resizeimg);
title(['الشخص المتوقع هو: ' char(predictedLabel) ', الشخص الفعلي هو: ' char(actualLabel)])




%% 

toc


