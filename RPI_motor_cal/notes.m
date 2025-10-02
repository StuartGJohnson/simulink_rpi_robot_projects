% comparison of mag headings and state are in order for initial gain
% tuning. After that, comparison of linear motion and measured quantities
% after timed runs was done. Some useful plots along the way:

mag_vec = squeeze(mag_heading.signals.values);
plot(mag_vec-mag_vec(1),state.signals.values(:,3),'r+')
ylim([-5 25])
xlim([-5 25])
axis equal
grid

% note it is a bit of a trick to keep everything above stiction while
% adjusting gain. I found the following values:
% gain_left = -0.04
% gain_right = -0.045
% 
% vmin = 0.175 m/s
% vmax = 0.73 m/s
% note that the kinematic model for diff drive block (mathworks) defines
% positive omega as turning left!
