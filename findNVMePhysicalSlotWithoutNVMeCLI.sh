#!/bin/bash
# Pre Requisite: nvme-cli should be installed
substring='virtual'
for i in $(ls /sys/block/| grep -i nvme)
do
	deviceLink=$(readlink -f /sys/block/$i)
	if [[ $deviceLink == *"virtual"* ]]; then
	continue 
	
 fi
 serial=$(cat /sys/block/$i/device/serial)	
 controller=$(basename $(dirname $deviceLink))
 bdf=$(basename $(dirname $(dirname $(dirname $deviceLink))))
 physicalSlot=$(lspci -v -s $bdf| awk '/Physical Slot:/{print $3}')
 if [[ ]]; then
	 i=
 echo "Physical Slot for the Block Device \"$i\" with Serial \"$serial\" under NVMe Contoller-\"$controller\" = \"$physicalSlot\""

done
