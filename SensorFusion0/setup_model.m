% or load model_state.mat and skip this
route = generate_route(50, 'rand');
vec_start = route(2,:)-route(1,:);
vec_start = vec_start./norm(vec_start,2);
initial_angle = atan2(vec_start(2),vec_start(1));
vehicle_initial_state = [route(1,:) initial_angle];
% select the controller; 0 = pid, 1 = pure pursuit from known route
pid_pp_selector = 0;
