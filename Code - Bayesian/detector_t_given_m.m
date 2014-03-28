function [P] = detector_t_given_m(gamma, t1, t2, m1, m2, measurement_data, mgt_choice, tdf_choice)
    
    if tdf_choice == 1 || tdf_choice == 2 || tdf_choice == 3

        P = detector_m_given_t(gamma, t1, m1, mgt_choice) .* detector_m_given_t(gamma, t2, m2, mgt_choice);

    elseif tdf_choice == 4 || tdf_choice == 5

        P = detector_m_given_t(gamma, t1, m1, mgt_choice);

    end
end