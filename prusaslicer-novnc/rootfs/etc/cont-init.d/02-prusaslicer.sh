#!/usr/bin/with-contenv bashio
set -e

bashio::log.info 'Prepare PrusaSlicer folder on /config/prusaslicer'

if ! bashio::fs.directory_exists '/config/prusaslicer'; then
    mkdir -p /config/prusaslicer/
fi

if ! bashio::fs.directory_exists '/config/prusaslicer/.local'; then
    mkdir -p /config/prusaslicer/.local
fi

if ! bashio::fs.directory_exists '/config/prusaslicer/.config'; then
    mkdir -p /config/prusaslicer/.config
fi

if ! bashio::fs.directory_exists '/config/prusaslicer/.config/PrusaSlicer/'; then
    mkdir -p /config/prusaslicer/.config/PrusaSlicer/
fi

if ! bashio::fs.directory_exists '/share/prusaslicer/3dmodels/'; then
    mkdir -p /share/prusaslicer/3dmodels/
fi

if ! bashio::fs.directory_exists '/share/prusaslicer/prints/'; then
    mkdir -p /share/prusaslicer/prints/
fi

if ! bashio::fs.file_exists '/root/.config/gtk-3.0/bookmarks'; then
    mkdir -p /root/.config/gtk-3.0
    touch /root/.config/gtk-3.0/bookmarks
    echo "file:///share/prusaslicer/3dmodels/" > /root/.config/gtk-3.0/bookmarks
    echo "file:///share/prusaslicer/prints/" >> /root/.config/gtk-3.0/bookmarks
    echo "file:///config/prusaslicer/.config/PrusaSlicer/" >> /root/.config/gtk-3.0/bookmarks
fi