#!/bin/bash

#
# Copyright (C) 2016 Automatique by regalstreak
#


# This file will upload the ROM to your ftp mirror automatically
# Depends on: * The Declarations
#             * The files hosts.inf, users.inf, pass.inf
# Store host in hosts.inf
# Store username in users.inf
# Store password in pass.inf
# This file is automatique/upload/upload.sh


# Clear terminal history
clear

# Intro
echo -e "Automatique by regalstreak"
echo -e ""
echo -e ""

# Declarations			# Explanation				 	# Example

DIR=				# Directory where the builds are stored		# /home/regalstreak/android/oneplus2/Builds
FLOC=				# Directory where to store on FTP server	# /oneplus2/Custom/ROMs/Resurrection-Remix-6.x/Full
HOST=` cat host.inf `		# FTP Host					# basketbuild.com (in host.inf)
USER=` cat user.inf `		# Username				 	# regalstreak (in user.inf)
PASS=` cat pass.inf `		# Password				 	# (Your Password) (in pass.inf)
ZIP=				# ROM zip name				 	# ResurrectionRemix-M-*-oneplus2.zip (Note: Substitute changing stuff (date, version number, etc) with * like I have done)


# Upload it all
cd $DIR

echo -e "Connecting..."

ftp -inv $HOST << EOF
user $USER $PASS
cd $FLOC
put $ZIP
bye
EOF


# Cd to home
cd $HOME


# Outrow
echo -e "Done uploading files!"
echo
echo -e "Thanks for using Automatique"
