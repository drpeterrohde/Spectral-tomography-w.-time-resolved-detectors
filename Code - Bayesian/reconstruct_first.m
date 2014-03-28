function [data] = reconstruct_first(gamma, measurement_data, range, norm_type, mgt_choice, tdf_choice)
    m1 = repmat(range,length(range),1);
    m2 = repmat(range',1,length(range));
    data = zeros(length(range));

    if tdf_choice == 1 || tdf_choice == 2 || tdf_choice == 3

        for i = 1:length(range)
            for j = 1:length(range)
                data(i,j) = sum(sum(detector_t_given_m(gamma, range(i), range(j), m1, m2, measurement_data, mgt_choice, tdf_choice) .* measurement_data));
            end
        end

    elseif tdf_choice == 4 || tdf_choice == 5
        
        t2 = 0;
        for i = 1:length(range)
            m1d = m1(1,:);
            m2d = m2(1,:);
            data(i) = sum(detector_t_given_m(gamma, range(i), t2, m1d, m2d, measurement_data, mgt_choice, tdf_choice) .* measurement_data);
        end    
    end
    
    data = norm_tdf(data, norm_type);
end