function [Q] = norm_tdf(P, norm_type)
    
 if norm_type==1 %lower triangular normalization
     
    Q = P ./ sum(sum(lower(P)));
    
 elseif norm_type==2 %full normalization

    Q = P ./ sum(sum(P));
        
 elseif norm_type == 3 %diagonal normalization
      
    Q = P ./ trace(P);
     
 elseif norm_type == 4 %1D normalization
    Q = P / sum(P);
    
 end
 

end