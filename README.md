# RPI Robot Simulink Models (Interactive Web Views)

These are simulink models developed and used for a raspberry pi - based differential drive robot.
The models had various goals, but the ```rpi_controller``` model is an onboard-camera-based red-spot-marked
path follower.


## Interactive Simulink Views

[Open the GitHub Pages site →](https://StuartGJohnson.github.io/simulink_rpi_robot_projects/)

## Caveats

Note that the SensorFusion* directories and models are not named very well:
- SensorFusion0/sensor_fusion.slx generates simulated IMU data as a precursor to sensor fusion.
- SensorFusion1/sensor_fusion_1.slx generates robot IMU data as a precursor to sensor fusion.
- SensorFusion2/sensor_fusion_2.slx fuses robot IMU data into heading estimates via a Kalman filter.
