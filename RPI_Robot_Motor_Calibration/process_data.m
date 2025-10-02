% load data from deadband collection
%load deadband_raw_data.mat

% get mag calibration data from another slx/project
load mag_cal.mat

mag_raw = squeeze(mag.signals.values)';
% correct the mag data
mag_corr = (mag_raw-b)*A; 

% assuming the z axis (3) is up, compute the robot orientation angle
theta = unwrap(atan2(mag_corr(:,1),mag_corr(:,2)));
figure();
h_theta=plot(theta);

% pwm data
pwm18_raw = pwm18.signals.values;
pwm19_raw = pwm19.signals.values;

% plot
figure()
plot(pwm18_raw, 'r')
hold on
plot(pwm19_raw, 'g')

theta_smooth = conv(theta,[1 1 1 1 1 1 1 1 1 ],'same')/9;

% find friction overcoming PWM on startup - looks like about 0.25

% stuck robot indicator from recent velocity estimates
% should be implementable as a simulink block
% lets do st/lt

