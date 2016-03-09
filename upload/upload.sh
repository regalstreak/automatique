#!/bin/bash

#
# Copyright (C) 2016 Automatique by regalstreak
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file will upload the ROM to your ftp mirror automatically
# Depends on: * The Declarations
#             * The files hosts.inf, users.inf, pass.inf
# Store host in hosts.inf
# Store username in users.inf
# Store password in pass.inf



# Clear terminal history
clear

# Intro
echo -e "Automatique by regalstreak"
echo -e ""
echo -e ""

# Declarations
DIR=								# Directory where the builds are stored	
ROM=								# ROM Directory from $DIR
HOST=` cat host.inf `						# FTP Host
USER=` cat user.inf `						# Username
PASS=` cat pass.inf `						# Password
ZIP=								# ROM zip name


# Upload it all
cd $DIR

echo -e "Connecting..."

ftp -inv $HOST << EOF
user $USER $PASS
cd $ROM
put $ZIP
bye
EOF


# Cd to home
cd $HOME


# Outrow
echo -e "Done uploading files!"
echo
echo -e "Thanks for using Automatique"
