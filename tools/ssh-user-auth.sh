#!/bin/bash
/bin/grep -w "$1" /etc/authorized_keys | cut -d: -f2 
