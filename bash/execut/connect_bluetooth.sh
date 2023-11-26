#!/bin/sh


bluetoothctl devices | grep $1 | sed 's/Device \([^ ]*\).*/\1/' | xargs bluetoothctl connect
