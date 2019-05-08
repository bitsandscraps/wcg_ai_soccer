cd /root/controllers/supervisor
if bear make -e WEBOTS_HOME=/usr/local/webots -e VERBOSE=1 all; then
    rc=0
else
    rc=$?
fi
chown -R $HOST_PERMS /root/controllers
exit $rc
