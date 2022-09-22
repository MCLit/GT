
clear
colors(1,:) = hex2rgb('e41a1c');
colors(2,:) = hex2rgb('377eb8');
colors(3,:) = hex2rgb('4daf4a');
colors(4,:) = hex2rgb('984ea3');
colors(5,:) = hex2rgb('ff7f00');
colors(6,:) = hex2rgb('f781bf');


load('/Users/user/conn/results/individualdiffs/S_ID.mat')
load('/Users/user/conn/results/individualdiffs/F_ID.mat')
load('/Users/user/conn/results/individualdiffs/J_ID.mat')

Y = [ S_EF.ModelCriterion.BIC;     F_EF.ModelCriterion.BIC;     J_EF.ModelCriterion.BIC];
load('S_ID_global.mat')
load('F_ID_global.mat')
load('C_ID_global.mat')

Y_global = [ S_EF.ModelCriterion.BIC;     F_EF.ModelCriterion.BIC;     C_EF.ModelCriterion.BIC];


load('S_ID_edge.mat')
load('F_ID_edge.mat')
load('C_ID_edge.mat')

Y_edge = [ S_EF.ModelCriterion.BIC;     F_EF.ModelCriterion.BIC;     C_EF.ModelCriterion.BIC];


load('S_ID_node.mat')
load('F_ID_node.mat')
load('C_ID_node.mat')

Y_node = [ S_EF.ModelCriterion.BIC;     F_EF.ModelCriterion.BIC;     C_EF.ModelCriterion.BIC];

load('S_ID_local.mat')
load('F_ID_local.mat')
load('C_ID_local.mat')

Y_local = [  S_EF.ModelCriterion.BIC;     F_EF.ModelCriterion.BIC;     C_EF.ModelCriterion.BIC];

load('S_ID_all.mat')
load('F_ID_all.mat')
load('C_ID_all.mat')

Y_all = [ S_EF.ModelCriterion.BIC;     F_EF.ModelCriterion.BIC;     C_EF.ModelCriterion.BIC];

% explained variance bar graph
Y = [Y Y_global Y_edge Y_node Y_local Y_all];


% tiledlayout(2,1,'TileSpacing','Compact','Padding','Compact');
X = categorical({'Structural', 'Functional', 'Combined'});
X = reordercats(X,{'Structural', 'Functional', 'Combined'});

tiledlayout(1,1,'TileSpacing','none','Padding','none');
b = bar(Y, 'FaceColor', 'flat');

for k = 1:6
    b(k).CData = colors(k,:);
end


str = {'Structure', 'Function', 'Combined'};

hB=b;          % use a meaningful variable for a handle array...


hAx=gca;            % get a variable for the current axes handle
hAx.FontSize=11;
hAx.XTickLabel=str; % label the ticks

