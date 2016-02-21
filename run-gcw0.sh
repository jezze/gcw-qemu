#!/bin/sh

# Possible values: spice, pa, alsa, sdl, oss, none, wav
export QEMU_AUDIO_DRV=alsa

# Note: add -hdc fat:rw:yourdir
# to mount yourdir as fat disk

MACHINE="-M malta -m 256"
FIRMWARE="-kernel vmlinux -hda boot.img -hdb data.img"
HARDWARE="-sdl -soundhw ac97 -rtc clock=vm"
NETWORK="-net nic,model=e1000 -net tap,script=no,downscript=no,ifname=tap0"
SERIAL="-serial stdio -monitor none"

qemu-system-mipsel $MACHINE $FIRMWARE $HARDWARE $NETWORK $SERIAL

