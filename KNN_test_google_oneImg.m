
load GoogleMdCosinKNN.mat
load TestDataKNN_google
load Classes.mat

[fname,path]=uigetfile('.jpg','folderPath');

name = erase(fname,'.jpg');

fname=strcat(path,fname);
img=imread(fname);

 Resizeimg = imresize(img, [224, 224]);


 index=str2num(name);
 
%  disp(name)

result = Test_score(index,:);

 predictedLabel = GoogleMdCosinKNN.predictFcn(result)
 actualLabel = Test_label2(index);
%   disp(ActuleLable)
 
imshow(Resizeimg);
title(['الشخص المتوقع هو: ' char(predictedLabel) ', الشخص الفعلي هو: ' char(actualLabel)])



