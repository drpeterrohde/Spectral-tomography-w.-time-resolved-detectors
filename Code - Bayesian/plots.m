%***%%set up seperate function for plots
% Plots
colormap jet;

if tdf_choice == 4 || tdf_choice == 5
    
    subplot(m,2,[1 2]);
    plot(range, tdf_data)
    xlabel('t_1', 'FontSize', 16);
    ylabel('', 'FontSize', 16);
    title('Temporal distribution function', 'FontSize', 16);
    set(gca, 'FontSize', 14);
    
else
    
    subplot(m,2,1);
    contour(range, range', tdf_data)
    xlabel('t_1', 'FontSize', 16);
    ylabel('t_2', 'FontSize', 16);
    title('Temporal distribution function', 'FontSize', 16);
    set(gca, 'FontSize', 14);
    
    subplot(m,2,2);
    surf(range, range', tdf_data, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting', 'phong')
    xlabel('t_1', 'FontSize', 16);
    ylabel('t_2', 'FontSize', 16);
    set(gca, 'FontSize', 14);
    view(45,45);
    camlight headlight;

end

if tdf_choice ~= 3
    
    if tdf_choice == 4 || tdf_choice == 5
        
        subplot(m,2,[3 4]);
        plot(range, measurement_data);
        xlabel('m_1', 'FontSize', 16);
        ylabel('', 'FontSize', 16);
        title('Raw measurement data, ( \gamma=2)', 'FontSize', 16);%change this to give actual gamma and others
        set(gca, 'FontSize', 14);
        
        subplot(m,2,[5 6]);
        plot(range, reconstructed_data);
        xlabel('t_1', 'FontSize', 16);
        ylabel('', 'FontSize', 16);
        title('Reconstructed data ( \gamma=2)', 'FontSize', 16);
        set(gca, 'FontSize', 14);
    
    else
        
        subplot(m,2,3);
        contour(range, range', measurement_data);
        xlabel('m_1', 'FontSize', 16);
        ylabel('m_2', 'FontSize', 16);
        title('Raw measurement data, ( \gamma=2)', 'FontSize', 16);%change this to give actual gamma and others
        set(gca, 'FontSize', 14);

        subplot(m,2,4);
        surf(range, range', measurement_data, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting', 'phong');
        xlabel('m_1', 'FontSize', 16);
        ylabel('m_2', 'FontSize', 16);
        set(gca, 'FontSize', 14);
        view(45,45);
        camlight headlight;
        
        subplot(m,2,5);
        contour(range, range', reconstructed_data);
        xlabel('t_1', 'FontSize', 16);
        ylabel('t_2', 'FontSize', 16);
        title('Reconstructed data ( \gamma=2)', 'FontSize', 16);
        set(gca, 'FontSize', 14);

        subplot(m,2,6);
        surf(range, range', reconstructed_data, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting', 'phong');
        xlabel('t_1', 'FontSize', 16);
        ylabel('t_2', 'FontSize', 16);
        set(gca, 'FontSize', 14);
        view(45,45);
        camlight headlight;

    end
end

subplot(m,2,[position position+1])
plot(S_gammas, S_raw, '-ro', S_gammas, S_reconstructed, '-b+');
leg1 = legend('Measurements  .', 'Reconstructed  .');
set(leg1, 'Location', 'SouthEast', 'FontSize', 16);
legend('boxoff');
xlabel('\gamma', 'FontSize', 16);
ylabel('S', 'FontSize', 16);
title('Similarity', 'FontSize', 16);
set(gca, 'FontSize', 14);


subplot(m,2,[position+2 position+3])
plot(S_gammas, mu_raw, '-ro', S_gammas, mu_reconstructed, '-b+', S_gammas, mu_actual, '-mx');
leg1 = legend('Measurements  .', 'Reconstructed  .');
set(leg1, 'Location', 'NorthEast', 'FontSize', 16);
legend('boxoff');
xlabel('\gamma', 'FontSize', 16);
ylabel('\mu', 'FontSize', 16);
title('Mean', 'FontSize', 16);
set(gca, 'FontSize', 14);


if tdf_choice == 3
    subplot(m,2,[position+4 position+5])
    plot(S_gammas, E_measurement_data, '-ro', S_gammas, E_reconstructed_data, '-b+', S_gammas, E_actual_data, '-mx');  
    leg1 = legend('Measurements  .', 'Reconstructed  .','Actual');
    set(leg1, 'Location', 'SouthEast', 'FontSize', 16);
    legend('boxoff');
    xlabel('\gamma', 'FontSize', 16);
    ylabel('E', 'FontSize', 16);
    title('Entanglement', 'FontSize', 16);
    set(gca, 'FontSize', 14);
end