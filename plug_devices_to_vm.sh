#!/bin/bash
devices=(
    "258a:0049"
    "0d8c:0012"
    "046d:c092"
)


for val in ${devices[@]}; do

    # they are numbered in depth-first order.)
    string=$(lsusb | grep $val)
    echo $string
    if [[ $string =~ ([0-9]+)[[:space:]]Device[[:space:]]([0-9]+).* ]]
    then
        BUSNUM=${BASH_REMATCH[1]} DEVNUM=${BASH_REMATCH[2]} ACTION="add" DEVTYPE="usb_device" SUBSYSTEM="usb" /opt/usb-libvirt-hotplug.sh win10
    fi
   echo $val
done
