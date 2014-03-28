function [ mu ] = mean_custom( Distribution, range, tdf_choice)
%Calculates the mean of the distribution
    
    mu=0;

    if tdf_choice == 4 || tdf_choice == 5
        collapse = Distribution;
    else
    collapse = sum(Distribution);
    end
    
    for i=1:length(collapse)
     %  mu = mu + (i-floor(length(collapse)/2))*collapse(i);
        mu = mu + range(i)*collapse(i);
    end
     

end