hT=[];              % placeholder for text object handles
for i=1:length(hB)  % iterate over number of bar objects
  hT=[hT text(hB(i).XData+hB(i).XOffset,hB(i).YData,num2str(hB(i).YData.','%.2f'), ...
                          'VerticalAlignment','bottom','horizontalalign','center',  'FontSize', 15)];
                      
end
legend('Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local')
ylabel('Bayesian Information Criterion', 'FontSize', 15) 
title('Executive Function', 'FontSize', 15)
h=gca; h.XAxis.TickLength = [0 0];
ylim([700 800])

%%


clear

colors(1,:) = hex2rgb('e41a1c');
colors(2,:) = hex2rgb('377eb8');
colors(3,:) = hex2rgb('4daf4a');
colors(4,:) = hex2rgb('984ea3');
colors(5,:) = hex2rgb('ff7f00');
colors(6,:) = hex2rgb('f781bf');


load('/Users/user/conn/results/individualdiffs/S_ID.mat')
load('/Users/user/conn/results/individualdiffs/F_ID.mat')
load('/Users/user/conn/results/individualdiffs/J_ID.mat')

Y = [ S_SR.ModelCriterion.BIC;     F_SR.ModelCriterion.BIC;     J_SR.ModelCriterion.BIC];
load('S_ID_global.mat')
load('F_ID_global.mat')
load('C_ID_global.mat')

Y_global = [ S_SR.ModelCriterion.BIC;     F_FR.ModelCriterion.BIC;     C_FR.ModelCriterion.BIC];


load('S_ID_edge.mat')
load('F_ID_edge.mat')
load('C_ID_edge.mat')

Y_edge = [ S_SR.ModelCriterion.BIC;     F_FR.ModelCriterion.BIC;     C_FR.ModelCriterion.BIC];


load('S_ID_node.mat')
load('F_ID_node.mat')
load('C_ID_node.mat')

Y_node = [ S_SR.ModelCriterion.BIC;     F_FR.ModelCriterion.BIC;     C_FR.ModelCriterion.BIC];

load('S_ID_local.mat')
load('F_ID_local.mat')
load('C_ID_local.mat')

Y_local = [  S_SR.ModelCriterion.BIC;     F_FR.ModelCriterion.BIC;     C_FR.ModelCriterion.BIC];

load('S_ID_all.mat')
load('F_ID_all.mat')
load('C_ID_all.mat')

Y_all = [ S_SR.ModelCriterion.BIC;     F_FR.ModelCriterion.BIC;     C_FR.ModelCriterion.BIC];

% explained variance bar graph
Y = [Y Y_global Y_edge Y_node Y_local Y_all];


% tiledlayout(2,1,'TileSpacing','Compact','Padding','Compact');
X = categorical({'Structural', 'Functional', 'Combined'});
X = reordercats(X,{'Structural', 'Functional', 'Combined'});



b = bar(Y, 'FaceColor', 'flat');

for k = 1:6
    b(k).CData = colors(k,:);
end

str = {'Structural', 'Functional', 'Combined'};

hB=b;          % use a meaningful variable for a handle array...


hAx=gca;            % get a variable for the current axes handle
hAx.FontSize=11;
hAx.XTickLabel=str; % label the ticks

hT=[];              % placeholder for text object handles
for i=1:length(hB)  % iterate over number of bar objects
  hT=[hT text(hB(i).XData+hB(i).XOffset,hB(i).YData,num2str(hB(i).YData.','%.2f'), ...
                          'VerticalAlignment','bottom','horizontalalign','center',  'FontSize', 15)];
                      
end
legend('Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local')
ylabel('Bayesian Information Criterion', 'FontSize', 15) 
title('Self-regulation', 'FontSize', 15)
h=gca; h.XAxis.TickLength = [0 0];
ylim([630 730])
%%


clear
colors(1,:) = hex2rgb('e41a1c');
colors(2,:) = hex2rgb('377eb8');
colors(3,:) = hex2rgb('4daf4a');
colors(4,:) = hex2rgb('984ea3');
colors(5,:) = hex2rgb('ff7f00');
colors(6,:) = hex2rgb('f781bf');


load('/Users/user/conn/results/individualdiffs/S_ID.mat')
load('/Users/user/conn/results/individualdiffs/F_ID.mat')
load('/Users/user/conn/results/individualdiffs/J_ID.mat')

Y = [ S_L.ModelCriterion.BIC;     F_L.ModelCriterion.BIC;     J_L.ModelCriterion.BIC];
load('S_ID_global.mat')
load('F_ID_global.mat')
load('C_ID_global.mat')

Y_global = [ S_L.ModelCriterion.BIC;     F_L.ModelCriterion.BIC;     C_L.ModelCriterion.BIC];


load('S_ID_edge.mat')
load('F_ID_edge.mat')
load('C_ID_edge.mat')

Y_edge = [ S_L.ModelCriterion.BIC;     F_L.ModelCriterion.BIC;     C_L.ModelCriterion.BIC];


load('S_ID_node.mat')
load('F_ID_node.mat')
load('C_ID_node.mat')

Y_node = [ S_L.ModelCriterion.BIC;     F_L.ModelCriterion.BIC;     C_L.ModelCriterion.BIC];

load('S_ID_local.mat')
load('F_ID_local.mat')
load('C_ID_local.mat')

Y_local = [  S_L.ModelCriterion.BIC;     F_L.ModelCriterion.BIC;     C_L.ModelCriterion.BIC];

load('S_ID_all.mat')
load('F_ID_all.mat')
load('C_ID_all.mat')

Y_all = [ S_L.ModelCriterion.BIC;     F_L.ModelCriterion.BIC;     C_L.ModelCriterion.BIC];

% explained variance bar graph
Y = [Y Y_global Y_edge Y_node Y_local Y_all];


% tiledlayout(2,1,'TileSpacing','Compact','Padding','Compact');
X = categorical({'Structural', 'Functional', 'Combined'});
X = reordercats(X,{'Structural', 'Functional', 'Combined'});




b = bar(Y, 'FaceColor', 'flat');

for k = 1:6
    b(k).CData = colors(k,:);
end

str = {'Structural', 'Functional', 'Combined'};

hB=b;          % use a meaningful variable for a handle array...


hAx=gca;            % get a variable for the current axes handle
hAx.FontSize=11;
hAx.XTickLabel=str; % label the ticks

hT=[];              % placeholder for text object handles
for i=1:length(hB)  % iterate over number of bar objects
  hT=[hT text(hB(i).XData+hB(i).XOffset,hB(i).YData,num2str(hB(i).YData.','%.2f'), ...
                          'VerticalAlignment','bottom','horizontalalign','center',  'FontSize', 15)];
                      
end
legend( 'raw connectivity values', 'global graph theory','edge  graph theory', 'node graph theory', 'edge and node graph theory', 'all graph theory')
ylabel('Bayesian Information Criterion', 'FontSize', 15) 
title('Language', 'FontSize', 15)
h=gca; h.XAxis.TickLength = [0 0];
ylim([560 660])
%%

clear
colors(1,:) = hex2rgb('e41a1c');
colors(2,:) = hex2rgb('377eb8');
colors(3,:) = hex2rgb('4daf4a');
colors(4,:) = hex2rgb('984ea3');
colors(5,:) = hex2rgb('ff7f00');
colors(6,:) = hex2rgb('f781bf');


load('/Users/user/conn/results/individualdiffs/S_ID.mat')
load('/Users/user/conn/results/individualdiffs/F_ID.mat')
load('/Users/user/conn/results/individualdiffs/J_ID.mat')

Y = [ S_E.ModelCriterion.BIC;     F_E.ModelCriterion.BIC;     J_E.ModelCriterion.BIC];
load('S_ID_global.mat')
load('F_ID_global.mat')
load('C_ID_global.mat')

Y_global = [ S_E.ModelCriterion.BIC;     F_E.ModelCriterion.BIC;     C_E.ModelCriterion.BIC];


load('S_ID_edge.mat')
load('F_ID_edge.mat')
load('C_ID_edge.mat')

Y_edge = [ S_E.ModelCriterion.BIC;     F_E.ModelCriterion.BIC;     C_E.ModelCriterion.BIC];


load('S_ID_node.mat')
load('F_ID_node.mat')
load('C_ID_node.mat')

Y_node = [ S_E.ModelCriterion.BIC;     F_E.ModelCriterion.BIC;     C_E.ModelCriterion.BIC];

load('S_ID_local.mat')
load('F_ID_local.mat')
load('C_ID_local.mat')

Y_local = [  S_E.ModelCriterion.BIC;     F_E.ModelCriterion.BIC;     C_E.ModelCriterion.BIC];

load('S_ID_all.mat')
load('F_ID_all.mat')
load('C_ID_all.mat')

Y_all = [ S_E.ModelCriterion.BIC;     F_E.ModelCriterion.BIC;     C_E.ModelCriterion.BIC];

% explained variance bar graph
Y = [Y Y_global Y_edge Y_node Y_local Y_all];


% tiledlayout(2,1,'TileSpacing','Compact','Padding','Compact');
X = categorical({'Structural', 'Functional', 'Combined'});
X = reordercats(X,{'Structural', 'Functional', 'Combined'});




b = bar(Y, 'FaceColor', 'flat');

for k = 1:6
    b(k).CData = colors(k,:);
end

str = {'Structural', 'Functional', 'Combined'};

hB=b;          % use a meaningful variable for a handle array...


hAx=gca;            % get a variable for the current axes handle
hAx.FontSize=11;
hAx.XTickLabel=str; % label the ticks

hT=[];              % placeholder for text object handles
for i=1:length(hB)  % iterate over number of bar objects
  hT=[hT text(hB(i).XData+hB(i).XOffset,hB(i).YData,num2str(hB(i).YData.','%.2f'), ...
                          'VerticalAlignment','bottom','horizontalalign','center',  'FontSize', 15)];
                      
end
legend('Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local')
ylabel('Bayesian Information Criterion', 'FontSize', 15) 
title('Encoding', 'FontSize', 15)
h=gca; h.XAxis.TickLength = [0 0];
ylim([680 780])
%%


clear
colors(1,:) = hex2rgb('e41a1c');
colors(2,:) = hex2rgb('377eb8');
colors(3,:) = hex2rgb('4daf4a');
colors(4,:) = hex2rgb('984ea3');
colors(5,:) = hex2rgb('ff7f00');
colors(6,:) = hex2rgb('f781bf');



load('/Users/user/conn/results/individualdiffs/S_ID.mat')
load('/Users/user/conn/results/individualdiffs/F_ID.mat')
load('/Users/user/conn/results/individualdiffs/J_ID.mat')

Y = [ S_SEQ.ModelCriterion.BIC;     F_SEQ.ModelCriterion.BIC;     J_SEQ.ModelCriterion.BIC];
load('S_ID_global.mat')
load('F_ID_global.mat')
load('C_ID_global.mat')

Y_global = [ S_SEQ.ModelCriterion.BIC;     F_SEQ.ModelCriterion.BIC;     C_SEQ.ModelCriterion.BIC];


load('S_ID_edge.mat')
load('F_ID_edge.mat')
load('C_ID_edge.mat')

Y_edge = [ S_SEQ.ModelCriterion.BIC;     F_SEQ.ModelCriterion.BIC;     C_SEQ.ModelCriterion.BIC];


load('S_ID_node.mat')
load('F_ID_node.mat')
load('C_ID_node.mat')

Y_node = [ S_SEQ.ModelCriterion.BIC;     F_SEQ.ModelCriterion.BIC;     C_SEQ.ModelCriterion.BIC];

load('S_ID_local.mat')
load('F_ID_local.mat')
load('C_ID_local.mat')

Y_local = [  S_SEQ.ModelCriterion.BIC;     F_SEQ.ModelCriterion.BIC;     C_SEQ.ModelCriterion.BIC];

load('S_ID_all.mat')
load('F_ID_all.mat')
load('C_ID_all.mat')

Y_all = [ S_SEQ.ModelCriterion.BIC;     F_SEQ.ModelCriterion.BIC;     C_SEQ.ModelCriterion.BIC];

% explained variance bar graph
Y = [Y Y_global Y_edge Y_node Y_local Y_all];


% tiledlayout(2,1,'TileSpacing','Compact','Padding','Compact');
X = categorical({'Structural', 'Functional', 'Combined'});
X = reordercats(X,{'Structural', 'Functional', 'Combined'});




b = bar(Y, 'FaceColor', 'flat');

for k = 1:6
    b(k).CData = colors(k,:);
end

str = {'Structural', 'Functional', 'Combined'};

hB=b;          % use a meaningful variable for a handle array...


hAx=gca;            % get a variable for the current axes handle
hAx.FontSize=11;
hAx.XTickLabel=str; % label the ticks

hT=[];              % placeholder for text object handles
for i=1:length(hB)  % iterate over number of bar objects
  hT=[hT text(hB(i).XData+hB(i).XOffset,hB(i).YData,num2str(hB(i).YData.','%.2f'), ...
                          'VerticalAlignment','bottom','horizontalalign','center',  'FontSize', 15)];
                      
end
legend('Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local')
ylabel('Bayesian Information Criterion', 'FontSize', 15) 
title('Sequence Processing', 'FontSize', 15)
h=gca; h.XAxis.TickLength = [0 0];
ylim([660 760])
%%

function rgb = hex2rgb(hexString)
	if size(hexString,2) ~= 6
		error('invalid input: not 6 characters');
	else
		r = double(hex2dec(hexString(1:2)))/255;
		g = double(hex2dec(hexString(3:4)))/255;
		b = double(hex2dec(hexString(5:6)))/255;
		rgb = [r, g, b];
	end
end