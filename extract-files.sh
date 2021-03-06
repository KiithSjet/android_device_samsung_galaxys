#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE=__DEVICE__

mkdir -p ../../../vendor/samsung/$DEVICE/proprietary

DIRS="
bin
etc/dhcpcd/dhcpcd-hooks
etc/wifi
lib/egl
lib/hw
media
"

for DIR in $DIRS; do
mkdir -p ../../../vendor/samsung/$DEVICE/proprietary/$DIR
done


FILES="
lib/libsecril-client.so
lib/libril.so
bin/rild
lib/libsec-ril.so
lib/libreference-ril.so
firmware/CE147F00.bin
firmware/CE147F01.bin
firmware/CE147F02.bin
firmware/CE147F03.bin
bin/gpsd/66ca3eb6.0
bin/gpsd/7651b327.0
bin/gpsd/803ca020.0
bin/gpsd/8c7fccef.0
bin/gpsd/c9dbfc2e.0
bin/gpsd/ddc328ff.0
bin/gpsd/ed62f4e3.0
bin/gpsd/f0b6e66f.0
bin/gpsd/glgps_samsungJupiter
etc/jupiter.xml
lib/libgps.so
lib/libsecgps.so
bin/BCM4329B1_002.002.023.0417.0430.hcd
etc/wifi/bcm4329_aps.bin
etc/wifi/bcm4329_mfg.bin
etc/wifi/bcm4329_sta.bin
etc/wifi/nvram_mfg.txt
etc/wifi/nvram_net.txt
etc/wifi/wifi.conf
etc/wifi/wpa_supplicant.conf
bin/wpa_supplicant
bin/dhcpcd
bin/wlservice 
lib/libwlservice.so
bin/npsmobex
bin/btld
bin/pvrsrvinit
lib/egl/libEGL_POWERVR_SGX540_120.so
lib/egl/libGLES_android.so
lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so
lib/egl/libGLESv2_POWERVR_SGX540_120.so
lib/libIMGegl.so
lib/libpvrANDROID_WSEGL.so
lib/libpvr2d.so
lib/libPVRScopeServices.so
bin/dbus-daemon
bin/killmediaserver
bin/logwrapper
bin/mfgloader
bin/notified_event
bin/vold
xbin/su
etc/dhcpcd/dhcpcd.conf
etc/dhcpcd/dhcpcd-hooks/01-test
etc/dhcpcd/dhcpcd-hooks/20-dns.conf
etc/dhcpcd/dhcpcd-hooks/95-configured
etc/dhcpcd/dhcpcd-run-hooks
lib/libarccamera.so
lib/libcamerafirmwarejni.so
lib/libcamera.so
lib/libseccameraadaptor.so
lib/libseccamera.so
lib/libs3cjpeg.so
cameradata/datapattern_420sp.yuv
cameradata/datapattern_front_420sp.yuv
lib/libtvoutservice.so
lib/libtvout.so
lib/lib_tvoutengine.so
lib/libtvoutfimc.so
lib/libtvouthdmi.so
lib/libtvout_jni.so
bin/tvoutserver
lib/libhardware.so
lib/libhardware_legacy.so
bin/sensorcalibutil_yamaha
bin/sensorserver_yamaha
bin/sensorstatutil_yamaha
lib/libms3c_yamaha.so
lib/libsensor_yamaha.so
lib/libsensor_yamaha_test.so
lib/hw/sensors.default.so
lib/hw/copybit.s5pc110.so
lib/hw/gralloc.default.so
lib/hw/gralloc.s5pc110.so
lib/hw/lights.s5pc110.so
bin/playlpm
bin/charging_mode
media/battery_charging_5.qmg
media/battery_charging_10.qmg
media/battery_charging_15.qmg
media/battery_charging_20.qmg
media/battery_charging_25.qmg
media/battery_charging_30.qmg
media/battery_charging_35.qmg
media/battery_charging_40.qmg
media/battery_charging_45.qmg
media/battery_charging_50.qmg
media/battery_charging_55.qmg
media/battery_charging_60.qmg
media/battery_charging_65.qmg
media/battery_charging_70.qmg
media/battery_charging_75.qmg
media/battery_charging_80.qmg
media/battery_charging_85.qmg
media/battery_charging_90.qmg
media/battery_charging_95.qmg
media/battery_charging_100.qmg
media/chargingwarning.qmg
media/Disconnected.qmg
"

