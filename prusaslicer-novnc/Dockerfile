# Get and install Easy noVNC.
ARG BUILD_FROM=ghcr.io/hassio-addons/debian-base/amd64:5.2.3

# hadolint ignore=DL3006
FROM $BUILD_FROM AS NO_VNC

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Build arguments
ARG BUILD_ARCH

# hadolint ignore=DL3008
RUN apt-get update && apt-get -y --no-install-recommends install \
    git

RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/noVNC.git -b v1.3.0 /noVNC

# hadolint ignore=DL3006
FROM $BUILD_FROM AS WEBSOCKIFY

# hadolint ignore=DL3008
RUN apt-get update && apt-get -y --no-install-recommends install \
    git \
    python3 \
    python3-setuptools \
    python3-numpy \
    python3-pip

RUN pip3 install --no-cache-dir Cython==0.29.26

# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/websockify -b v0.10.0 /websockify && \
    cd /websockify && python3 setup.py install

# hadolint ignore=DL3006
FROM $BUILD_FROM

# hadolint ignore=DL3008
RUN apt-get update && apt-get -y --no-install-recommends install \
    git \
    python3 \
    python3-setuptools \
    python3-numpy \
    procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=NO_VNC /noVNC /noVNC
COPY --from=WEBSOCKIFY /usr/local/lib/python3.9/dist-packages/ /usr/local/lib/python3.9/dist-packages/
COPY --from=WEBSOCKIFY /usr/local/bin/websockify /usr/local/bin/websockify

# Get TigerVNC and Supervisor for isolating the container.
# hadolint ignore=DL3008
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends menu openbox tigervnc-standalone-server supervisor gosu && \
    rm -rf /var/lib/apt/lists && \
    mkdir -p /usr/share/desktop-directories

# Get all of the remaining dependencies for the OS, VNC, and Prusaslicer.
# hadolint ignore=DL3008
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends lxterminal nano wget openssh-client rsync ca-certificates xdg-utils htop tar xzip gzip bzip2 zip unzip && \
    rm -rf /var/lib/apt/lists

# hadolint ignore=DL3027
RUN apt update && apt install -y --no-install-recommends --allow-unauthenticated \
        lxde gtk2-engines-murrine gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine arc-theme \
        freeglut3 libgtk2.0-dev libwxgtk3.0-gtk3-dev libwx-perl libxmu-dev libgl1-mesa-glx libgl1-mesa-dri \
        xdg-utils locales locales-all pcmanfm jq curl git nginx libnginx-mod-http-lua openssl \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Install Prusaslicer
# Many of the commands below were derived and pulled from previous work by dmagyar on GitHub.
# Here's their Dockerfile for reference https://github.com/dmagyar/prusaslicer-vnc-docker/blob/main/Dockerfile.amd64
WORKDIR /slic3r
COPY get_latest_prusaslicer_release.sh /slic3r/

# hadolint ignore=SC2086
ARG SLICER_VERSION="2.5.0-alpha3"
RUN chmod +x /slic3r/get_latest_prusaslicer_release.sh \
    && latestSlic3r=$(/slic3r/get_latest_prusaslicer_release.sh url name_ver $SLICER_VERSION) \
    && slic3rReleaseName=$(/slic3r/get_latest_prusaslicer_release.sh name name_ver $SLICER_VERSION) \
    && curl -sSL ${latestSlic3r} > ${slic3rReleaseName} \
    && rm -f /slic3r/releaseInfo.json \
    && mkdir -p /slic3r/slic3r-dist \
    && tar -xjf ${slic3rReleaseName} -C /slic3r/slic3r-dist --strip-components 1 \
    && rm -f /slic3r/${slic3rReleaseName} \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoclean \
    && mkdir -p /slic3r \
    && mkdir -p /share/prints/ \
    && chmod +x /slic3r/slic3r-dist/prusa-slicer \
    && locale-gen en_US 

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

COPY menu.xml /etc/xdg/openbox/