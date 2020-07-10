#!/bin/bash
echo $1
echo "$1"
MAP="https://fastdlv2.gflclan.com/file/gflfastdl/csgo/maps/$1.bsp"
echo $MAP
if curl --output /dev/null --silent --head --fail "$MAP"; then
    wget ${MAP}
    mv $1.bsp ./.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/Counter-Strike\ Global\ Offensive/csgo/maps/
else
    echo "No file."
    wget https://fastdlv2.gflclan.com/file/gflfastdl/csgo/maps/"$1".bsp.bz2
    bzip2 -d $1.bsp.bz2
    mv $1.bsp ./.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/Counter-Strike\ Global\ Offensive/csgo/maps/
    rm $1.bsp.bz2
fi
