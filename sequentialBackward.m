
function [opFeature] = sequentialBackward(classes)


c1=classes(1:160,1:8);
c2=classes(161:320,1:8);
c3=classes(321:480,1:8);
c4=classes(481:640,1:8);

c1Train=c1(1:80,1:8);
c2Train=c2(1:80,1:8);
c3Train=c3(1:80,1:8);
c4Train=c4(1:80,1:8);

cTest(1:80,1:8)=c1(81:160,1:8);
cTest(81:160,1:8)=c2(81:160,1:8);
cTest(161:240,1:8)=c3(81:160,1:8);
cTest(241:320,1:8)=c4(81:160,1:8);

bestFeature=ones(1,size(classes,2));
bestfromLayer=ones(1,size(classes,2));
lastBest=ones(1,size(classes,2));
answerFeature=ones(1,size(classes,2));

for i=1:size(bestfromLayer,2)-1
    for j=1:size(bestfromLayer,2)
           if  lastBest(1,j)==1
                lastBest(1,j)=0;
                if(calcacc(cTest,c1Train,c2Train,c3Train,c4Train,bestfromLayer) < calcacc(cTest,c1Train,c2Train,c3Train,c4Train,lastBest))
                    bestfromLayer=lastBest;
                end
                lastBest(1,j)=1;
            end
        
        if j==size(bestfromLayer,2)
            if (calcacc(cTest,c1Train,c2Train,c3Train,c4Train,bestfromLayer)>calcacc(cTest,c1Train,c2Train,c3Train,c4Train,answerFeature))
                answerFeature=bestfromLayer;
            end
            lastBest=bestfromLayer;
        end
        
        
    end
end
disp("SBS");
disp("Optimum feature subset: ");
disp(answerFeature);
disp("Classification Accuracy:" );
disp("%"+calcacc(cTest,c1Train,c2Train,c3Train,c4Train,answerFeature)*100);
opFeature = answerFeature;

end
