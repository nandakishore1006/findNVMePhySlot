# findNVMePhySlot

Small Bash Scripts to find out the Physical Slots of the PCIe NVMe Controllers.
If you want to power off the NVMe Controller using sysfs  i.e. "echo 0  > /sys/bus/pci/slots/[slot number]/power" and hence want to get the slot number of all the NVMe Controllers in the system, running these scripts will fetch the slots numbers at ease instead of manually searching them even with simple utility like lspci.

NOTE: This method may not be 100% efficient/Correct. Feel free to correct! Cheers!
