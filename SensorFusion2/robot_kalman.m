% quick reference implementation using data from run1.mat
% load run1.mat

% state is [theta omega]'
% time step is dt (we start with consistently sampled data
dt = 1/30; % camera frame rate setting in the simulink model
% state prediction is linear
F = [1 dt; 0 1];
% we will start with process noise as the result of unknown
% angular accelerations with - pulling this out of my ear:
sigma_a = 0.02;
G = [dt^2/2 dt]';
Q = G*G'*sigma_a^2;

% measurement is linear, at least if you let heading be a measurement
H = [ 1 0; 0 1];
% measured values here are .34 radians peak to peak, so:
%sigma_hdg = 0.15;
%sigma_omega = 3.3e-4;
sigma_hdg = 0.05;
sigma_omega = 0.01;
% lets assume no covariance, so:
R = diag([sigma_hdg^2 sigma_omega^2]);

% data processing loop (using wiki page nomenclature)
% data: 2 x n
num_data = length(mag_heading.time);
z = zeros(2,num_data);
z(1,:) = squeeze(mag_heading.signals.values);
z(2,:) = squeeze(imu_gyro.signals.values(1,3,:));

% initialize to initial data values
x = zeros(2,num_data);
x(:, 1) = z(:,1);
P_km1_km1 =  R;

for k = 2:num_data
    x_km1_km1 = x(:, k-1);
    x_k_km1 = F*x_km1_km1; %no controls for now
    P_k_km1 = F*P_km1_km1*F' + Q;
    y_k = z(:,k) - H*x_k_km1;
    S_k = H*P_k_km1*H' + R;
    K_k = P_k_km1*H'/S_k;
    x_k_k = x_k_km1 + K_k*y_k;
    P_k_k = (eye(2)-K_k*H)*P_k_km1;
    %y_k_k = z_k - H*x_k_k;
    x(:, k) = x_k_k;
    P_km1_km1 = P_k_k;
end

figure();
plot(z(1,:),'r+')
hold on
plot(x(1,:),'b')










