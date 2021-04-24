#!/bin/bash

RESET='\033[0m'
BOLD='\033[1m'
BLUE='\033[34m'
YELLOW='\033[33m'
GREY='\033[90m'

function log {
	color=$1
	message=$2

	echo -e "${BOLD}${GREY}~~~> ${color}${message}${RESET}"
}


function info {
	log $BLUE "[INFO] $@"
}

function warn {
	log $YELLOW "[WARN] $@"
}