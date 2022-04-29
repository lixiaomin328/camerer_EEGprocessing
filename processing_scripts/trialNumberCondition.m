function [card,bet] = trialNumberCondition(subId,trialNum)
behaviorDataPath = '../../poker/data_processing_scripts/DataMat/';
load([behaviorDataPath,'participant_',num2str(subId),'.mat']);
behavioralData = dataStructure;
allCards = behavioralData.P1card;
card =allCards(trialNum);
bet = behavioralData.player1ActionCheck_keys(trialNum);