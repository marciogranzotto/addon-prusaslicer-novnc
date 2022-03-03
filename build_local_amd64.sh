cd prusaslicer-novnc && docker build --build-arg BUILD_FROM="ghcr.io/hassio-addons/debian-base/amd64:5.2.3" --build-arg BUILD_ARCH=amd64 --progress plain -t prusaslicer-novnc .
# cd prusaslicer-novnc && \
# docker run \
#   --rm \
#   -it \
#   --name builder \
#   --privileged \
#   -v prusaslicer-novnc:/data \
#   -v /var/run/docker.sock:/var/run/docker.sock:ro \
#   homeassistant/amd64-builder \
#   -t /data \
#   --all \
#   --test \
#   -i prusaslicer-novnc-arm64 \
#   -d local