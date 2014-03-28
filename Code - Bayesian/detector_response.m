% Spectral tomography
% Peter Rohde
% Macquarie University

detector_range = [0.5:0.05:2];

detector_gamma_1 = 2;
detector_gamma_2 = 5;
detector_gamma_3 = 10;

detector_response_1 = detector_m_given_t(detector_gamma_1, 1, detector_range, mgt_choice);
detector_response_1 = detector_response_1 / sum(detector_response_1);

detector_response_2 = detector_m_given_t(detector_gamma_2, 1, detector_range, mgt_choice);
detector_response_2 = detector_response_2 / sum(detector_response_2);

detector_response_3 = detector_m_given_t(detector_gamma_3, 1, detector_range, mgt_choice);
detector_response_3 = detector_response_3 / sum(detector_response_3);

plot(detector_range, detector_response_1, '-ro');
hold on;
plot(detector_range, detector_response_2, '-b+');
hold on;
plot(detector_range, detector_response_3, '-gx');
hold off;
xlabel('m', 'FontSize', 16);
ylabel('P(m|t) ', 'FontSize', 16);
title('Detector response (t=1)   ', 'FontSize', 16);
set(gca, 'FontSize', 14);
leg1 = legend('\gamma=1', '\gamma=2', '\gamma=10');
legend('boxoff');
set(leg1, 'Location', 'NorthWest', 'FontSize', 16);