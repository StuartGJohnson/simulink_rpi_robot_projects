% pull in preferred dataset from data collections
load('imu_data3.mat');
d = squeeze(mag.signals.values)';

% Correct the magnetometer data so that it lies on a sphere.
[A,b,magB] = magcal(d); % calibration coefficients
dc = (d-b)*A; % correct data to a sphere

% Visualize the uncalibrated and calibrated magnetometer data.
plot3(d(:,1),d(:,2),d(:,3), 'LineStyle', 'none', 'Marker', 'X', ...
    'MarkerSize', 8);
hold(gca, 'on');
grid(gca, 'on');
plot3(dc(:,1),dc(:,2),dc(:,3), 'LineStyle', 'none', 'Marker', ...
    'o', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
axis equal
xlabel('uT');
ylabel('uT');
xlabel('uT');
legend('Uncalibrated Samples', 'Calibrated Samples', ...
    'Location', 'southoutside');
title("Uncalibrated vs Calibrated" + newline + ...
    "Magnetometer Measurements");
hold(gca, 'off');

save('mag_cal.mat','magB', 'A','b');
