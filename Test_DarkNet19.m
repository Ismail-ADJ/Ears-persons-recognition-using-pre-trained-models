clear
clc

  folderPath=getappdata(0,'folderPath');
%   folderPath= 'C:\Users\ADMIN\Desktop\MyApp\Final_App\AMI DarkNet19_Test\test';
  disp(folderPath);
 
  load Darknet19.mat
 
digitDatasetPath = fullfile(folderPath);
imds = imageDatastore(digitDatasetPath, ...
   'IncludeSubfolders',true,'LabelSource','foldernames');

trueTesting=0;
falseTesting=0;


tic
for  i=1:length(imds.Labels)
img = readimage(imds,i);

Resizeimg = imresize(img, [256, 256]);

actualLabel = imds.Labels(i);

[label,scores] = classify(myNet,Resizeimg);
 predictedLabel = myNet.classify(Resizeimg);
% 
% Test_scoreDarkNet19(i,:)=scores;
% Test_labelDarkNet19(i,:)=label;
% %  

imshow(Resizeimg);

title(['الشخص المتوقع هو: ' char(predictedLabel) ', الشخص الفعلي هو: ' char(label)])

if (predictedLabel  == actualLabel)
    trueTesting=trueTesting+1;      
else
    falseTesting=falseTesting+1;  
  
%  if (j==1)
%          a=actualLabel;
%   elseif j==2
%       b=actualLabel;
%   elseif   j==3
%       c=actualLabel;
%   elseif  j==4
%       d=actualLabel;
%     else
%  end 
end
end

PtrueTesting=trueTesting*100/length(imds.Labels);
PfalseTesting=falseTesting*100/length(imds.Labels);

disp('truePredicted');
disp(trueTesting);
fprintf('Percent true: %0.2f %%', PtrueTesting);disp('.');
disp('falsePredected');
disp(falseTesting);
fprintf('Percent false: %0.2f %%', PfalseTesting);disp('.');

setappdata(0,'trueTesting',trueTesting)
setappdata(0,'PtrueTesting',PtrueTesting)
setappdata(0,'falseTesting',falseTesting)
setappdata(0,'PfalseTesting',PfalseTesting)

msgbox('انتهى الإختبار');

toc






