% digest omega-scan data and build a lut for better open-loop control
%load run5_wscan.mat

omega_imu = squeeze(imu_gyro.signals.values(1,3,:));
hdg = squeeze(mag_heading.signals.values);
pwm_r = pwm_right.signals.values(:,1);
pwm_l = pwm_left.signals.values(:,1);
target_omega = squeeze(omega_in.signals.values);

figure();plot(omega_in.signals.values,'+');

figure();plot(pwm_r);
figure();plot(pwm_l);

figure(); plot(hdg)

% take best points from the center of each time interval
% setting for the run were 10 seconds each
% from the simulink block
% this is for run8_wscan.mat (1st pass)
tvec = [0:10:230 232];
tvec = tvec(1:23);
dt=.01;
% note the dense sampling at low omega. this is to better sample the bottom
% of the curve as the motors start to move. The lut is very flat here -
% difficult work for an open-loop control approach on motor speed.
target_omega_vec = [1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10 0 0]
%target_omega_vec = [1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9.0 9.5 10.0 10.5 0 0];
% this is for run6_wscan.mat (2nd pass)
% tvec = [0:10:130 132];
% tvec = tvec(1:13);
% dt=.01;

sampled_omega_imu = [];
sampled_pwml = [];
sampled_pwmr = [];
sampled_omega_hdg = [];
sampled_command = [];

for t=tvec
    s1 = t/dt + 2/dt;
    s2 = t/dt + 9/dt;
    sampled_omega_imu = [sampled_omega_imu mean(omega_imu(s1:s2))];
    sampled_pwml = [sampled_pwml mean(pwm_l(s1:s2))];
    sampled_pwmr = [sampled_pwmr mean(pwm_r(s1:s2))];
    sampled_omega_hdg = [sampled_omega_hdg (hdg(s2)-hdg(s1))/7];
    sampled_command = [sampled_command mean(target_omega(s1:s2))];
end

% LUT data
dphi_req = (0.144/.033/2)*sampled_command;
%dphi_obs = (0.144/.033/2)*sampled_omega_hdg;
dphi_obs = (0.144/.033/2)*sampled_omega_imu;
% this is for run8_wscan.mat (1st pass)
lut_in = dphi_obs(4:end);
lut_out = dphi_req(4:end);
%lut_in = dphi_obs(1:end);
%lut_out = dphi_req(1:end);
figure();plot(lut_in, lut_out,'+')


