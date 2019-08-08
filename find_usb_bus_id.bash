#!/usr/bin/bash

EXIST=1
NON_EXIST=0

declare -gr SC_SCRIPT="$(realpath "$0")"
declare -gr SC_TOP="${SC_SCRIPT%/*}"

USB_BUS_NUM="$(readlink /dev/serial/by-id/usb-Silicon_Labs_CP2104_USB_to_UART_Bridge_Controller_*| awk '{print substr($0,7,7)}' )"

echo ${USB_BUS_NUM}

USB_BUS_NUMA="$(echo ${USB_BUS_NUM} | awk '{print substr($0,0,7)}')"
USB_BUS_NUMB="$(echo ${USB_BUS_NUM} | awk '{print substr($0,9,7)}')"



echo ${USB_BUS_NUMA}
echo ${USB_BUS_NUMB}

echo "epicsEnvSet(USB_BUS_NUMA, \"${USB_BUS_NUMA}\")" > ${SC_TOP}/usb_bus_id
echo "epicsEnvSet(USB_BUS_NUMB, \"${USB_BUS_NUMB}\")" >> ${SC_TOP}/usb_bus_id	
