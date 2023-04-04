clear
for  cog = 1:5

load('confounds.mat') % loads variable ID = [age, education, gender];
load('cognitive_data.mat')
Y = Y(:,cog);
load('cv_indices.mat')

load('data_thresholded_gt.mat')

load('data_thresholded_global_gt.mat')
GLOBAL_F = [assortativity_f charpath_f sum(core_per_f, 2) mean(cluster_f, 2) global_efficeincy_f Q_f transitivity_f SWP_f];
GLOBAL_S = [assortativity_s charpath_s sum(core_per_s, 2) mean(cluster_s, 2) global_efficeincy_s Q_s transitivity_s SWP_s];
GLOBAL_C = [GLOBAL_S GLOBAL_F];

C_cv_mdl = stepwise_cv(Y, GLOBAL_C, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('mdl_GLOBAL_C_FAC%d.mat', cog);
save(output_name, 'C_cv_mdl')


%%

load('all_th_edge_gt_shen.mat')
 EDGE_C = [M0_s EBC_s T_s M0_f EBC_f T_f];

C_cv_mdl = stepwise_cv(Y, EDGE_C, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('mdl_EDGE_C_FAC%d.mat', cog);
save(output_name, 'C_cv_mdl')

disp('Edge: complete')
clear C_cv_mdl
%%
load('data_thresholded_gt.mat')
NODE_F = [BC_f cluster_f participation_f deg_f strength_f eccentricity_f eigenvector_f local_efficiency_f mod_degree_f];
NODE_S = [BC_s cluster_s participation_s deg_s strength_s eccentricity_s eigenvector_s local_efficiency_s mod_degree_s];
NODE_C = [NODE_S NODE_F];

C_cv_mdl = stepwise_cv(Y, NODE_C, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('mdl_NODE_C_FAC%d.mat', cog);
save(output_name, 'C_cv_mdl')
disp('Node: complete')

clear C_cv_mdl

%%

 LOCAL_C = [NODE_C EDGE_C];
C_cv_mdl = stepwise_cv(Y, LOCAL_C, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('mdl_LOCAL_C_FAC%d.mat', cog);
save(output_name, 'C_cv_mdl')
clear C_cv_mdl
disp('Local: complete')

%%
load('data_thresholded_global_gt.mat')
GLOBAL_F = [assortativity_f charpath_f sum(core_per_f, 2) mean(cluster_f, 2) global_efficeincy_f Q_f transitivity_f SWP_f];
GLOBAL_S = [assortativity_s charpath_s sum(core_per_s, 2) mean(cluster_s, 2) global_efficeincy_s Q_s transitivity_s SWP_s];
GLOBAL_C = [GLOBAL_S GLOBAL_F LOCAL_C ];

C_cv_mdl = stepwise_cv(Y, GLOBAL_C, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('mdl_ALL_C_FAC%d.mat', cog);
save(output_name, 'C_cv_mdl')
clear C_cv_mdl
disp('All: complete')


end