cd /root/plugins/physics/collision_detector_ball_shooter
if bear make -e WEBOTS_HOME=/usr/local/webots -e VERBOSE=1 all; then
    rc=0
else
    rc=$?
fi
chown -R $HOST_PERMS /root/plugins/physics/collision_detector_ball_shooter
exit $rc
