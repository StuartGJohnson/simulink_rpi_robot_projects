load run2.mat
t = kalman_out.time;
figure();plot(t, squeeze(mag_heading.signals.values)*180/pi,'r+')
hold on
plot(t, squeeze(kalman_out.signals.values(:,1))*180/pi,'b')
xlabel('time (seconds)');
ylabel('heading (degrees)');
title('Kalman filtered robot heading(blue) vs magnetic heading (red)')