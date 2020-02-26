function dat = Behavior_Datapaths(dataPath,verbose)
% USAGE: dat = Behavior_Datapaths(dataPath,verbose)
%
% dataPath : full path to the raw data folder without / at the end

% Note: always use forward slashes (/) instead of backslashes (/) in path
% definitions as they work in both windows and linux platforms.

if ~exist('verbose','var')
    verbose=1;
end

%%% PATHS THAT POTENTIALLY NEED TO BE UPDATED %%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin<1
    dataPath='/Users/gkeliris/Documents/DATA/Ahmed/Feb2020';
end

% ANIMAL IDs
dat.ratIDs={'rat3907L','rat3908LR','rat3910LR','rat3911L','rat3912LR','rat3913L','rat3914LR','rat3915L','rat3916LR',...
            'rat3917L','rat3918LR','rat3919L','rat3920LR'};
datafolders={'/Rat_07','/Rat_08','/Rat_10','/Rat_11','/Rat_12','/Rat_13','/Rat_14','/Rat_15','/Rat_16','/Rat_17',...
              '/Rat_18','/Rat_19','/Rat_20'};

%
%% RAW DATA
% Raw data

%% Rat_07
dat.pre1.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-01-15-131211.txt');
dat.pre2.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-01-16-143109.txt');
dat.pre3.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-01-22-134106.txt');
dat.pre4.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-01-23-140549.txt');
dat.pre5.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-01-30-121128.txt');
dat.pre6.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-02-05-110821.txt');
dat.pre7.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-02-06-125652.txt');



%% Rat_08
dat.pre1.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-01-15-131211.txt');
dat.pre2.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-01-16-143109.txt');
dat.pre3.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-01-22-134106.txt');
dat.pre4.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-01-23-140549.txt');
dat.pre5.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-01-30-121128.txt');
dat.pre6.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-02-05-110821.txt');
dat.pre7.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-02-06-125652.txt');



%% Rat_10
dat.pre1.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-01-15-131211.txt');
dat.pre2.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-01-16-143109.txt');
dat.pre3.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-01-22-134106.txt');
dat.pre4.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-01-23-140549.txt');
dat.pre5.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-02-06-125652.txt');


%% Rat_11
dat.pre1.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-01-15-102530.txt');
dat.pre2.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-01-16-112935.txt');
dat.pre3.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-01-23-114935.txt');
dat.pre4.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-01-30-134021.txt');
dat.pre5.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-02-05-123033.txt');
dat.pre6.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-02-06-142422.txt');



%% Rat_12
dat.pre1.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-01-15-102530.txt');
dat.pre2.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-01-16-112935.txt');
dat.pre3.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-01-22-111354.txt');
dat.pre4.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-01-23-114935.txt');
dat.pre5.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-01-30-134021.txt');
dat.pre6.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-02-05-123033.txt');
dat.pre7.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-02-06-142422.txt');



%% Rat_13
dat.pre1.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-01-15-102530.txt');
dat.pre2.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-01-16-112935.txt');
dat.pre3.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-01-23-114935.txt');
dat.pre4.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-01-30-134021.txt');
dat.pre5.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-02-05-123033.txt');
dat.pre6.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-02-06-142422.txt');



%% Rat_14
dat.pre1.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-01-15-102530.txt');
dat.pre2.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-01-16-112935.txt');
dat.pre3.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-01-22-111354.txt');
dat.pre4.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-01-23-114935.txt');
dat.pre5.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-01-30-134021.txt');
dat.pre6.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-02-05-123033.txt');
dat.pre7.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-02-06-142422.txt');


%% Rat_15
dat.pre1.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-01-21-150547.txt');
dat.pre2.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-01-16-132652.txt');
dat.pre3.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-01-22-123551.txt');
dat.pre4.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-01-23-130438.txt');
dat.pre5.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-01-30-151838.txt');
dat.pre6.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-02-05-141948.txt');
dat.pre7.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-02-05-141948.txt');


%% Rat_16
dat.pre1.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-01-15-120420.txt');
dat.pre2.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-01-16-160717.txt');
dat.pre3.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-01-22-123551.txt');
dat.pre4.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-01-23-130438.txt');
dat.pre5.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-01-30-151838.txt');
dat.pre6.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-02-05-141948.txt');

%% Rat_17
dat.pre1.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-01-15-120420.txt');
dat.pre2.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-01-16-132652.txt');
dat.pre3.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-01-22-123551.txt');
dat.pre4.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-01-23-130438.txt');
dat.pre5.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-01-30-151838.txt');
dat.pre6.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-02-06-160351.txt');


%% Rat_18
dat.pre1.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3918LR-2020-01-15-120420.txt');
dat.pre2.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3918LR-2020-01-16-132652.txt');
dat.pre3.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3918LR-2020-01-22-123551.txt');
dat.pre4.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3918LR-2020-01-23-130438.txt');
dat.pre5.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3918LR-2020-01-30-151838.txt');
dat.pre6.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3918LR-2020-02-05-141948.txt');


%% Rat_19
dat.pre1.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3919L-2020-01-15-142435.txt');
dat.pre2.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3919L-2020-01-16-160717.txt');
dat.pre3.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3919L-2020-01-22-152603.txt');
dat.pre4.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3919L-2020-01-23-151928.txt');
dat.pre5.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3919L-2020-01-30-162823.txt');
dat.pre6.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3919L-2020-02-05-154031.txt');
dat.pre7.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3919L-2020-02-06-171321.txt');


%% Rat_20
dat.pre1.(dat.ratIDs{13})=cat(2,dataPath,datafolders{13},'/3920LR-2020-01-15-142435.txt');
dat.pre2.(dat.ratIDs{13})=cat(2,dataPath,datafolders{13},'/3920LR-2020-01-16-160717.txt');
dat.pre3.(dat.ratIDs{13})=cat(2,dataPath,datafolders{13},'/3920LR-2020-01-22-152603.txt');
dat.pre4.(dat.ratIDs{13})=cat(2,dataPath,datafolders{13},'/3920LR-2020-01-23-151928.txt');
dat.pre5.(dat.ratIDs{13})=cat(2,dataPath,datafolders{13},'/3920LR-2020-01-30-162823.txt');
dat.pre6.(dat.ratIDs{13})=cat(2,dataPath,datafolders{13},'/3920LR-2020-02-05-154031.txt');
dat.pre7.(dat.ratIDs{13})=cat(2,dataPath,datafolders{13},'/3920LR-2020-02-06-171321.txt');

%% VERIFY THAT ALL FILES IN STRUCTURE ARE EXISTING
% Note: exclude fields that are not files (e.g. IDs)
% if verbose

if verbose
    clear global;
    global s;
    unfold(dat,false);

    for si=1:numel(s)
        if isempty(strfind(s{si},'ratIDs'))
            if ~isfile(s{si})
                fprintf('\nWARNING! NOT FOUND File: %s\n\n',...
                    s{si});
            else
                fprintf('VERIFIED File: %s\n',s{si});
            end
        end
    end
    clear global
end
