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

%% matching index

X = M0_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_M0.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )

%% edge betweennness centralit
X = EBC_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_EBC.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )

%% path transitivity

X = T_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_T.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )

%% betweenness centrality


X = BC_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_BC.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )
%%


X = cluster_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_CC.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )

%%
X = participation_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_PC.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )

%%
X = deg_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_deg.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )
%%


X = strength_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_str.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )
%%
X = eccentricity_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_ECC.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )

%%


X = eigenvector_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_EIG.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )

%%


X = local_efficiency_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_LE.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )
%% within module degree


X = mod_degree_s;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


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


save('S_ID_M_deg.mat', 'S_EF', 'S_E', 'S_L', 'S_SEQ', 'S_SR'  )

%%

%% matching index

X = M0_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_M0.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )

% edge betweennness centralit
X = EBC_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_EBC.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )

% path transitivity

X = T_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_T.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )

% betweenness centrality


X = BC_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_BC.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )
%


X = cluster_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_CC.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )

%
X = participation_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_PC.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )

%
X = deg_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_deg.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )
%


X = strength_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_ftr.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )
%
X = eccentricity_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_ECC.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )

%


X = eigenvector_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_EIG.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )

%


X = local_efficiency_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_LE.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )
% within module degree


X = mod_degree_f;
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


F_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
F_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


F_EF.ModelCriterion.BIC
F_SR.ModelCriterion.BIC
F_L.ModelCriterion.BIC
F_E.ModelCriterion.BIC
F_SEQ.ModelCriterion.BIC


save('F_ID_M_deg.mat', 'F_EF', 'F_E', 'F_L', 'F_SEQ', 'F_SR'  )

%%
% matching index

X = [M0_s M0_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_M0.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )

% edge betweennness centralit
X = [EBC_s EBC_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_EBC.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )

% path transitivity

X = [T_s T_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_T.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )

% betweenness centrality


X = [BC_s BC_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_BC.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )
%


X = [cluster_s cluster_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_CC.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )

%
X = [participation_s participation_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_PC.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )

%
X = [deg_s deg_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_deg.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )
%


X = [strength_s strength_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_str.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )
%
X = [eccentricity_s eccentricity_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_ECC.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )

%


X = [eigenvector_s eigenvector_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_EIG.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )

%


X = [local_efficiency_s local_efficiency_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_LE.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )
% within module degree


X = [mod_degree_s mod_degree_f];
s = sum(X);
X(:,isinf(s)) = [];
X(:,isnan(s)) = [];
% normalize
[Z, mean_x_train, standard_deviation_x_train] = zscore(X);
% do pca
[COEFF, x, ~, ~, EXPLAINED, ~] = pca(Z);


C_EF = stepwiselm(x, EF, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_E = stepwiselm(x, E, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_L = stepwiselm(x, L, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SEQ = stepwiselm(x, SEQ, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 
C_SR = stepwiselm(x, SR, 'constant', 'upper', 'linear', 'criterion', 'bic', 'Verbose', 0); 


C_EF.ModelCriterion.BIC
C_SR.ModelCriterion.BIC
C_L.ModelCriterion.BIC
C_E.ModelCriterion.BIC
C_SEQ.ModelCriterion.BIC


save('C_ID_M_deg.mat', 'C_EF', 'C_E', 'C_L', 'C_SEQ', 'C_SR'  )