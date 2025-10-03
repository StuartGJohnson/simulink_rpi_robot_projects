# RPI Robot Simulink Models (Interactive Web Views)

These are simulink models developed and used with a raspberry pi - based differential drive robot.
The models had various goals, but the ```rpi_controller``` model is an onboard-camera-based red-spot-marked
path follower. More comments forthcoming. Note that some model naming can be misleading - see the model comments
below.

- rpi_controller
  - A full controller to follow a path marked by red dots. Nothing fancy, a PID loop on a camera-based error signal.
  - [Open](./rpi_controller/webview.html)
- rpi_camera_feed
  - [Open](./rpi_camera_feed/webview.html)
- sensor_dump
  - [Open](./sensor_dump/webview.html)
- sensor_fusion
  - NOT sensor fusion. A model to generate synthetic IMU data and collect it as a precursor to IMU sensor fusion.
  - [Open](./sensor_fusion/webview.html)
- sensor_fusion_1
  - Not sensor fusion. A model to collect IMU data on the raspberry pi robot.
  - [Open](./sensor_fusion_1/webview.html)
- sensor_fusion_2
  - Actual IMU gyro + mag sensor fusion for heading.
  - [Open](./sensor_fusion_2/webview.html)
- robot_control
  - [Open](./robot_control/webview.html)
- rpi_frame_rate
  - [Open](./rpi_frame_rate/webview.html)
- rpi_long_ctrl
  - [Open](./rpi_long_ctrl/webview.html)
- rpi_motor_cal
  - [Open](./rpi_motor_cal/webview.html)
- motor_cal
  - [Open](./motor_cal/webview.html)
- friction_compensation_test
  - [Open](./friction_compensation_test/webview.html)