for FILE in $FILES; do
adb pull system/$FILE ../../../vendor/samsung/$DEVICE/proprietary/$FILE
done

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/samsung/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
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

# This file is generated by device/samsung/__DEVICE__/extract-files.sh

#
# Prebuilt libraries that are needed to build open-source libraries
#


PRODUCT_COPY_FILES := \
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:obj/lib/libsecril-client.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libcamera.so:obj/lib/libcamera.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libs3cjpeg.so:obj/lib/libs3cjpeg.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvout.so:obj/lib/libtvout.so
    vendor/samsung/__DEVICE__/proprietary/lib/libgps.so:obj/lib/libgps.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libsecgps.so:obj/lib/libsecgps.so \


#
# RIL
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libril.so:system/lib/libril.so \
    vendor/samsung/__DEVICE__/proprietary/bin/rild:system/bin/rild \
    vendor/samsung/__DEVICE__/proprietary/lib/libsec-ril.so:system/lib/libsec-ril.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libreference-ril.so:system/lib/libreference-ril.so

 
#
# Firmware files
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F00.bin:system/firmware/CE147F00.bin \
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F01.bin:system/firmware/CE147F01.bin \
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F02.bin:system/firmware/CE147F02.bin \
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F03.bin:system/firmware/CE147F03.bin 

#
# GPS
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/66ca3eb6.0:system/bin/gpsd/66ca3eb6.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/7651b327.0:system/bin/gpsd/7651b327.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/803ca020.0:system/bin/gpsd/803ca020.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/8c7fccef.0:system/bin/gpsd/8c7fccef.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/c9dbfc2e.0:system/bin/gpsd/c9dbfc2e.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/ddc328ff.0:system/bin/gpsd/ddc328ff.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/ed62f4e3.0:system/bin/gpsd/ed62f4e3.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/f0b6e66f.0:system/bin/gpsd/f0b6e66f.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/glgps_samsungJupiter:system/bin/gpsd/glgps_samsungJupiter \
    vendor/samsung/__DEVICE__/proprietary/etc/jupiter.xml:system/etc/jupiter.xml \
    vendor/samsung/__DEVICE__/proprietary/lib/libgps.so:system/lib/libgps.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libsecgps.so:system/lib/libsecgps.so 

 
#
# WIFI
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/bin/BCM4329B1_002.002.023.0417.0430.hcd:system/bin/BCM4329B1_002.002.023.0417.0430.hcd \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/wifi.conf:system/etc/wifi/wifi.conf \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/samsung/__DEVICE__/proprietary/bin/wpa_supplicant:system/bin/wpa_supplicant \
    vendor/samsung/__DEVICE__/proprietary/bin/dhcpcd:system/bin/dhcpcd \
    vendor/samsung/__DEVICE__/proprietary/bin/wlservice:system/bin/wlservice \
    vendor/samsung/__DEVICE__/proprietary/lib/libwlservice.so:system/lib/libwlservice.so 


#
# Bluetooth
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/bin/npsmobex:system/bin/npsmobex \
    vendor/samsung/__DEVICE__/proprietary/bin/btld:system/bin/btld 

#
# Grafics
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/bin/pvrsrvinit:system/bin/pvrsrvinit \
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libEGL_POWERVR_SGX540_120.so:system/lib/egl/libEGL_POWERVR_SGX540_120.so \
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv2_POWERVR_SGX540_120.so:system/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libIMGegl.so:system/lib/libIMGegl.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libpvr2d.so:system/lib/libpvr2d.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libPVRScopeServices.so:system/lib/libPVRScopeServices.so



#
# Samsung binary crap
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/bin/dbus-daemon:system/bin/dbus-daemon \
    vendor/samsung/__DEVICE__/proprietary/bin/killmediaserver:system/bin/killmediaserver \
    vendor/samsung/__DEVICE__/proprietary/bin/logwrapper:system/bin/logwrapper \
    vendor/samsung/__DEVICE__/proprietary/bin/mfgloader:system/bin/mfgloader \
    vendor/samsung/__DEVICE__/proprietary/bin/notified_event:system/bin/notified_event \
    vendor/samsung/__DEVICE__/proprietary/bin/vold:system/bin/vold \
    vendor/samsung/__DEVICE__/proprietary/xbin/su:system/xbin/su



