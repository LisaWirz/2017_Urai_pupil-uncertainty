% figure 6 overview
load(sprintf('%s/Data/GrandAverage/historyweights_%s.mat', mypath, 'pupil+uncertainty'));
subplot(4,4,1); plotBetasSwarm([dat.response_pupil(:, 1) ...
    dat.stimulus_pupil(:, 1)  dat.response_rt(:, 1) dat.stimulus_rt(:, 1)], ...
    [0 0 0; 0 0 0; 0 0 0; 0 0 0]);
set(gca, 'xtick', 1:4, 'xticklabel', ...
    {'Pupil * choice', 'Pupil * stimulus', 'Unc * choice', 'Unc * stimulus'}, ...
    'xticklabelrotation', -30);

subplot(4,4,3); plotBetasSwarm([dat.correct_pupil(:, 1) ...
    dat.incorrect_pupil(:, 1)  dat.correct_rt(:, 1) dat.incorrect_rt(:, 1)], ...
    [0 0 0; 0 0 0; 0 0 0; 0 0 0]);
set(gca, 'xtick', 1:4, 'xticklabel', ...
    {'Pupil * correct', 'Pupil * error', 'Unc * correct', 'Unc * error'}, ...
    'xticklabelrotation', -30);

%% now 
subplot(4,4,9); SjCorrelation('pupil', 'response', 'pupil+uncertainty');
ylim([-0.4 0.2]); ylabel('Pupil * response');
subplot(4,4,10); SjCorrelation('rt', 'response', 'pupil+uncertainty');
ylim([-0.4 0.5]); ylabel('Uncertainty * response');

print(gcf, '-dpdf', sprintf('%s/Figures/uncertaintyFruend.pdf', mypath));
