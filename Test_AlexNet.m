
% folderPath=getappdata(0,'folderPath');

folderPath='C:\Users\ADMIN\Desktop\MyApp\Final_App\AMI AlexNet_Test\test';

load alexNet.mat

digitDatasetPath = fullfile(folderPath);
imds = imageDatastore(digitDatasetPath, ...
   'IncludeSubfolders',true,'LabelSource','foldernames');  
trueTesting=0;
falseTesting=0;
j=0;
tic
for  i=1:length(imds.Labels)
img = readimage(imds,i);
actualLabel = imds.Labels(i);

[label,scores] = classify(myNet,img);

predictedLabel = myNet.classify(img);

Test_score_Alex(i,:)=scores;
Test_label_Alex(i,:)=label;

% Train_Score_Alex(i,:)=scores;
% Train_label_Alex(i,:)=label;



% imshow(Resizeimg);
title(['Predicted: ' char(predictedLabel) ', Actual: ' char(actualLabel)])

if (predictedLabel == actualLabel)
    trueTesting=trueTesting+1;   
    
else
    falseTesting=falseTesting+1; 
    j=j+1;
    if (j==1)
         a=actualLabel;
  elseif j==2
      b=actualLabel;
  elseif   j==3
      c=actualLabel;
  elseif  j==4
      d=actualLabel;
      elseif  j==5
      e=actualLabel;
      elseif  j==6
      f=actualLabel;
      elseif  j==7
      g=actualLabel;
   end 
end
 
end
PtrueTesting=trueTesting*100/length(imds.Labels);
PfalseTesting=falseTesting*100/length(imds.Labels);

% disp('trueTesting');
% disp(trueTesting);disp(PtrueTesting);
% disp('falseTesting');
% disp(falseTesting);disp(PfalseTesting);


disp('trueTesting');
disp(trueTesting);
fprintf('Percent true: %0.2f %%', PtrueTesting);disp('.');
disp('falseTesting');
disp(falseTesting);
fprintf('Percent false: %0.2f %%', PfalseTesting);disp('.');
toc
disp(a);
disp(b);
disp(c);
disp(d);
disp(e);
disp(f);
disp(g);
% yfit = GoogleMdCosinKNN.predictFcn(X)

