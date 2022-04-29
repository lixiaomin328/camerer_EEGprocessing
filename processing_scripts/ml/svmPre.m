%svm data processing
dataCondition1 = [];
dataCondition2 = [];
%dataTmp is ERSP*trial*component
for subId = 1:length(dataTmp)
    dataOneSub = dataTmp{1,subId};
    dataOneSubCondition1 =dataOneSub{1,1};
    dataOneSubCondition2 =dataOneSub{2,1};
    for ic = 1:size(dataOneSubCondition1,3)
        for epoch = 1:size(dataOneSubCondition1,2)
        dataCondition1 = [dataCondition1,dataOneSubCondition1(:,epoch,ic)];
        end
        for epoch = 1:size(dataOneSubCondition2,2)
        dataCondition2 = [dataCondition2,dataOneSubCondition2(:,epoch,ic)];
        end
    end
end
y =[ones(size(dataCondition1,1),1);zeros(size(dataCondition2,1),1)];
%%
%load('../sourceDataML/svmSource2.mat')
y =[ones(size(datavals{1,1},2),1);zeros(size(datavals{2,1},2),1)];
dataSVM = [datavals{1,1},datavals{2,1}];
dataALL = [dataSVM',y];
%random_data = dataALL(randperm(size(dataALL, 1)), :);
csvwrite('../sourceDataML/svmSOURCE2_pfc.csv',dataALL)
%%
[Mdl,b,c] = mnrfit(dataNew(:,1:end-1),dataNew(:,end)+1);
%insample error
[predictedY,score] = predict(Mdl,dataNew(:,1:end-1));
errorRate = sum(abs(y-predictedY))/size(dataNew,1);
CVSVMModel = crossval(Mdl);
classLoss = kfoldLoss(CVSVMModel);

%% Lowpass
resampled =[];
for i = 1:length(dataSVM)
    resampleOneTrial=lowpass(dataSVM(:,i),0.25);
    resampled = [resampled,resampleOneTrial];
end

%% Dimension selection
dimension = [];
for i = 1:768
[h,p]= ttest2(datavals{1,1}(i,:),datavals{2,1}(i,:));
dimension = [dimension;p];
end
%% 0.05 Feature
dataNew = dataSVM(dimension<0.05,:);
dataNew = [dataNew',y];
csvwrite('../sourceDataML/newFeatureSVM_pfc.csv',dataNew)
%% four feature
newFeature= [];
meanFeature = mean(dataSVM,1);
maxFeature = max(dataSVM);
varFeature = var(dataSVM,1);
minFeature = min(dataSVM);
newFeature= [meanFeature;maxFeature;varFeature;minFeature];
%% plot
data1 = datavals{1,1}(:,randperm(size(datavals{1,1}, 2)));
data2 = datavals{2,1}(:,randperm(size(datavals{2,1}, 2)));
for i = 1:100

    plot(data2(:,i))
    hold on
end
%% Fouriour data
y =[ones(size(datavals{1,1},2),1);zeros(size(datavals{1,1},2),1)];
    dataCondition1 = datavals{1,1}(301:556,:);
    dataCondition2 = datavals{2,1}(301:556,1:length(datavals{1,1}));
dataFouriour1 = real(fft(dataCondition1));
dataFouriour2 = real(fft(dataCondition2));
dataSVM = [dataFouriour1,dataFouriour2];
dataALL = [dataSVM',y];
csvwrite('../sourceDataML/svmSOURCE2_fouriorcluster7.csv',dataALL)
%% ERSP feature
y =[ones(size(allersp{1,1},3),1);zeros(size(allersp{1,1},3),1)];
    dataCondition1 = allersp{1,1}(38:39,120:150,:);
    dataCondition2 = allersp{2,1}(38:39,120:150,1:length(allersp{1,1}));
    dataCondition1 = reshape(dataCondition1,[],size(dataCondition1,3));
    dataCondition2 = reshape(dataCondition2,[],size(dataCondition2,3));
dataSVM = [dataCondition1,dataCondition2];
dataALL = [dataSVM',y];
csvwrite('../sourceDataML/sourceERSP3.csv',dataALL)
%% ERSP2 feature
y =[ones(size(allersp{1,1},3),1);zeros(size(allersp{1,1},3),1)];
    dataCondition1 = allersp{1,1}(38:40,110:130,:);
    dataCondition2 = allersp{2,1}(38:40,110:130,1:length(allersp{1,1}));
    dataCondition1 = reshape(dataCondition1,[],size(dataCondition1,3));
    dataCondition2 = reshape(dataCondition2,[],size(dataCondition2,3));
dataSVM = [dataCondition1,dataCondition2];
dataALL = [dataSVM',y];
csvwrite('../sourceDataML/sourceERSP4.csv',dataALL)
%% ERSP2 feature high low card
y =[ones(size(allersp{1,1},3),1);zeros(size(allersp{1,1},3),1)];
    dataCondition1 = allersp{1,1}(22:24,110:120,:);
    dataCondition2 = allersp{2,1}(22:24,110:120,1:length(allersp{1,1}));
    dataCondition1 = reshape(dataCondition1,[],size(dataCondition1,3));
    dataCondition2 = reshape(dataCondition2,[],size(dataCondition2,3));
dataSVM = [dataCondition1,dataCondition2];
dataALL = [dataSVM',y];
csvwrite('../sourceDataML/sourceERSP4.csv',dataALL)
%%
y =[ones(size(allersp{1,1},3),1);zeros(size(allersp{1,1},3),1)];
    dataCondition1 = allersp{1,1};
    dataCondition2 = allersp{2,1}(:,:,1:length(allersp{1,1}));
    dataCondition1 = reshape(dataCondition1,[],size(dataCondition1,3));
    dataCondition2 = reshape(dataCondition2,[],size(dataCondition2,3));
dataSVM = [dataCondition1,dataCondition2];
dataALL = [dataSVM',y];
    save('../sourceDataML/sourceNNersp2.mat','dataALL')