#
# Samsung config
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-hooks/01-test:system/etc/dhcpcd/dhcpcd-hooks/01-test \
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-hooks/20-dns.conf:system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-hooks/95-configured:system/etc/dhcpcd/dhcpcd-hooks/95-configured \
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks


#
# camera
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/lib/libarccamera.so:system/lib/libarccamera.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libcamerafirmwarejni.so:system/lib/libcamerafirmwarejni.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libcamera.so:system/lib/libcamera.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libseccamera.so:system/lib/libseccamera.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libs3cjpeg.so:system/lib/libs3cjpeg.so \
    vendor/samsung/__DEVICE__/proprietary/cameradata/datapattern_420sp.yuv:system/cameradata/datapattern_420sp.yuv \
    vendor/samsung/__DEVICE__/proprietary/cameradata/datapattern_front_420sp.yuv:system/cameradata/datapattern_front_420sp.yuv
#   vendor/samsung/__DEVICE__/proprietary/lib/libarccamera.so:system/lib/libcameraservice.so \



#
# TVOUT
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvoutservice.so:system/lib/libtvoutservice.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvout.so:system/lib/libtvout.so \
    vendor/samsung/__DEVICE__/proprietary/lib/lib_tvoutengine.so:system/lib/lib_tvoutengine.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvoutfimc.so:system/lib/libtvoutfimc.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvouthdmi.so:system/lib/libtvouthdmi.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvout_jni.so:system/lib/libtvout_jni.so \
    vendor/samsung/__DEVICE__/proprietary/bin/tvoutserver:system/bin/tvoutserver 


#
# TESTING
#
PRODUCT_COPY_FILES += \
   vendor/samsung/__DEVICE__/proprietary/lib/libhardware.so:system/lib/libhardware.so \
   vendor/samsung/__DEVICE__/proprietary/lib/libhardware_legacy.so:system/lib/libhardware_legacy.so


#
# Sensors
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/bin/sensorcalibutil_yamaha:system/bin/sensorcalibutil_yamaha \
    vendor/samsung/__DEVICE__/proprietary/bin/sensorserver_yamaha:system/bin/sensorserver_yamaha \
    vendor/samsung/__DEVICE__/proprietary/bin/sensorstatutil_yamaha:system/bin/sensorstatutil_yamaha \
    vendor/samsung/__DEVICE__/proprietary/lib/libms3c_yamaha.so:system/lib/libms3c_yamaha.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libsensor_yamaha.so:system/lib/libsensor_yamaha.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libsensor_yamaha_test.so:system/lib/libsensor_yamaha_test.so \
    vendor/samsung/__DEVICE__/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
    vendor/samsung/__DEVICE__/proprietary/lib/hw/copybit.s5pc110.so:system/lib/hw/copybit.s5pc110.so \
    vendor/samsung/__DEVICE__/proprietary/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    vendor/samsung/__DEVICE__/proprietary/lib/hw/gralloc.s5pc110.so:system/lib/hw/gralloc.s5pc110.so \
    vendor/samsung/__DEVICE__/proprietary/lib/hw/lights.s5pc110.so:system/lib/hw/lights.s5pc110.so

#
# Files for battery charging screen
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/playlpm:system/bin/playlpm \\
    vendor/samsung/__DEVICE__/proprietary/bin/charging_mode:system/bin/charging_mode \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_5.qmg:system/media/battery_charging_5.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_10.qmg:system/media/battery_charging_10.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_15.qmg:system/media/battery_charging_15.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_20.qmg:system/media/battery_charging_20.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_25.qmg:system/media/battery_charging_25.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_30.qmg:system/media/battery_charging_30.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_35.qmg:system/media/battery_charging_35.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_40.qmg:system/media/battery_charging_40.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_45.qmg:system/media/battery_charging_45.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_50.qmg:system/media/battery_charging_50.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_55.qmg:system/media/battery_charging_55.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_60.qmg:system/media/battery_charging_60.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_65.qmg:system/media/battery_charging_65.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_70.qmg:system/media/battery_charging_70.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_75.qmg:system/media/battery_charging_75.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_80.qmg:system/media/battery_charging_80.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_85.qmg:system/media/battery_charging_85.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_90.qmg:system/media/battery_charging_90.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_95.qmg:system/media/battery_charging_95.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_100.qmg:system/media/battery_charging_100.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/chargingwarning.qmg:system/media/chargingwarning.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/Disconnected.qmg:system/media/Disconnected.qmg

EOF

./setup-makefiles.sh
