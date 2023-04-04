clear
for cog = 1:5

load('confounds.mat') % loads variable ID = [age, education, gender];
load('cognitive_data.mat')
load('cv_indices.mat')

Y = Y(:,cog);
load('data_thresholded_gt.mat')
load('all_th_edge_gt_shen.mat')
load('data_thresholded_global_gt.mat')
x = [M0_s M0_f];
J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('M0_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')

x = [EBC_s EBC_f];
J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('EBC_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')

x = [T_s T_f];

J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('T_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')

x = [BC_s BC_f];
J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('BC_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')

x = [cluster_s cluster_f];
J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('cluster_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')

 
x = [participation_s participation_f];
J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('participation_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')


x = [deg_s deg_f];

J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('deg_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')


x = [strength_s strength_f];

J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('strength_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')

x = [eccentricity_s eccentricity_f];

J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('eccentricity_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')



x = [eigenvector_s eigenvector_f];

J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('eigenvector_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')


x = [local_efficiency_s local_efficiency_f];

J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('local_efficiency_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')


x = [mod_degree_s mod_degree_f];

J_cv_mdl = stepwise_cv(Y, x, confounds, cv_indices); % crossvalidation error, training and test models, pca solution

output_name = sprintf('mod_degree_J_FAC%d.mat', cog);
save(output_name, 'J_cv_mdl')

end

