for subId = 1:length(ALLEEG)
    for trial = 1:length(STUDY.datasetinfo(subId).trialinfo)
        trialNum = STUDY.datasetinfo(subId).trialinfo(trial).trialNum;
        card = trialNumberCondition(subId+9,trialNum); 
        STUDY.datasetinfo(subId).trialinfo(trial).highOrlow =0;
        if card>6||card==3
            STUDY.datasetinfo(subId).trialinfo(trial).highOrlow =1;
        end
    end
end