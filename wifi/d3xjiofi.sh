#!/bin/bash

ssid="d3xjiofi"

nmcli c down id $ssid
sleep 3
nmcli c up id $ssid
