%% This script developed for generating map using specific data in matlab

% Coded by Kun Zhang, zhangkun322@foxmail.com
% Lanzhou University, 2018.1.9
% Modified at 2018.10.8 at SUStech, Shenzhen

% Note : need <m_map> toolbox, it can be downloaded at : https://www.eoas.ubc.ca/~rich/map.html

% More information about Projection
% ------------ Projection name ------------------
%      'Stereographic'                 % 1  Regional 
%      'Orthographic'                  % 2  Regional
%      'Azimuthal Equal-area'          % 3  Regional
%      'Azimuthal Equidistant'         % 4  Regional
%      'Gnomonic'                      % 5  Regional
%      'Satellite'                     % 6  Regional
%      'Albers Equal-Area Conic'       % 7
%      'Lambert Conformal Conic'       % 8     
%      'Mercator'                      % 9
%      'Miller Cylindrical'            %10  Global
%      'Equidistant Cylindrical'       %11
%      'Oblique Mercator'              %12  
%      'Transverse Mercator'           %13  
%      'Sinusoidal'                    %14  Global
%      'Gall-Peters'                   %15  Global, suitable for Equatorial region
%      'Hammer-Aitoff'                 %16  Global
%      'Mollweide'                     %17  Global
%      'Robinson'                      %18  Global
%      'UTM'                           %19
% ------------ Projection name ------------------

function [] = plotmap(projection,data,spa_res,latlim,lonlim,cmap,k,labelname,fontsize)
% function input: 
% ---------------
% projection :: the projection used in plotting map
% data       :: the candidate data need be ploted
% spa_res    :: the spatial resolution, e.g. 0.25
% latlim     :: the latitude range for what you want to show, e.g. [35,80]
% lonlim     :: the longitude range for what you want to show,e.g. [40,120] 
% cmap       :: colormap with RGB raster (0,1)
% k          :: colorbar limitted range --> e.g. [0,1600]
% labelname  :: label name for this map
% fontsize   :: the fontsize in map
% ---------------

% To create the latitude and longitude raster according to the spatial resolution
x1 = spa_res/2 -  90;
x2 = 90 -  spa_res/2;
y1 = spa_res/2 - 180;
y2 = 180 - spa_res/2;

lat =  x1 : spa_res : x2;
lon =  y1 : spa_res : y2;
LT11 = flipud(repmat(lat',1,360/spa_res));
LG11 = repmat(lon,180/spa_res,1);

% Overveiw setting : set the projection for your map
m_proj(projection,'lon',lonlim,'lat',latlim);

% Creat a figure panel
figure(1);

% creat the coast line and fill it with lighten grey color
m_coast('patch',[.9 .9 .9],'edgecolor',[0.1, 0.1, 0.1]); 
hold on

% Creat your data with its latitude and longitude data
m_pcolor(LG11,LT11,data);
m_grid('linewi',1,'tickdir','in',... % set line
    'FontName','Times New Roman','FontSize',fontsize,... % set the font
    'backcolor',[180,220,240]/255); % set the background color

% set title
% set(get(gca,'title'),'String',Titles,...
%    'FontName','Times New Roman','FontSize',fontsize);

% set the range of colorbar, k
caxis(k)

% set the location of colorbar
h = colorbar('eastoutside');
set(h,'FontName','Times New Roman','FontSize',fontsize);
set(get(h,'xlabel'),'String',labelname,...
    'FontName','Times New Roman','FontSize',fontsize);
hold off

% set colormap
colormap(lcmap(cmap))
set(gcf,'color','w');
end

function [colormap] = lcmap(cmp)
load cmap
colormap = cmap.(cmp);
end