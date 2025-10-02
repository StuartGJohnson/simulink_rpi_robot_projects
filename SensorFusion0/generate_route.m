function [route] = generate_route(n_pts, mode)
if nargin < 2
   mode = 'circular';
end
% generate x3d group for a navigable route
if strcmp(mode, 'circular')
    t=0:(n_pts-1);
    theta = t*2*pi/n_pts;
    x = cos(theta);
    y = sin(theta);
    scale = 1.5;
else
    n_pts_gen = n_pts / 5;
    t_gen=0:(n_pts_gen-1);
    theta_gen = t_gen*2*pi/n_pts_gen;
    t=0:(n_pts-1);
    theta = t*2*pi/n_pts;
    % generate random points in polar coords
    rnd_amp = 0.3;
    rnd_mean = 1.0;
    r = 2*(rand(1, n_pts_gen)-0.5)*rnd_amp + rnd_mean;
    % smooth interpolation to desired point count
    % periodic boundary conditions
    thetac = [theta_gen-2*pi theta_gen theta_gen+2*pi];
    rc = [ r r r];
    rsi = spline(thetac,rc,theta);
    x = rsi.*cos(theta);
    y = rsi.*sin(theta);
    scale = 1.5;
end

plot(x,y,'r+')
% hmm, what are those x3d coords, anyway
offset_x = 2.0;
offset_y = 0.75;
x_xformed = x*scale + offset_x;
y_xformed = y*scale + offset_y;

fid = fopen('snippet.x3d','w');
fprintf(fid, "<Group DEF='Route' >\n");
for j=1:length(x)
fprintf(fid, "<ProtoInstance name='Spot'>\n");
current_location = [num2str(x_xformed(j)) ' 0 ' num2str(y_xformed(j))];
fprintf(fid, ['<fieldValue name=''myTranslation'' value=''' current_location '''/>\n']);
fprintf(fid, "</ProtoInstance>\n");
end
fprintf(fid, "</Group>\n");
fclose(fid);
route = [x_xformed' -y_xformed'];

% example:
% <Group DEF='Route' >
%   <ProtoInstance name='Spot'>
%   <fieldValue name='myTranslation' value='0.5 0 -0.5'/>
%   </ProtoInstance>
%   <ProtoInstance name='Spot'>
%   <fieldValue name='myTranslation' value='0.5 0 0.5'/>
%   </ProtoInstance>
%   <ProtoInstance name='Spot'>
%   <fieldValue name='myTranslation' value='0.5 0 1'/>
%   </ProtoInstance>
%   <ProtoInstance name='Spot'>
%   <fieldValue name='myTranslation' value='0.5 0 0'/>
%   </ProtoInstance>
% </Group>
end