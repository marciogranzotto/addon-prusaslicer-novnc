#!/usr/bin/with-contenv bashio
set -e

bashio::log.info 'Set some defaults'

sed -i "/UI.initSetting('show_dot'/ s/false/true/; /UI.initSetting('resize'/ s/off/remote/" /noVNC/app/ui.js