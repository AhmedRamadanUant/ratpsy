function data = gk_ratpsy_data_import(info,ratNum)
% USAGE: data = gk_ratpsy_data_import(info,[ratNum])
%
% INPUT:
% - info        :the matlab structure returned from gk_pyControl_read
% - ratNum      :[optional default=Nan] a number identifier the rat
%
% OUTPUT:
% - data        : a table with the relevant data
%
% v3.0 GAK 4 Mar 2020

if nargin==1
    ratNum=nan;
end


% define reference events and prints via E_P_cells (i.e. {{Es},{Ps}}
trialStart={{},{'correct'}};
trialEnd={{'ITI','aborted_fixation','aborted_response'},{}};
%trialNum={{},{'n_trials'}};
trialPWL={{},{'pW_L'}};
trialPWR={{},{'pW_R'}};
trialType={{},{'pW_L'}};
trialResponse={{},{'n_correct_left','n_correct_right','n_wrong_left',...
    'n_wrong_right','n_aborted_fixation','n_aborted_response'}};
trialSuccess={{'left_reward','right_reward'},{}};
trialWrong={{},{'n_wrong_left','n_wrong_right'}};
trialAbort={{},{'n_aborted_fixation','n_aborted_response'}};
trialStimON={{'display_stimulus'},{}};
trialActive={{'reward_available'},{}};
trialAbortResponse={{},{'n_aborted_response'}};


%%
trStart=gk_pyControl_collapse_events(info,trialStart);
trEnd=gk_pyControl_collapse_events(info,trialEnd,trStart);
%trNum=gk_pyControl_collapse_events(info,trialNum,trStart,trEnd);
trType=gk_pyControl_collapse_events(info,trialType,trStart,trEnd);
trResponse=gk_pyControl_collapse_events(info,trialResponse,trStart,trEnd);
trPWL=gk_pyControl_collapse_events(info,trialPWL,trStart,trEnd);
trPWR=gk_pyControl_collapse_events(info,trialPWR,trStart,trEnd);
trSuccess=gk_pyControl_collapse_events(info,trialSuccess,trStart,trEnd);
trWrong=gk_pyControl_collapse_events(info,trialWrong,trStart,trEnd);
trAbort=gk_pyControl_collapse_events(info,trialAbort,trStart,trEnd);
trAbortResponse=gk_pyControl_collapse_events(info,trialAbortResponse,trStart,trEnd);
trStimON=gk_pyControl_collapse_events(info,trialStimON,trStart,trEnd);
trActive=gk_pyControl_collapse_events(info,trialActive,trStart,trEnd);
trActiveMove=gk_pyControl_subtract_events(trActive,trAbortResponse);
trSidePoke=gk_pyControl_subtract_events(trResponse,trAbort);


[stimRT, trials1]=gk_pyControl_timediff(trActive,trStimON);
[moveRT, trials2]=gk_pyControl_timediff(trSidePoke,trActiveMove);


%% Define the variables to enter in the data table
trialNumber=trEnd.trialNum;
trialTypes = gk_pyControl_getCategories(trType,{'C10','C1','C2','C3','C4','C5','C6','C7','C8','C9'});
pw_L = gk_pyControl_getCategories(trPWL);
pw_R = gk_pyControl_getCategories(trPWR);
if isempty(trAbortResponse.times)
    [~,responses]=gk_pyControl_getCategories(trResponse,[],{'aF','L','R','L','R'});
    [~,outcome]=gk_pyControl_getCategories(trResponse,[],{'abort','correct','correct','wrong','wrong'});
else
    [~,responses]=gk_pyControl_getCategories(trResponse,[],{'aF','aR','L','R','L','R'});
    [~,outcome]=gk_pyControl_getCategories(trResponse,[],{'abort','abort','correct','correct','wrong','wrong'});
end

RT_stim=NaN(trialNumber(end),1); RT_stim(trials1)=stimRT;
RT_move=NaN(trialNumber(end),1); RT_move(trials2)=moveRT;

ratNumber=repmat(ratNum,numel(trialNumber),1);

%% Create that data table
data=table(trialNumber,trialTypes,pw_L,pw_R,responses,outcome,RT_stim,RT_move,ratNumber);

%data=table(trialType,stimType,response,correct,stimOnTime,reactionTime,trialStart,trialEnd,preMature,ratNumber);










