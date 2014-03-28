function [P] = detector_m_given_t(gamma, t, m, mgt_choice)
    
    step = ones(size(m)) .* (m >= t);
    
    if mgt_choice==1 %Time-Resolved Photo-detection
        P = exp(-gamma .* (m-t)) .* step;
        
    elseif mgt_choice==2 %Josh's and Ben's detector model
        P = exp((-(m-t).^2)./(gamma^2)); %.* step;
    end
end