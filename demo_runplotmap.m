


clc
clear

% load test data
load testdata.mat

close all
ytic = -0.6:0.2:0.6;
[ch,~] = plotmap(datain, 'Equidistant Cylindrical',...
    'ytics',ytic,... % 'latlon', {latx,lonx}
    'globres', 0.25,'latlim', [-89.5,89.9], 'lonlim', [-180,179.9],... % 'latlim', [-20,15], 'lonlim', [-85,-30]
    'krange', [min(ytic),max(ytic)], 'colormap', '*RdYlGn',...
    'labelname', 'I am colorbar label',...
    'fontsize', 12,...
    'pvalue',pval,...
    'title','I am figure title');
