figure();
for image_ind = 1:length(error_est.time)
%for image_ind = 1:2
    p_image = processed_image.signals.values(:,:,:,image_ind);
    error =  error_est.signals.values(image_ind);
    clf;
    imagesc(p_image);
    hold on;
    linex = error*320+320;
    plot([linex linex],[0 200], 'g-');
    title(num2str(image_ind));
    waitforbuttonpress();
end

% and scatter plot the mag results vs the image processing
figure();plot(squeeze(error_est.signals.values),squeeze(mag_heading.signals.values),'r+')