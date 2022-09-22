
clear
colors(1,:) = hex2rgb('e41a1c');
colors(2,:) = hex2rgb('377eb8');
colors(3,:) = hex2rgb('4daf4a');
colors(4,:) = hex2rgb('984ea3');
colors(5,:) = hex2rgb('ff7f00');
colors(6,:) = hex2rgb('f781bf');
%% 
% tcl = tiledlayout(1,3,'TileSpacing','Compact','Padding','Compact');
% 
% nexttile

n = 1;

fname = sprintf('mdl_EDGE_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_EF, s_p(2,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_EF, s_p(3,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_EF, s_p(5,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_EF, s_p(4,n)] = BBC_CV(o, f, i);


fname = sprintf('mdl_GLOBAL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;
[GLOBAL_EF, s_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[S_conn_EF, p(1,n)] = BBC_CV(o, f, i);

EXECUTIVE_FUNCTION_S = [S_conn_EF(:) GLOBAL_EF(:) EDGE_EF(:) NODE_EF(:) LOCAL_EF(:) ALL_EF(:)];

% boxplot(EXECUTIVE_FUNCTION_S,'Colors',colors)
% title('Structural')
% ylabel("Coefficient of Determination")




% nexttile
fname = sprintf('mdl_EDGE_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_EF, f_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_EF, f_p(2,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_EF, f_p(3,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_EF, f_p(4,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_GLOBAL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[GLOBAL_EF, f_p(5,n)] = BBC_CV(o, f, i);


fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[F_conn_EF, p(1,n)] = BBC_CV(o, f, i);


EXECUTIVE_FUNCTION_F = [F_conn_EF(:) GLOBAL_EF(:) EDGE_EF(:) NODE_EF(:) LOCAL_EF(:) ALL_EF(:)];

% boxplot(EXECUTIVE_FUNCTION_F,'Colors',colors)
% title('Functional')


% nexttile

fname = sprintf('mdl_EDGE_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_EF, c_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_EF, c_p(2,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_EF, c_p(3,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_EF, c_p(4,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_GLOBAL_C_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[GLOBAL_EF, c_p(5,n)] = BBC_CV(o, f, i);


fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_J_FAC%d.mat', n);
load(fname)
mdl = J_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[J_conn_EF, p(1,n)] = BBC_CV(o, f, i);


EXECUTIVE_FUNCTION_C = [J_conn_EF(:) GLOBAL_EF(:) EDGE_EF(:) NODE_EF(:) LOCAL_EF(:) ALL_EF(:)];


% boxplot(EXECUTIVE_FUNCTION_C,'Colors',colors)
% title('Combined')
% 
% boxes = findobj(gca, 'Tag', 'Box');
% legend(boxes([end 5 4 3 2 1]),'Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local','location', 'northeastoutside')
% title(tcl,'Executive Function')


%%

n = 2;

fname = sprintf('mdl_EDGE_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_SR, s_p(2,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_SR, s_p(3,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_SR, s_p(5,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_SR, s_p(4,n)] = BBC_CV(o, f, i);


fname = sprintf('mdl_GLOBAL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;
[GLOBAL_SR, s_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[S_conn_SR, p(1,n)] = BBC_CV(o, f, i);

SR_S = [S_conn_SR(:) GLOBAL_SR(:) EDGE_SR(:) NODE_SR(:) LOCAL_SR(:) ALL_SR(:)];

% boxplot(SR_S,'Colors',colors)
% title('Structural')
% ylabel("Coefficient of Determination")




% nexttile
fname = sprintf('mdl_EDGE_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_SR, f_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_SR, f_p(2,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_SR, f_p(3,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_SR, f_p(4,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_GLOBAL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[GLOBAL_SR, f_p(5,n)] = BBC_CV(o, f, i);


fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[F_conn_SR, p(1,n)] = BBC_CV(o, f, i);


SR_F = [F_conn_SR(:) GLOBAL_SR(:) EDGE_SR(:) NODE_SR(:) LOCAL_SR(:) ALL_SR(:)];

% boxplot(SR_F,'Colors',colors)
% title('Functional')


% nexttile

fname = sprintf('mdl_EDGE_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_SR, c_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_SR, c_p(2,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_SR, c_p(3,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_SR, c_p(4,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_GLOBAL_C_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[GLOBAL_SR, c_p(5,n)] = BBC_CV(o, f, i);


fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_J_FAC%d.mat', n);
load(fname)
mdl = J_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[J_conn_SR, p(1,n)] = BBC_CV(o, f, i);


SR_C = [J_conn_SR(:) GLOBAL_SR(:) EDGE_SR(:) NODE_SR(:) LOCAL_SR(:) ALL_SR(:)];

%%

n = 3;

fname = sprintf('mdl_EDGE_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_L, s_p(2,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_L, s_p(3,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_L, s_p(5,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_L, s_p(4,n)] = BBC_CV(o, f, i);


fname = sprintf('mdl_GLOBAL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;
[GLOBAL_L, s_p(1,n)] = BBC_CV(o, f, i);


%%

fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[S_conn_L, p(1,n)] = BBC_CV(o, f, i);

mean(S_conn_L)
%%

L_S = [S_conn_L(:) GLOBAL_L(:) EDGE_L(:) NODE_L(:) LOCAL_L(:) ALL_L(:)];

% boxplot(L_S,'Colors',colors)
% title('Structural')
% ylabel("Coefficient of Determination")




% nexttile
fname = sprintf('mdl_EDGE_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_L, f_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_L, f_p(2,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_L, f_p(3,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_L, f_p(4,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_GLOBAL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[GLOBAL_L, f_p(5,n)] = BBC_CV(o, f, i);


fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[F_conn_L, p(1,n)] = BBC_CV(o, f, i);


L_F = [F_conn_L(:) GLOBAL_L(:) EDGE_L(:) NODE_L(:) LOCAL_L(:) ALL_L(:)];

% boxplot(L_F,'Colors',colors)
% title('Functional')


% nexttile

fname = sprintf('mdl_EDGE_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_L, c_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_L, c_p(2,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_L, c_p(3,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_L, c_p(4,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_GLOBAL_C_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[GLOBAL_L, c_p(5,n)] = BBC_CV(o, f, i);
%%
n = 3;
fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_J_FAC%d.mat', n);
load(fname)
mdl = J_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[J_conn_L, p(1,n)] = BBC_CV(o, f, i);
mean(J_conn_L(:))
%%

L_C = [J_conn_L(:) GLOBAL_L(:) EDGE_L(:) NODE_L(:) LOCAL_L(:) ALL_L(:)];


% boxplot(L_C,'Colors',colors)
% title('Combined')
% 
% boxes = findobj(gca, 'Tag', 'Box');
% legend(boxes([end 5 4 3 2 1]),'Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local','location', 'northeastoutside')
% title(tcl,'Executive Function')

%%

n = 4;

fname = sprintf('mdl_EDGE_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_E, s_p(2,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_E, s_p(3,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_E, s_p(5,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_E, s_p(4,n)] = BBC_CV(o, f, i);


fname = sprintf('mdl_GLOBAL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;
[GLOBAL_E, s_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[S_conn_E, p(1,n)] = BBC_CV(o, f, i);

E_S = [S_conn_E(:) GLOBAL_E(:) EDGE_E(:) NODE_E(:) LOCAL_E(:) ALL_E(:)];

% boxplot(E_S,'Colors',colors)
% title('Structural')
% ylabel("Coefficient of Determination")




% nexttile
fname = sprintf('mdl_EDGE_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_E, f_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_E, f_p(2,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_E, f_p(3,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_E, f_p(4,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_GLOBAL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[GLOBAL_E, f_p(5,n)] = BBC_CV(o, f, i);


fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[F_conn_E, p(1,n)] = BBC_CV(o, f, i);


E_F = [F_conn_E(:) GLOBAL_E(:) EDGE_E(:) NODE_E(:) LOCAL_E(:) ALL_E(:)];

% boxplot(E_F,'Colors',colors)
% title('Functional')


% nexttile

fname = sprintf('mdl_EDGE_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_E, c_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_E, c_p(2,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_E, c_p(3,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_E, c_p(4,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_GLOBAL_C_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[GLOBAL_E, c_p(5,n)] = BBC_CV(o, f, i);


fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_J_FAC%d.mat', n);
load(fname)
mdl = J_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[J_conn_E, p(1,n)] = BBC_CV(o, f, i);


E_C = [J_conn_E(:) GLOBAL_E(:) EDGE_E(:) NODE_E(:) LOCAL_E(:) ALL_E(:)];


% boxplot(E_C,'Colors',colors)
% title('Combined')
% 
% boxes = findobj(gca, 'Tag', 'Box');
% legend(boxes([end 5 4 3 2 1]),'Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local','location', 'northeastoutside')
% title(tcl,'Executive Function')
%%

n = 5;

fname = sprintf('mdl_EDGE_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_SEQ, s_p(2,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_SEQ, s_p(3,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_SEQ, s_p(5,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_SEQ, s_p(4,n)] = BBC_CV(o, f, i);


fname = sprintf('mdl_GLOBAL_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;
[GLOBAL_SEQ, s_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_S_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[S_conn_SEQ, p(1,n)] = BBC_CV(o, f, i);

SEQ_S = [S_conn_SEQ(:) GLOBAL_SEQ(:) EDGE_SEQ(:) NODE_SEQ(:) LOCAL_SEQ(:) ALL_SEQ(:)];

% boxplot(SEQ_S,'Colors',colors)
% title('Structural')
% ylabel("Coefficient of Determination")




% nexttile
fname = sprintf('mdl_EDGE_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_SEQ, f_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_SEQ, f_p(2,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_SEQ, f_p(3,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_SEQ, f_p(4,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_GLOBAL_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[GLOBAL_SEQ, f_p(5,n)] = BBC_CV(o, f, i);


fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_F_FAC%d.mat', n);
load(fname)
mdl = F_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[F_conn_SEQ, p(1,n)] = BBC_CV(o, f, i);


SEQ_F = [F_conn_SEQ(:) GLOBAL_SEQ(:) EDGE_SEQ(:) NODE_SEQ(:) LOCAL_SEQ(:) ALL_SEQ(:)];

% boxplot(SEQ_F,'Colors',colors)
% title('Functional')


% nexttile

fname = sprintf('mdl_EDGE_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[EDGE_SEQ, c_p(1,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_NODE_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[NODE_SEQ, c_p(2,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_ALL_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[ALL_SEQ, c_p(3,n)] = BBC_CV(o, f, i);




fname = sprintf('mdl_LOCAL_C_FAC%d.mat', n);
load(fname)
mdl = C_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[LOCAL_SEQ, c_p(4,n)] = BBC_CV(o, f, i);



fname = sprintf('mdl_GLOBAL_C_FAC%d.mat', n);
load(fname)
mdl = S_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[GLOBAL_SEQ, c_p(5,n)] = BBC_CV(o, f, i);


fname = sprintf('/Users/user/conn//bic/mdls_pred_conn/individualdiffs/mdl_J_FAC%d.mat', n);
load(fname)
mdl = J_cv_mdl;
o = mdl.results.y.test.observed;
f = mdl.results.y.test.fitted;
i = mdl.results.y.test.indices;

[J_conn_SEQ, p(1,n)] = BBC_CV(o, f, i);


SEQ_C = [J_conn_SEQ(:) GLOBAL_SEQ(:) EDGE_SEQ(:) NODE_SEQ(:) LOCAL_SEQ(:) ALL_SEQ(:)];


% boxplot(SEQ_C,'Colors',colors)
% title('Combined')
% 
% boxes = findobj(gca, 'Tag', 'Box');
% legend(boxes([end 5 4 3 2 1]),'Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local','location', 'northeastoutside')
% title(tcl,'Executive Function')

%%


save('cv_results.mat', 'EXECUTIVE_FUNCTION_S', 'EXECUTIVE_FUNCTION_C', 'EXECUTIVE_FUNCTION_F', ...
'SR_S', 'SR_C', 'SR_F', ...
'L_S', 'L_C', 'L_F', ...
'E_S', 'E_C', 'E_F', ...
'SEQ_S', 'SEQ_C', 'SEQ_F', ...
'J_conn_SEQ', 'F_conn_SEQ', 'S_conn_SEQ',...
'J_conn_E', 'F_conn_E', 'S_conn_E',...
'J_conn_L', 'F_conn_L', 'S_conn_L',...
'J_conn_SR', 'F_conn_SR', 'S_conn_SR',...
'J_conn_EF', 'F_conn_EF', 'S_conn_EF', 'p', 'c_p', 's_p', 'f_p')


%% FDR correction of p-value


all_p = [s_p f_p c_p];
[h, crit_p, adj_ci_cvrg, adj_p]=fdr_bh(all_p,0.05);

%%

colors(1,:) = hex2rgb('e41a1c');
colors(2,:) = hex2rgb('377eb8');
colors(3,:) = hex2rgb('4daf4a');
colors(4,:) = hex2rgb('984ea3');
colors(5,:) = hex2rgb('ff7f00');
colors(6,:) = hex2rgb('f781bf');


%% Illustrate Executive Function


tcl = tiledlayout(1,3,'TileSpacing','Compact','Padding','Compact');

nexttile



boxplot(EXECUTIVE_FUNCTION_S,'Colors',colors)
title('Structural')
ylabel("Coefficient of Determination")

b = findobj(gca,'Tag','Box');
    patch(get(b(6),'XData'),get(b(6),'YData'),colors(1,:),'FaceAlpha',.5); % connectivity
    %patch(get(b(5),'XData'),get(b(5),'YData'),colors(2,:),'FaceAlpha',.5); % global
    patch(get(b(4),'XData'),get(b(4),'YData'),colors(3,:),'FaceAlpha',.5); % edge
    %patch(get(b(3),'XData'),get(b(3),'YData'),colors(4,:),'FaceAlpha',.5); % node
    patch(get(b(2),'XData'),get(b(2),'YData'),colors(5,:),'FaceAlpha',.5); % local
    patch(get(b(1),'XData'),get(b(1),'YData'),colors(6,:),'FaceAlpha',.5); % all
    
%%
[P,H,STATS] = ranksum(S_conn_EF(:),EXECUTIVE_FUNCTION_S(:, 3)) 
%%
[P,H,STATS] = ranksum(S_conn_EF(:),EXECUTIVE_FUNCTION_S(:, 5)) 
%%
[P,H,STATS] = ranksum(S_conn_EF(:),EXECUTIVE_FUNCTION_S(:, 6)) 
%%
    
hold on
yt = get(gca, 'YTick');

axis([xlim    -0.15  max(yt)*1.6])
xt = get(gca, 'XTick');

plot(xt([1 3]), [1 1]*max(yt)*1.3, '-k',  mean(xt([1 3]))+0.03, max(yt)*1.35, '*k')
plot(xt([1 5]), [1 1]*max(yt)*1.4, '-k',  mean(xt([1 5]))+0.03, max(yt)*1.45, '*k')
plot(xt([1 6]), [1 1]*max(yt)*1.5, '-k',  mean(xt([1 6]))+0.03, max(yt)*1.55, '*k')
% % plot(xt([3 6]), [1 1]*max(yt)*1.2, '-k',  mean(xt([3 6]))+0.03, max(yt)*1.25, '*k')
% % plot(xt([3 5]), [1 1]*max(yt)*1.1, '-k',  mean(xt([3 5]))+0.03, max(yt)*1.15, '*k')
% plot(xt([5 6]), [1 1]*max(yt)*1.0, '-k',  mean(xt([5 6]))+0.03, max(yt)*1.05, '*k')



hold off



nexttile



boxplot(EXECUTIVE_FUNCTION_F,'Colors',colors)
title('Functional')


nexttile



boxplot(EXECUTIVE_FUNCTION_C,'Colors',colors)
title('Combined')

b = findobj(gca,'Tag','Box');
    patch(get(b(6),'XData'),get(b(6),'YData'),colors(1,:),'FaceAlpha',.5); % connectivity

    patch(get(b(1),'XData'),get(b(1),'YData'),colors(6,:),'FaceAlpha',.5); % all
   %%
   [P,H,STATS] = ranksum(J_conn_EF(:),EXECUTIVE_FUNCTION_C(:, 6)) 

   %%
    
    
hold on
yt = get(gca, 'YTick');

axis([xlim    -0.15  max(yt)*1.6])
xt = get(gca, 'XTick');

    plot(xt([1 6]), [1 1]*max(yt)*1.3, '-k',  mean(xt([1 6]))+0.03, max(yt)*1.35, '*k')


boxes = findobj(gca, 'Tag', 'Box');
legend(boxes([end 5 4 3 2 1]),'Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local','location', 'northeastoutside')
title(tcl,'Executive Function')


%% Illustrate Self-regulation



tcl = tiledlayout(1,3,'TileSpacing','Compact','Padding','Compact');

nexttile



boxplot(SR_S,'Colors',colors)
title('Structural')
ylabel("Coefficient of Determination")

nexttile



boxplot(SR_F,'Colors',colors)
title('Functional')


nexttile



boxplot(SR_C,'Colors',colors)
title('Combined')
    
b = findobj(gca,'Tag','Box');
    patch(get(b(6),'XData'),get(b(6),'YData'),colors(1,:),'FaceAlpha',.5); % connectivity

boxes = findobj(gca, 'Tag', 'Box');
legend(boxes([end 5 4 3 2 1]),'Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local','location', 'northeastoutside')
title(tcl,'Self-regulation')

%% Illustrate Langauge



tcl = tiledlayout(1,3,'TileSpacing','Compact','Padding','Compact');

nexttile



boxplot(L_S,'Colors',colors)
title('Structural')
ylabel("Coefficient of Determination")

b = findobj(gca,'Tag','Box');
    patch(get(b(6),'XData'),get(b(6),'YData'),colors(1,:),'FaceAlpha',.5); % connectivity
    patch(get(b(5),'XData'),get(b(5),'YData'),colors(2,:),'FaceAlpha',.5); % global
    patch(get(b(4),'XData'),get(b(4),'YData'),colors(3,:),'FaceAlpha',.5); % edge
    patch(get(b(3),'XData'),get(b(3),'YData'),colors(4,:),'FaceAlpha',.5); % node
    patch(get(b(2),'XData'),get(b(2),'YData'),colors(5,:),'FaceAlpha',.5); % local
    patch(get(b(1),'XData'),get(b(1),'YData'),colors(6,:),'FaceAlpha',.5); % all


    
hold on
yt = get(gca, 'YTick');

axis([xlim    -0.15  max(yt)*1.6])
xt = get(gca, 'XTick');
%% y
[P,H,STATS] = ranksum(S_conn_L(:),L_S(:, 2)) 
 plot(xt([1 2]), [1 1]*max(yt)*1, '-k',  mean(xt([1 2]))+0.03, max(yt)*1.05, '*k')

%% y
[P,H,STATS] = ranksum(S_conn_L(:),L_S(:, 3)) 
 plot(xt([1 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 3]))+0.03, max(yt)*1.15, '*k')

%%  y
[P, H,STATS] = ranksum(S_conn_L(:),L_S(:, 4)) 
 plot(xt([1 4]), [1 1]*max(yt)*1.2, '-k',  mean(xt([1 4]))+0.03, max(yt)*1.25, '*k')

%% y
[P,H,STATS] = ranksum(S_conn_L(:),L_S(:, 5)) 
 plot(xt([1 5]), [1 1]*max(yt)*1.3, '-k',  mean(xt([1 5]))+0.03, max(yt)*1.35, '*k')
%%
 
[P,H,STATS] = ranksum(S_conn_L(:),L_S(:, 6)) 
 plot(xt([1 6]), [1 1]*max(yt)*1.4, '-k',  mean(xt([1 6]))+0.03, max(yt)*1.45, '*k')

%%


nexttile



boxplot(L_F,'Colors',colors)

b = findobj(gca,'Tag','Box');
    patch(get(b(6),'XData'),get(b(6),'YData'),colors(1,:),'FaceAlpha',.5); % connectivity
    
title('Functional')

%%
nexttile



boxplot(L_C,'Colors',colors)
title('Combined')
    

%%

b = findobj(gca,'Tag','Box');
    patch(get(b(6),'XData'),get(b(6),'YData'),colors(1,:),'FaceAlpha',.5); % connectivity
    patch(get(b(5),'XData'),get(b(5),'YData'),colors(2,:),'FaceAlpha',.5); % global
    patch(get(b(4),'XData'),get(b(4),'YData'),colors(3,:),'FaceAlpha',.5); % edge
    patch(get(b(3),'XData'),get(b(3),'YData'),colors(4,:),'FaceAlpha',.5); % node
    patch(get(b(2),'XData'),get(b(2),'YData'),colors(5,:),'FaceAlpha',.5); % local
    patch(get(b(1),'XData'),get(b(1),'YData'),colors(6,:),'FaceAlpha',.5); % all


    
hold on
yt = get(gca, 'YTick');

axis([xlim    -0.15  max(yt)*1.6])
xt = get(gca, 'XTick');
%%
[P,H,STATS] = ranksum(J_conn_L(:),L_C(:, 2)) 
 plot(xt([1 2]), [1 1]*max(yt)*1, '-k',  mean(xt([1 2]))+0.03, max(yt)*1.05, '*k')

%% y
[P,H,STATS] = ranksum(J_conn_L(:),L_C(:, 3)) 
 plot(xt([1 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 3]))+0.03, max(yt)*1.15, '*k')

%%  y
[P, H,STATS] = ranksum(J_conn_L(:),L_C(:, 4)) 
 plot(xt([1 4]), [1 1]*max(yt)*1.2, '-k',  mean(xt([1 4]))+0.03, max(yt)*1.25, '*k')

%% y
[P,H,STATS] = ranksum(J_conn_L(:),L_C(:, 5)) 
 plot(xt([1 5]), [1 1]*max(yt)*1.3, '-k',  mean(xt([1 5]))+0.03, max(yt)*1.35, '*k')
%%
 
[P,H,STATS] = ranksum(J_conn_L(:),L_C(:, 6)) 
 plot(xt([1 6]), [1 1]*max(yt)*1.4, '-k',  mean(xt([1 6]))+0.03, max(yt)*1.45, '*k')

%%
boxes = findobj(gca, 'Tag', 'Box');
legend(boxes([end 5 4 3 2 1]),'Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local','location', 'northeastoutside')
title(tcl,'Language')

%%



tcl = tiledlayout(1,3,'TileSpacing','Compact','Padding','Compact');

nexttile



boxplot(E_S,'Colors',colors)
title('Structural')
ylabel("Coefficient of Determination")

nexttile



boxplot(E_F,'Colors',colors)
title('Functional')


nexttile



boxplot(E_C,'Colors',colors)
title('Combined')
    

boxes = findobj(gca, 'Tag', 'Box');
legend(boxes([end 5 4 3 2 1]),'Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local','location', 'northeastoutside')
title(tcl,'Encoding')

%%


tcl = tiledlayout(1,3,'TileSpacing','Compact','Padding','Compact');

nexttile



boxplot(SEQ_S,'Colors',colors)
title('Structural')
ylabel("Coefficient of Determination")

nexttile



boxplot(SEQ_F,'Colors',colors)


b = findobj(gca,'Tag','Box');
    patch(get(b(6),'XData'),get(b(6),'YData'),colors(1,:),'FaceAlpha',.5); % connectivity
    patch(get(b(5),'XData'),get(b(5),'YData'),colors(2,:),'FaceAlpha',.5); % global
    patch(get(b(4),'XData'),get(b(4),'YData'),colors(3,:),'FaceAlpha',.5); % edge
    
    
    

    
hold on
yt = get(gca, 'YTick');

axis([xlim    -0.15  max(yt)*1.6])
xt = get(gca, 'XTick');
%%
[P,H,STATS] = ranksum(F_conn_SEQ(:),SEQ_F(:, 2)) 
 plot(xt([1 2]), [1 1]*max(yt)*1, '-k',  mean(xt([1 2]))+0.03, max(yt)*1.05, '*k')

%% y
[P,H,STATS] = ranksum(F_conn_SEQ(:),SEQ_F(:, 3)) 
 plot(xt([1 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 3]))+0.03, max(yt)*1.15, '*k')
title('Functional')
%%

nexttile



boxplot(SEQ_C,'Colors',colors)
title('Combined')
    

boxes = findobj(gca, 'Tag', 'Box');
legend(boxes([end 5 4 3 2 1]),'Raw connectivity', 'Global', 'Edge', 'Node', 'Local', 'Global and local','location', 'northeastoutside')
title(tcl,'Sequence Processing')


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