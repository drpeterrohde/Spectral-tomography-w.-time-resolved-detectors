function [ entanglement_custom ] = calc_entanglement( distribution )
    %calculates entanglement
    %svd does a singular value decomposition
    SVD = svd(distribution);
    SVD = SVD / sum(SVD); %normalises SVD
    
    entanglement_custom = 0;
    
    for i = 1:length(SVD)
        if SVD(i) ~= 0
            entanglement_custom = entanglement_custom - SVD(i)*log2(SVD(i));
        end
    end

end

