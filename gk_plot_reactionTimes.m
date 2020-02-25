function gk_plot_reactionTimes(cond1, cond2, condNames)
% USAGE: gk_plot_reactionTimes(cond1, cond2, condNames)
%
% GAK Aug 2019

% FIGURE REACTION TIMES
figure; hold on;
median_RT_cond1=median(cond1.reactionTime);
histogram(cond1.reactionTime,0:10:1000);
median_RT_cond2=median(cond2.reactionTime);
histogram(cond2.reactionTime,0:10:1000);
Prt=ranksum(double(cond1.reactionTime),double(cond2.reactionTime));
xlabel('time [ms]'); ylabel('frequency');
title(['Rank sum test for equal medians: P < ',num2str(Prt)]);
legend(['median RT ', condNames{1}, ' = ',num2str(median_RT_cond1),' ms'],...
    ['median RT ', condNames{2}, ' = ',num2str(median_RT_cond2),' ms']);