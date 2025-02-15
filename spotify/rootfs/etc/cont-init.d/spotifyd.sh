#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Spotify Connect
# Sets up the configuration file for spotifyd
# ==============================================================================
declare username
declare password
declare name
declare bitrate

#bashio::config.require.username
#bashio::config.require.password

if ! bashio::config.has_value 'name'; then
    bashio::log.fatal
    bashio::log.fatal "Add-on configuration is incomplete!"
    bashio::log.fatal
    bashio::log.fatal "The Spotify client needs to be identifiable with a name"
    bashio::log.fatal "and it seems you haven't configured one."
    bashio::log.fatal
    bashio::log.fatal "Please set the 'name' add-on option."
    bashio::log.fatal
    bashio::exit.nok
fi

username=$(bashio::config 'username')
password=$(bashio::config 'password')
name=$(bashio::config 'name')
bitrate=$(bashio::config 'bitrate')

{
    echo "username = \"\""
    echo "password = \"\""
    echo "device_name = \"${name}\""
    echo "bitrate = ${bitrate}"
} >> /etc/spotifyd.conf
