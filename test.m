clear
clc
% first step, load your data
load test_data

% final step, plot
plotmap('Robinson', data,... % projection name || data to show
        0.5, [-90,90], [-180,180],... % spatial resolution (0.5)  || spatial range to show
        'cmap12', [0,1800], 'Replace your figure name', 14); 
% colormap name : cmap1 or ... cmap12 || set colormap range || set figure name || set fontsize