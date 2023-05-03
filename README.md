# OFRP Device configuration for Motorola Moto G6 Plus

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core 2.2 GHz Cortex-A53
CHIPSET | Qualcomm SDM630 Snapdragon 630
GPU     | Adreno 508
Memory  | 4GB or 6GB
Shipped Android Version | 8.0 (Oreo)
Storage | 64GB or 128GB
Battery | 3200 mAh
Dimensions | 160 x 75.5 x 8 mm
Display | 1080 x 2160 pixels, 5.9" IPS LCD
Rear Camera  | 12 MP (f/1.7) + 5 MP (f/2.2), (PDAF, dual pixel)
Front Camera | 8 MP (f/2.2)

![Device Picture](https://cdn2.gsmarena.com/vv/pics/motorola/motorola-moto-g6-plus-2.jpg)

### Kernel Source
Check here: https://github.com/jro1979oliver/android_kernel_motorola_msm8998

### Building
Generally, see https://wiki.orangefox.tech/en/dev/building

### Variants

For standard mode, build without any additional flags.
To build for ROMs using retrofitted dynamic partitions, run "export FOX_USE_DYNAMIC_PARTITIONS=1" before building.
To build for ROMs using borrowed keymaster 4.0, run "export FOX_USE_KEYMASTER_4=1" before building.

### How to compile

```sh
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL="C"
export OF_VANILLA_BUILD=1
export OF_AB_DEVICE=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
lunch twrp_evert-eng && mka adbd bootimage
```
### Copyright
 ```
  /*
  *  Copyright (C) 2023 LineageOS Project
  *
  *  Copyright (C) 2019-2023 The OrangeFox Recovery Project
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  *
  */
  ```
