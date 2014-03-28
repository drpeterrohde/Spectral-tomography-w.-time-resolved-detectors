function [S] = similarity(P,Q)
   S = sum(sqrt(P(:) .* Q(:)))^2 / (sum(P(:)) * sum(Q(:)));

%below is L2 norm
   %S = sqrt(sum((P(:)/sum(P(:)) - Q(:)/sum(Q(:))) .^ 2));
    
end

