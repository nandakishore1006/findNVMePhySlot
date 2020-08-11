#!/bin/bash
# Pre Requisite: nvme-cli should be installed
nvme &>/dev/null
nvmecliExists=$(echo $?)
if [ $nvmecliExists -ne 0 ]
then
	echo "nvme-cli is not installed.. Please install it first."
	exit 0
fi

pushd /sys/class/nvme 1>/dev/null
for i in $(ls | grep -i nvme)
do 
 serial=$(cat $i/serial)
 device=$(nvme list|grep $serial|awk '{print $1}')
 bdf=$(cat $i/address)
 PhysicalSlot=$(lspci -v -s $bdf| awk '/Physical Slot:/{print $3}')
 echo "Physical Slot for the Block Device \"$device\" with Serial \"$serial\" under NVMe Contoller-\"$i\" = \"$PhysicalSlot\""

done
popd 1>/dev/null
