% Spectral tomography
% Peter P. Rohde & Keith R. Motes
% Macquarie University

% Parameters

gamma = 2;

S_gammas = [0.1:.5:5];
iterator =.5;
end1 = 5;
range = [-end1:iterator:end1];

tdf_choice =1;
% tdf_choice defines which temporal distribution function to use
% Choices:
% 1 = Fock State
% 2 = Bell State
% 3 = PDC State
% 4 = 1d Fock State
% 5 = 1d Bell State

%***%%set up auto norming & figure out which norm to use for what
norm_type = 1; 
% norm_type defines the Normalisation type 
% Choices: 
% 1 = lower triangular normalization
% 2 = full normalization
% 3 = diagonal normalization
% 4 = 1D normalization

Width = 3;%used for PDC state
Height = 4;%used for PDC state

mgt_choice = 2;
% mgt_choice defines the detection model; mgt:= detector_m_given_t
% Choices:
% 1 = Time-Resolved Photo-detection
% 2 = Josh's and Ben's detector model

%defines matrix representing the arrival times for photon 1 & 2
t1 = repmat(range,length(range),1);
t2 = repmat(range',1,length(range));
if tdf_choice == 4 || tdf_choice == 5 %1d case
    t1 = t1(1,:);
    t2 = t2(1,:);
end

% Actual temporal distribution function
tdf_data = tdf(t1, t2, tdf_choice, Width, Height);
tdf_data = norm_tdf(tdf_data, norm_type);

% Reconstruction
disp('Gamma = ');
disp(gamma);
measurement_data = reconstruct_raw(gamma, range, norm_type, tdf_choice, mgt_choice, Width, Height);
measurement_data = norm_tdf(measurement_data, norm_type);
reconstructed_data = reconstruct_first(gamma, measurement_data, range, norm_type, mgt_choice, tdf_choice);
reconstructed_data = norm_tdf(reconstructed_data, norm_type);

%This includes 6 rows to account for the additional entanglement plot 
%if the tdf source is a PDC state; else you get 5 rows.
if tdf_choice == 3 
    m = 4; %m defines the # of rows in the graphic
else
    m=5;
end

%seperate script that iterates through gamma
VarGamma;

%seperate script
plots;