function [y, error, valid] = image_strip(u, thresh, thresh_abs)
% trim out horizontal slice of image
y = u(325:425, :, :);
dy = double(y);
redness = dy(:,:,1)./vecnorm(dy,1,3) .* dy(:,:,1)>thresh_abs;
y_reduction = max(redness,[],1);
fmin = find(y_reduction>thresh, 1, 'first');
fmax = find(y_reduction>thresh, 1, 'last');
if isempty(fmin) | isempty(fmax)
    valid = 0;
    error = nan;
else
    valid = 1;
    min_value = [find(y_reduction>thresh, 1, 'first')];
    max_value = [find(y_reduction>thresh, 1, 'last')];
    error = ((max_value(1) + min_value(1))/2 - 320)/320;
end