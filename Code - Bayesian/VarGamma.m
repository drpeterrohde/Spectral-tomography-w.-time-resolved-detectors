% Varying gamma

S_raw = [];           %similarity
S_reconstructed = []; %similarity

mu_actual = [];        %mean actual
mu_raw = [];           %mean raw
mu_reconstructed = []; %mean reconstructed

E_actual_data = [];
E_measurement_data = [];   %entanglement
E_reconstructed_data = []; %entanglement

tdf_data2 = tdf(t1, t2, tdf_choice, Width, Height);
tdf_data2 = norm_tdf(tdf_data2, norm_type);

for gamma = S_gammas %iterates through gamma - the detector response time
    disp('Gamma = '),
    disp(gamma);
    measurement_data2 = reconstruct_raw(gamma, range, norm_type, tdf_choice, mgt_choice, Width, Height);
    reconstructed_data2 = reconstruct_first(gamma, measurement_data2, range, norm_type, mgt_choice, tdf_choice);
    
    S_raw = [S_raw similarity(measurement_data2, tdf_data2)];
    S_reconstructed = [S_reconstructed similarity(reconstructed_data2, tdf_data2)];
    
    mu_actual = [mu_actual mean_custom(tdf_data2, range, tdf_choice)];
    mu_raw = [mu_raw mean_custom(measurement_data2, range, tdf_choice)];
    mu_reconstructed = [mu_reconstructed mean_custom(reconstructed_data2, range, tdf_choice)];
    
    %This calculates entanglement plot if the tdf source is a PDC state.
    if tdf_choice == 3 
        E_actual_data = [E_actual_data calc_entanglement(tdf_data2)];
        E_measurement_data = [E_measurement_data calc_entanglement(measurement_data2)];
        E_reconstructed_data = [E_reconstructed_data calc_entanglement(reconstructed_data2)];
    end

end

if tdf_choice == 3 %positions plots correctly based on tdf_choice
    position = 3;
else
    position = 7;
end