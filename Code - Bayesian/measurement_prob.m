function [P] = measurement_prob(m1, m2, gamma, range,  tdf_choice, mgt_choice, Width, Height)
    P = 0;
    
    if tdf_choice == 1 || tdf_choice == 2 || tdf_choice == 3
        
        for t1 = range
            for t2 = range
                P = P + detector_m_given_t(gamma, t1, m1, mgt_choice) .* detector_m_given_t(gamma, t2, m2, mgt_choice) .* tdf(t1, t2,  tdf_choice, Width, Height);
            end
        end
    
    elseif tdf_choice == 4 || tdf_choice == 5
        
        t2=0;
        
        for t1 = range
            P = P + detector_m_given_t(gamma, t1, m1, mgt_choice) .* tdf(t1, t2,  tdf_choice, Width, Height);
        end
end