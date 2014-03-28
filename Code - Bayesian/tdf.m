
function [P] = tdf(t1, t2, tdf_choice, Width, Height)

    if tdf_choice == 1 %Fock State
        
        P= exp(-(t1).^2-(t2).^2);   
    
    elseif tdf_choice == 2 %Bell State
        
        P = exp(-(t1-3).^2-(t2-3).^2) + exp(-(t1+3).^2-(t2+3).^2);
        
        
    elseif tdf_choice == 3 %PDC State
        
        theta = pi/4; %yields 45 degree rotation
        A = 1; %coefficient
        t10 = 0; %centers about t1=0 
        t20 = 0; %centers about t2=0
        
        a = ((cos(theta))^2)/(2*Width^2) + ((sin(theta))^2)/(2*Height^2);
        b = (-sin(2*theta))/(4*Width^2) + (sin(2*theta))/(4*Height^2);
        c = ((sin(theta))^2)/(2*Width^2) + ((cos(theta))^2)/(2*Height^2);

        P = A*exp(-(a*(t1-t10).^2+ 2*b*(t1-t10).*(t2-t20)+c*(t2-t20).^2));
        
    elseif tdf_choice == 4 %insert name of choice
        
        P = exp(-(t1).^2); %1D Fock State


    elseif tdf_choice == 5 %1D Bell State
        
        P = exp(-(t1-2).^2) + exp(-(t1+2).^2);
        
    end
    
end