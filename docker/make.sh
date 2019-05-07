cd /root/controllers/supervisor
bear make -e WEBOTS_HOME=/usr/local/webots -e VERBOSE=1 all
chown -R $HOST_PERMS /root/controllers
