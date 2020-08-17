 #!/bin/bash
 MAP="https://fastdlv2.gflclan.com/file/gflfastdl/csgo/maps/$1.bsp"
 echo "Map to be downloaded:"
 echo $MAP
 echo "Finding CS:GO maps directory...."
 maps_dir=$(find / -print 2>/dev/null | grep -s csgo/maps | head -n 1)
 echo "Directory found at: $maps_dir"
 if curl --output /dev/null --silent --head --fail "$MAP"; then
     wget ${MAP}
     mv $1.bsp "$maps_dir"
 else
     echo "No file."
     wget https://fastdlv2.gflclan.com/file/gflfastdl/csgo/maps/"$1".bsp.bz2
     bzip2 -d $1.bsp.bz2
     mv $1.bsp "$maps_dir"
 fi
