#!/usr/bin/env python3
import dbus
import sys

trunclen = 25

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")
    spotify_properties = dbus.Interface(spotify_bus, "org.freedesktop.DBus.Properties")

    metadata = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "Metadata")

    artist = metadata['xesam:artist'][0]
    song = metadata['xesam:title']

    # Ensure Unicode support
    artist = artist.encode('utf-8', 'ignore').decode('utf-8')
    song = song.encode('utf-8', 'ignore').decode('utf-8')

    output = artist + ' - ' + song
    print(output)

except Exception as e:
    print("spotify closed", file=sys.stderr)
