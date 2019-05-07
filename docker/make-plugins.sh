cd /root/plugins/physics/collision_detector_ball_shooter
bear make -e WEBOTS_HOME=/usr/local/webots -e VERBOSE=1 all
chown -R $HOST_PERMS /root/plugins/physics/collision_detector_ball_shooter

