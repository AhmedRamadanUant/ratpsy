function data = gk_ratpsy_data_import(fileIn,ratNum)
% USAGE: data = gk_ratpsy_data_import(fileIn,[ratNum])
%
% INPUT:
% - fileIn      :the path of the datafile
% - ratNum       :[optional default=Nan] a number identifier the rat
%
% OUTPUT:
% - data        : a table with the relevant data
% - N           : some performance numbers for psychometric plots
%
% GAK

if nargin==1
    ratID=nan;
end
fid=fopen(fileIn);
% first skip the first 5 lines and then read the events to be sure the numbers are correct
tmp=textscan(fid,'S { %[^}]','Headerlines',5);
S=textscan(tmp{1}{1},'%s %d','delimiter',':,');
tmp=textscan(fid,'E { %[^}]','Headerlines',1);
E=textscan(tmp{1}{1},'%s %d','delimiter',':,');

% The following skips the first 2 lines, then reads the whole file in 3
% columns (a character, a double and a string) skipping the rest of things
% if some columns have more that 3 fields
t=textscan(fid,'%c %d %s %*[^\n]','HeaderLines',2);

% find the lines starting with D as they only have a number in third column
% and this makes things easier to look for
Ds=find(t{1}=='D');
events=cellfun(@str2num,t{3}(Ds));
eventTimes=t{2}(Ds);
trialStarts=find(events==1); % this is the beginning of trials (we ignore repeats:3)
trialNumbers=1:numel(trialStarts);
currTrial=find(events==2);
trialStartTimes=eventTimes(trialStarts);
curTrialTimes=eventTimes(currTrial);
tTypesStr=t{3}(Ds(trialStarts)+4); % TrialTypes are always 4 lines further than trial starts
trialType=cellfun(@(x) sscanf(x,'trialType:%d'), tTypesStr)+1; % read the number and add 1
initPokeHold=find(events==3);
curTrialStr=t{3}(Ds(initPokeHold)+1); 
curTrialNumber=cellfun(@(x) sscanf(x,'n_trials:%d'), curTrialStr)

% for  i=1:numel(currTrial)
%     curTrialNumber(i)=max(find(trialStartTimes<curTrialTimes(i)));
% end



centerPokes=find(events==11);
centerPokeTimes=eventTimes(centerPokes);
stimulusOn=find(events==6);
stimulusOnTimes=eventTimes(stimulusOn);
leftResp=find(events==13);
leftRespTimes=eventTimes(leftResp);
rightResp=find(events==12);
rightRespTimes=eventTimes(rightResp);
anyResp=find(events==12 | events==13);
anyRespTimes=eventTimes(anyResp);
trialEnds=find(events==8 | events==10);
trialEndTimes=eventTimes(trialEnds);

for ti=1:numel(trialStarts)-1
    if ti<numel(stimulusOn)
        preMature(ti,1)=numel(find(centerPokeTimes>trialEndTimes(ti) & centerPokeTimes<trialStartTimes(ti+1)));
    end
    firstResp=min(find(anyRespTimes>stimulusOnTimes(ti) & anyRespTimes<trialEndTimes(ti)));
    if  ~isempty(firstResp)
        firstRespTime=anyRespTimes(firstResp);
        reactionTime(ti,1)=firstRespTime-stimulusOnTimes(ti);
    else
        reactionTime(ti,1)=inf;
    end
end
%figure;
%hold on; histogram(reactionTime(1:end-1),0:10:1000)

% Look for the outcome to define the response and correct variables
wL=[cellfun(@(x) ~isempty(strfind(x,'n_wrong_L')), t{3},'UniformOutput',false)];
respR_w=find([wL{:}]);
wR=[cellfun(@(x) ~isempty(strfind(x,'n_wrong_R')), t{3},'UniformOutput',false)];
respL_w=find([wR{:}]);
cL=[cellfun(@(x) ~isempty(strfind(x,'n_correct_L')), t{3},'UniformOutput',false)];
respL_c=find([cL{:}]);
cR=[cellfun(@(x) ~isempty(strfind(x,'n_correct_R')), t{3},'UniformOutput',false)];
respR_c=find([cR{:}]);

respo=sortrows([[respL_c' 1*ones(length(respL_c),1)];...
                   [respR_c' 2*ones(length(respR_c),1)];...
                   [respL_w' 1*ones(length(respL_w),1)];...
                   [respR_w' 2*ones(length(respR_w),1)]]);
corre=sortrows([[respL_c' ones(length(respL_c),1)];...
                   [respR_c' ones(length(respR_c),1)];...
                   [respL_w' zeros(length(respL_w),1)];...
                   [respR_w' zeros(length(respR_w),1)]]);

response=respo(1:numel(trialStarts)-1,2);
correct=corre(1:numel(trialStarts)-1,2);
trialType=trialType(1:length(response));
stimOnTime=stimulusOnTimes(1:numel(trialStarts)-1);
trialStart=trialStartTimes(1:numel(trialStarts)-1);
trialEnd=trialEndTimes(1:numel(trialStarts)-1);
ratNumber=repmat(ratNum,numel(trialStarts)-1,1);
%%%%%
N.condsort=[1:7 12:-1:8];
N.stimulus=[-60:10:-20 0 0 60:-10:20]/60; % Michelson contrast
for cc=[N.condsort]
    stimType(trialType(1:numel(trialStarts)-1)==cc,1)=N.stimulus(cc);
end

if numel(preMature)<numel(trialStarts)-1
    preMature(end+1:numel(trialStarts)-1)=0;
end
% Create that data table
data=table(trialType,stimType,response,correct,stimOnTime,reactionTime,trialStart,trialEnd,preMature,ratNumber);













