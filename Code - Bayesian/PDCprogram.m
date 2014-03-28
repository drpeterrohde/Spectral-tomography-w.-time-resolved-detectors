% Spectral tomography
% Peter Rohde
% Macquarie University
% Keith's Updates

% Parameters

gamma = 2;

S_gammas = [0.1:.5:5];
range = [-10:.3:10]; %mean appears to go to zero when the end points of range are 1 off from each other
H_heights = [1:1:5];

% norm_type defines the Normalisation type 
% Choices: 
% 1 = lower triangular normalization
% 2 = full normalization
% 3 = diagonal normalization
norm_type = 1; 

% NOTE: tdf_choice should always be 3 for this PDC function
tdf_choice = 3; 
Width = 1;%used for PDC state
%Height = 5;%used for PDC state

% mgt_choice defines the detection model; mgt:= detector_m_given_t
% Choices:
% 1 = Time-Resolved Photo-detection
mgt_choice = 1;

% Actual temporal distribution function

t1 = repmat(range,length(range),1);
t2 = repmat(range',1,length(range));

tdf_data = tdf(t1, t2, tdf_choice, Width, Height);
tdf_data = norm_tdf(tdf_data, norm_type);

% Reconstruction

disp('Gamma = ');
disp(gamma);
    
% Plots

act_S_height = [];
act_mu_height = [];
act_E_height = [];

raw_S_height = [];
raw_mu_height = [];
raw_E_height = [];

rec_S_height = [];
rec_mu_height = [];
rec_E_height = [];

for Height = H_heights

    disp('Height = '),
    disp(Height);

%   S_actual = [];     %similarity
    S_raw = [];           %similarity
    S_reconstructed = []; %similarity

%   mu_actual = [];        %mean
    mu_raw = [];           %mean
    mu_reconstructed = []; %mean

    E_actual = [];        %entanglement
    E_raw = [];           %entanglement
    E_reconstructed = []; %entanglement

    t1 = repmat(range,length(range),1);
    t2 = repmat(range',1,length(range));

    tdf_data = tdf(t1, t2, tdf_choice, Width, Height);
    tdf_data = norm_tdf(tdf_data, norm_type);

    for gamma = S_gammas %iterates through gamma - the detector response time
%       disp('Gamma = '),
%       disp(gamma);
        
        measurement_data = reconstruct_raw(gamma, range, norm_type, tdf_choice, mgt_choice, Width, Height);
        reconstructed_data = reconstruct_first(gamma, measurement_data, range, norm_type, mgt_choice);
    
%       S_actual = [S_actual similarity(tdf_data, tdf_data)];
        S_raw = [S_raw similarity(measurement_data, tdf_data)];
        S_reconstructed = [S_reconstructed similarity(reconstructed_data, tdf_data)];
    
%       mu_actual = [mu_actual mean_custom(tdf_data, range)];
        mu_raw = [mu_raw mean_custom(measurement_data, range)];
        mu_reconstructed = [mu_reconstructed mean_custom(reconstructed_data, range)];
    
%        E_actual = [E_actual calc_entanglement(tdf_data)];
        E_raw = [E_raw calc_entanglement(measurement_data)];
        E_reconstructed = [E_reconstructed calc_entanglement(reconstructed_data)];

    end
    
%   act_S_height = [act_S_height; S_actual];
%   act_mu_height = [act_mu_height; mu_actual];
    act_E_height = [act_E_height calc_entanglement(tdf_data)];%2d plot

    raw_S_height = [raw_S_height; S_raw];
    raw_mu_height = [raw_mu_height; mu_raw];
    raw_E_height = [raw_E_height; E_raw];

    rec_S_height = [rec_S_height; S_reconstructed];
    rec_mu_height = [rec_mu_height; mu_reconstructed];
    rec_E_height = [rec_E_height; E_reconstructed];
end

%plots
colormap Autumn;
rows = 4;
columns = 2;

% subplot(rows,columns,1);
% surf(S_gammas, H_heights, act_S_height, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting', 'phong')
% xlabel('\gamma', 'FontSize', 16);
% ylabel('h/w', 'FontSize', 16);
% set(gca, 'FontSize', 14);
% view(45,45);
% camlight headlight;
% title('Actual Similarity');

subplot(rows,columns,1);
surf(S_gammas, H_heights, raw_S_height, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting', 'phong')
xlabel('\gamma', 'FontSize', 16);
ylabel('h/w', 'FontSize', 16);
set(gca, 'FontSize', 14);
view(-45,45);
camlight headlight;
title('Raw Similarity','FontSize',16);

subplot(rows,columns,2);
surf(S_gammas, H_heights, rec_S_height, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting', 'phong')
xlabel('\gamma', 'FontSize', 16);
ylabel('h/w', 'FontSize', 16);
set(gca, 'FontSize', 14);
view(-45,45);
camlight headlight;
title('Rec Similarity','FontSize',16);

% subplot(rows,columns,4);
% surf(S_gammas, H_heights, act_mu_height, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting', 'phong')
% xlabel('\gamma', 'FontSize', 16);
% ylabel('h/w', 'FontSize', 16);
% set(gca, 'FontSize', 14);
% view(45,45);
% camlight headlight;
% title('Actual Mean');

subplot(rows,columns,3);
surf(S_gammas, H_heights, raw_mu_height, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting', 'phong')
xlabel('\gamma', 'FontSize', 16);
ylabel('h/w', 'FontSize', 16);
set(gca, 'FontSize', 14);
view(45,45);
camlight headlight;
title('Raw Mean','FontSize',16);

subplot(rows,columns,4);
surf(S_gammas, H_heights, rec_mu_height, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting', 'phong')
xlabel('\gamma', 'FontSize', 16);
ylabel('h/w', 'FontSize', 16);
set(gca, 'FontSize', 14);
view(-45,45);
camlight headlight;
title('Rec Mean','FontSize',16);


subplot(rows,columns,5);
surf(S_gammas, H_heights, raw_E_height, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting', 'phong')
xlabel('\gamma', 'FontSize', 16);
ylabel('h/w', 'FontSize', 16);
set(gca, 'FontSize', 14);
view(45,45);
camlight headlight;
title('Raw Entanglement','FontSize',16);

subplot(rows,columns,6);
surf(S_gammas, H_heights, rec_E_height, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting', 'phong')
xlabel('\gamma', 'FontSize', 16);
ylabel('h/w', 'FontSize', 16);
set(gca, 'FontSize', 14);
view(45,45);
camlight headlight;
title('Rec Entanglement','FontSize',16);

subplot(rows,columns,[7 8]);
plot(H_heights, act_E_height,'-ro')
%leg1 = legend('Measurements  .', 'Reconstructed  .');
%set(leg1, 'Location', 'SouthEast', 'FontSize', 16);
legend('boxoff');
xlabel('h/w', 'FontSize', 16);
ylabel('E', 'FontSize', 16);
title('Actual Entanglement', 'FontSize', 16);
set(gca, 'FontSize', 14);


