#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2019-2022 The OrangeFox Recovery Project
#	
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
# 	
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="evert"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
  export TW_DEFAULT_LANGUAGE="en"
  export OF_SCREEN_H=2160
  export OF_CLOCK_POS=1
	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_FORCE_PREBUILT_KERNEL=1
 	export FOX_USE_DYNAMIC_PARTITIONS=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
  export LC_ALL="C"
  export OF_VANILLA_BUILD=1
  export OF_AB_DEVICE=1

        # use system (ROM) fingerprint where available
        export OF_USE_SYSTEM_FINGERPRINT=1

	# OTA for custom ROMs
        # export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
        export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

	# run a process after formatting data to work-around MTP issues (only if forced-encryption is being disabled)
	export OF_RUN_POST_FORMAT_PROCESS=1

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi

  	for var in eng user userdebug; do
  		add_lunch_combo twrp_"$FDEVICE"-$var
  	done
fi
#
