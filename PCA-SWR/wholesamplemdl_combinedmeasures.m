% load cognition and regress out effects of age, education and gender

clear
load('neural_data.mat', 'subs')

data = readtable('confounds.csv');

all_HCP_subs = table2array(data(:,1)); % subject IDs - whole dataset


age = table2array(data(:,2));
education = table2array(data(:,15));

data = readtable('behavioural.csv');
gender = table2array(data(:,5));

categoricalGender = categorical(gender);
gender = dummyvar(categoricalGender);

individual_differences = [age, education, gender];

subs = cell2mat(subs); subs = str2num(subs); subs(237,:) = []; % subject 237 not part of the sample

[tf,idx] = ismember(subs,all_HCP_subs);

confounds = individual_differences(idx,:);

%
load('cognitive_components.mat')
Y = [Y;y];
confounds(:,4) = [];


EF = fitlm(confounds(:,:),Y(:,1));
SR = fitlm(confounds,Y(:,2));
L = fitlm(confounds,Y(:,3));
E =  fitlm(confounds,Y(:,4));
SEQ =  fitlm(confounds,Y(:,5));

EF = table2array(EF.Residuals(:,1));
E = table2array(E.Residuals(:,1));
L = table2array(L.Residuals(:,1));
SEQ = table2array(SEQ.Residuals(:,1));
SR = table2array(SR.Residuals(:,1));

%% load predictors

load('data_thresholded_global_gt.mat')
load('all_th_edge_gt_shen.mat')
load('data_thresholded_gt.mat')


%% global analysis

