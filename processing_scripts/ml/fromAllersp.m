load('/Users/xiaominli/Documents/Documents/eeg/vmpfcRaw_allersp.mat')
bet = allersp{1,1};
check = allersp{2,1};
bet = bet(1:28,90:115,:);%dimension select
check = check(1:28,90:115,:);
dimension = size(bet);
bet = reshape(bet,[dimension(1)*dimension(2),3668]);
check = reshape(check,[dimension(1)*dimension(2),5177]);
all = [bet';check'];
all = [log10(all)*10,[zeros(3668,1);ones(5177,1)]];
writematrix(all,'/Users/xiaominli/Documents/Documents/eeg/processing_scripts/sourceDataML/vmpfc728.csv')
