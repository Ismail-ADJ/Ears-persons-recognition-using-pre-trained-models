clear
clc

 folderPath=getappdata(0,'folderPath');

  load GoogleNet.mat
 
digitDatasetPath = fullfile(folderPath);
imds = imageDatastore(digitDatasetPath, ...
   'IncludeSubfolders',true,'LabelSource','foldernames');  
trueTesting=0;
falseTesting=0;

tic
for  i=1:length(imds.Labels)
img = readimage(imds,i);
actualLabel = imds.Labels(i);

Resizeimg = imresize(img, [224, 224]);

[label,scores] = classify(trainedNet,Resizeimg);

predictedLabel = trainedNet.classify(Resizeimg);

Test_score(i,:)=scores;
Test_label(i,:)=label;

% Train_Score(i,:)=scores;
% Train_label(i,:)=label;



imshow(Resizeimg);
title(['Predicted: ' char(predictedLabel) ', Actual: ' char(actualLabel)])


%% 
if (predictedLabel == actualLabel)
    trueTesting=trueTesting+1;   
    
else
    
    falseTesting=falseTesting+1;

end
end
PtrueTesting=trueTesting*100/length(imds.Labels);
PfalseTesting=falseTesting*100/length(imds.Labels);

disp('trueTesting');
disp(trueTesting);disp(PtrueTesting);
disp('falseTesting');
disp(falseTesting);disp(PfalseTesting);


disp('trueTesting');
disp(trueTesting);
fprintf('Percent true: %0.2f %%', PtrueTesting);disp('.');
disp('falseTesting');
disp(falseTesting);
fprintf('Percent false: %0.2f %%', PfalseTesting);disp('.');


setappdata(0,'trueTesting',trueTesting)
setappdata(0,'PtrueTesting',PtrueTesting)
setappdata(0,'falseTesting',falseTesting)
setappdata(0,'PfalseTesting',PfalseTesting)

msgbox('انتهى الإختبار');

toc
