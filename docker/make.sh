cd /root/controllers/supervisor
if bash /root/make-controllers.sh && bash /root/make-plugins.sh; then
    rc=0
else
    rc=$?
fi
exit $rc
