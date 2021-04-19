#!/bin/bash

echo "*Created and developed by Pedro Lana*"

MY_DIR="$(dirname "$0")"

source "${MY_DIR}/docker/docker_install.sh" 

source "${MY_DIR}/node/nvm_install.sh"