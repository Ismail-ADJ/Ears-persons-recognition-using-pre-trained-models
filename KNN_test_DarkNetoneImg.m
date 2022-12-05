
load KNN_Dark_Mld3.mat
load TestDataKNN_DarkNet
load Classes.mat

[fname,path]=uigetfile('.jpg','folderPath');
name = erase(fname,'.jpg');
fname=strcat(path,fname);
img=imread(fname);

 Resizeimg = imresize(img, [256, 256]);


 index=str2num(name);
 
%  disp(name)

result = Test_scoreDarkNet19(index,:);

 predictedLabel = KNN_Dark_Mld3.predictFcn(result)
 actualLabel = Test_label2(index);
%   disp(ActuleLable)
 
imshow(Resizeimg);
title(['الشخص المتوقع هو: ' char(predictedLabel) ', الشخص الفعلي هو: ' char(actualLabel)])