GLOBAL_S = [assortativity_s charpath_s' sum(core_per_s, 2) mean(cluster_s, 2) global_efficeincy_s' Q_s' transitivity_s SWP_s];

% clean up nans and infs
s = sum(GLOBAL_S);
GLOBAL_S(:,isinf(s)) = [];
GLOBAL_S(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(GLOBAL_S);
% do pca
[COEFF, SCORE_GLOBAL_S, ~, ~, EXPLAINED, ~] = pca(Z);


x = SCORE_GLOBAL_S;

S_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 

save('S_ID_global.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )


%% edge analysis
EDGE_S = [M0_s EBC_s T_s];
% clean up nans and infs
s = sum(EDGE_S);
EDGE_S(:,isinf(s)) = [];
EDGE_S(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(EDGE_S);
% do pca
[COEFF, SCORE_EDGE_S, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_EDGE_S;

S_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


S_EF.ModelCriterion.BIC
S_SR.ModelCriterion.BIC
S_L.ModelCriterion.BIC
S_E.ModelCriterion.BIC
S_SEQ.ModelCriterion.BIC


save('S_ID_edge.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )


%% node analysis
NODE_S = [BC_s cluster_s participation_s deg_s strength_s eccentricity_s eigenvector_s local_efficiency_s mod_degree_s];
% clean up nans and infs
s = sum(NODE_S);
NODE_S(:,isinf(s)) = [];
 NODE_S(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(NODE_S);
% do pca
[COEFF, SCORE_NODE_S, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_NODE_S;
S_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 

S_EF.ModelCriterion.BIC
S_SR.ModelCriterion.BIC
S_L.ModelCriterion.BIC
S_E.ModelCriterion.BIC
S_SEQ.ModelCriterion.BIC

save('S_ID_node.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )


%% local information analysis

LOCAL_S = [NODE_S EDGE_S];
s = sum(LOCAL_S);
LOCAL_S(:,isinf(s)) = [];
 LOCAL_S(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(LOCAL_S);
% do pca
[COEFF, SCORE_LOCAL_S, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_LOCAL_S;
S_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


S_EF.ModelCriterion.BIC
S_SR.ModelCriterion.BIC
S_L.ModelCriterion.BIC
S_E.ModelCriterion.BIC
S_SEQ.ModelCriterion.BIC


save('S_ID_local.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )

%% all information analysis
ALL_S = [GLOBAL_S LOCAL_S];
s  = sum(ALL_S);
ALL_S(:,isinf(s)) = [];
 ALL_S(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(ALL_S);
% do pca
[COEFF, SCORE_ALL_S, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_ALL_S;
S_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
S_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


S_EF.ModelCriterion.BIC
S_SR.ModelCriterion.BIC
S_L.ModelCriterion.BIC
S_E.ModelCriterion.BIC
S_SEQ.ModelCriterion.BIC


save('S_ID_all.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )

%% global analysis

GLOBAL_F = [assortativity_f charpath_f' sum(core_per_f, 2) mean(cluster_f, 2) global_efficeincy_f' Q_f' transitivity_f SWP_f];

% clean up nans and infs
s = sum(GLOBAL_F);
GLOBAL_F(:,isinf(s)) = [];
GLOBAL_F(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(GLOBAL_F);
% do pca
[COEFF, SCORE_GLOBAL_F, ~, ~, EXPLAINED, ~] = pca(Z);


x = SCORE_GLOBAL_F;

F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_FR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 

save('F_ID_global.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_FR'  )


%% edge analysis
EDGE_F = [M0_f EBC_f T_f];
% clean up nans and infs
s = sum(EDGE_F);
EDGE_F(:,isinf(s)) = [];
EDGE_F(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(EDGE_F);
% do pca
[COEFF, SCORE_EDGE_F, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_EDGE_F;

F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_FR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_FR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_edge.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_FR'  )


%% node analysis
NODE_F = [BC_f cluster_f participation_f deg_f strength_f eccentricity_f eigenvector_f local_efficiency_f mod_degree_f];
% clean up nans and infs
s = sum(NODE_F);
NODE_F(:,isinf(s)) = [];
NODE_F(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(NODE_F);
% do pca
[COEFF, SCORE_NODE_F, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_NODE_F;
F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_FR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 

F_EF.ModelCriterion.BIC
F_FR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC

save('F_ID_node.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_FR'  )


%% local information analysis

LOCAL_F = [NODE_F EDGE_F];
s = sum(LOCAL_F);
LOCAL_F(:,isinf(s)) = [];
LOCAL_F(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(LOCAL_F);
% do pca
[COEFF, SCORE_LOCAL_F, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_LOCAL_F;
F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_FR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_FR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_local.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_FR'  )

%% all information analysis
ALL_F = [GLOBAL_F LOCAL_F];
s = sum(ALL_F);
ALL_F(:,isinf(s)) = [];
ALL_F(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(ALL_F);
% do pca
[COEFF, SCORE_ALL_F, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_ALL_F;
F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_FR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_FR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_all.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_FR')


%% global analysis
GLOBAL_C = [GLOBAL_S GLOBAL_F];


% clean up nans and infs
s = sum(GLOBAL_C);
GLOBAL_C(:,isinf(s)) = [];
GLOBAL_C(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(GLOBAL_C);
% do pca
[COEFF, SCORE_GLOBAL_C, ~, ~, EXPLAINED, ~] = pca(Z);


x = SCORE_GLOBAL_C;

C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_FR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 

save('C_ID_global.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_FR')

%%
EDGE_C = [M0_s EBC_s T_s M0_f EBC_f T_f];
% clean up nans and infs
s = sum(EDGE_C);
EDGE_C(:,isinf(s)) = [];
EDGE_C(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(EDGE_C);
% do pca
[COEFF, SCORE_EDGE_C, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_EDGE_C;

C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_FR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 

save('C_ID_edge.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_FR')

%% node analysis
NODE_C = [NODE_S NODE_F];
% clean up nans and infs
s = sum(NODE_C);
NODE_C(:,isinf(s)) = [];
NODE_C(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(NODE_C);
% do pca
[COEFF, SCORE_NODE_C, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_NODE_C;

C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_FR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 

save('C_ID_node.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_FR')


%% local information analysis

LOCAL_C = [NODE_C EDGE_C];
s = sum(NODE_C);

LOCAL_C(:,isinf(s)) = [];
LOCAL_C(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(LOCAL_C);
% do pca
[COEFF, SCORE_LOCAL_C, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_LOCAL_C;

C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_FR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 

save('C_ID_local.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_FR')

%%
ALL_C = [ALL_S ALL_F];
s = sum(ALL_C);

ALL_C(:,isinf(s)) = [];
ALL_C(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(ALL_C);
% do pca
[COEFF, SCORE_ALL_C, ~, ~, EXPLAINED, ~] = pca(Z);

x = SCORE_ALL_C;

C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_FR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 

save('C_ID_all.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_FR')

