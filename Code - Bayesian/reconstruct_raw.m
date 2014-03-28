function [data] = reconstruct_raw(gamma, range, norm_type, tdf_choice, mgt_choice, Width, Height)
    
    m1 = repmat(range,length(range),1);
    m2 = repmat(range',1,length(range));
    
    if tdf_choice == 4 || tdf_choice == 5
    m1 = m1(1,:);
    m2 = m2(1,:);
    end
        
    data = measurement_prob(m1, m2, gamma, range, tdf_choice, mgt_choice, Width, Height);
    data = norm_tdf(data, norm_type);
end

