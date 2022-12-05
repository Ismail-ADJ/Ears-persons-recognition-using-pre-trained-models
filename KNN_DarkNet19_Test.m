 
 load KNN_Dark_Mld3.mat
 load TestDataKNN_DarkNet
 load Classes
 
 
 result = KNN_Dark_Mld3.predictFcn(Test_scoreDarkNet19)
 
trueTesting=0;
falseTesting=0;


 for  i=1:200
     disp(i)
  predictedLabel =result(i)
  actualLabel   = Test_label2(i)
     if (predictedLabel == actualLabel)
   trueTesting=trueTesting+1;
   else
    
    falseTesting=falseTesting+1;

     end 
 end
PtrueTesting=trueTesting*100/200;
PfalseTesting=falseTesting*100/200;

disp('trueTesting');
disp(trueTesting);disp(PtrueTesting);
disp('falseTesting');
disp(falseTesting);disp(PfalseTesting);

setappdata(0,'trueTesting',trueTesting)
setappdata(0,'PtrueTesting',PtrueTesting)
setappdata(0,'falseTesting',falseTesting)
setappdata(0,'PfalseTesting',PfalseTesting)

 msgbox('انتهى الإختبار');






