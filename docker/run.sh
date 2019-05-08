if ! docker-compose run --rm devel; then
    exit $?
fi
docker-compose build run
xhost +
docker run --runtime=nvidia --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/snd \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
    -v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
    --group-add $(getent group audio | cut -d: -f3) \
    -v /mnt/wisrl/Documents/wcg/wcg_ai_soccer/examples:/root/examples \
    -e HOST_PERMS="$(id -u):$(id -g)" \
    bitsandscraps/aiwc:run-python3-cuda-10.0-ubuntu-18.04 /bin/bash /root/webots.sh
xhost -
