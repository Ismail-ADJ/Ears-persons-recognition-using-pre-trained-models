clear
clc

% load GoogleMdCosinKNN.mat
load GoogleNet.mat
load Classes

tic

[fname,path]=uigetfile('.jpg','folderPath');
name = erase(fname,'.jpg');
index=str2num(name);
result = Test_label2(index,:);
% disp(result)


fname=strcat(path,fname);
img=imread(fname);

 Resizeimg = imresize(img, [224, 224]);

[label,scores] = classify(trainedNet,Resizeimg);
actualLabel = result
% AAAA=scores
% % disp(scores)
% disp(label)
predictedLabel = trainedNet.classify(Resizeimg);
% KNN_predictedLabel = GoogleMdCosinKNN.predictFcn(scores);

imshow(Resizeimg);

title(['الشخص المتوقع هو: ' char(predictedLabel) ', الشخص الفعلي هو: ' char(actualLabel)])


 

toc


