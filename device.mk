#
# Copyright (C) 2016 The CyanogenMod Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product, device/xiaomi/hermes/vendor/copyfiles.mk)
$(call inherit-product, vendor/xiaomi/hermes/hermes-vendor-blobs.mk)

LOCAL_PATH := device/xiaomi/hermes

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/xiaomi/hermes/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT      := 1920
TARGET_SCREEN_WIDTH       := 1080

# Dalvik/HWUI
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := hermes

# Prebuilt kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/xiaomi/hermes/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
   $(LOCAL_KERNEL):prebuilt/kernel

# xlog
PRODUCT_PACKAGES += \
libxlog

# Init
PRODUCT_PACKAGES += \
    hermes

# Gralloc
PRODUCT_PACKAGES += \
   libgralloc_extra

# Audio
PRODUCT_PACKAGES += \
    audio_policy.default \
    audio_policy.stub \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix \
    libtinyalsa

PRODUCT_COPY_FILES += \
    device/xiaomi/hermes/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/xiaomi/hermes/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/xiaomi/hermes/configs/audio_device.xml:system/etc/audio_device.xml \
    device/xiaomi/hermes/configs/audio_policy.conf:system/etc/audio_policy.conf

# Clear Motions
PRODUCT_COPY_FILES += \
    device/xiaomi/hermes/configs/mtk_clear_motion.cfg:system/etc/mtk_clear_motion.cfg

# Set default player to AwesomePlayer
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.use-awesome=true
    
# Bluetooth                            
PRODUCT_PACKAGES += \
    audio.a2dp.default 
PRODUCT_PACKAGES += \
    libbt-vendor
PRODUCT_COPY_FILES += \
    device/xiaomi/hermes/configs/bt_did.conf:system/etc/bluetooth/bt_did.conf
     
# Keyboard layout
PRODUCT_COPY_FILES += \
     device/xiaomi/hermes/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
     device/xiaomi/hermes/configs/ACCDET.kl:system/usr/keylayout/ACCDET.kl\
     device/xiaomi/hermes/configs/AVRCP.kl:system/usr/keylayout/AVRCP.kl      

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/enableswap.sh:root/enableswap.sh \
    $(LOCAL_PATH)/rootdir/factory_init.project.rc:root/factory_init.project.rc \
    $(LOCAL_PATH)/rootdir/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/rootdir/fstab.charger:root/fstab.charger\
    $(LOCAL_PATH)/rootdir/fstab.mt6795:root/fstab.mt6795 \
    $(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/init.mt6795.rc:root/init.mt6795.rc \
    $(LOCAL_PATH)/rootdir/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
    $(LOCAL_PATH)/rootdir/init.project.rc:root/init.project.rc \
    $(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
    $(LOCAL_PATH)/rootdir/init.ssd.rc:root/init.ssd.rc \
    $(LOCAL_PATH)/rootdir/init.xlog.rc:root/init.xlog.rc \
    $(LOCAL_PATH)/rootdir/meta_init.modem.rc:root/meta_init.modem.rc \
    $(LOCAL_PATH)/rootdir/meta_init.project.rc:root/meta_init.project.rc \
    $(LOCAL_PATH)/rootdir/meta_init.rc:root/meta_init.rc \
    $(LOCAL_PATH)/rootdir/init:root/init \
    $(LOCAL_PATH)/rootdir/init.storage.rc:root/init.storage.rc \
    $(LOCAL_PATH)/rootdir/init.cm.rc:root/init.cm.rc \

# Telecom
PRODUCT_COPY_FILES += \
    device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml \
    device/xiaomi/hermes/configs/ecc_list.xml:system/etc/ecc_list.xml \
    device/xiaomi/hermes/configs/spn-conf.xml:system/etc/spn-conf.xml 

# Thermal
PRODUCT_COPY_FILES += \
     device/xiaomi/hermes/configs/thermal/.ht120.mtc:system/etc/.tp/.ht120.mtc \
     device/xiaomi/hermes/configs/thermal/thermal.conf:system/etc/.tp/thermal.conf \
     device/xiaomi/hermes/configs/thermal/thermal.off.conf:system/etc/.tp/thermal.off.conf \
     device/xiaomi/hermes/configs/thermal/.thermal_policy_00:system/etc/.tp/.thermal_policy_00 \
     device/xiaomi/hermes/configs/thermal/.thermal_policy_01:system/etc/.tp/.thermal_policy_01 

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    device/xiaomi/hermes/configs/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Media	
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
	device/xiaomi/hermes/configs/media_codecs.xml:system/etc/media_codecs.xml \
	device/xiaomi/hermes/configs/media_codecs.xml:system/etc/permissions/media_codecs.xml \
	device/xiaomi/hermes/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_TAGS += dalvik.gc.type-precise

# Charger
PRODUCT_PACKAGES += \
      charger_res_images

# Live Display
 PRODUCT_PACKAGES += \
 	libjni_livedisplay

# Wifi
 PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx \
    libwifi-hal-mt66xx \
    wifi_hal \
    libwpa_client \
    hostapd \
    hostapd_cli \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf
    
PRODUCT_COPY_FILES += \
    device/xiaomi/hermes/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    device/xiaomi/hermes/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    device/xiaomi/hermes/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Ifaddrs
PRODUCT_PACKAGES += \
    libifaddrs

# Torch
PRODUCT_PACKAGES += \
    Torch

# STk
PRODUCT_PACKAGES += \
    Stk

# GPS
PRODUCT_COPY_FILES += \
     device/xiaomi/hermes/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml \

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
     ro.adb.secure=0 \
     ro.secure=1 \
     ro.allow.mock.location=1 \
     ro.debuggable=1 \
     ro.zygote=zygote64_32 \
     camera.disable_zsl_mode=1 \
     ro.mount.fs=EXT4 \
     persist.service.acm.enable=0 \
     persist.sys.usb.config=mtp,mass_storage \
     persist.sys.timezone=Europe/Moscow

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.telephony.ril_class=MediaTekRIL \
    ro.telephony.ril.config=fakeiccid  \
    persist.call_recording.enabled=true \
    persist.call_recording.src=1 \
    persist.debug.wfd.enable=1

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

 PRODUCT_PACKAGES += \
    libnl_2 \
    libtinyxml


# limit dex2oat threads to improve thermals
 PRODUCT_PROPERTY_OVERRIDES += \
     dalvik.vm.boot-dex2oat-threads=4 \
     dalvik.vm.dex2oat-threads=2 \
     dalvik.vm.image-dex2oat-threads=4


# FM Radio
PRODUCT_PACKAGES += \
     	FmRadio \
     	libfmjni \
	libfmmt6620 \
        libfmmt6628 \
        libfmmt6627 \
        libfmmt6630 \
        libfmcust 

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8

#sdcard
PRODUCT_COPY_FILES += \
	device/xiaomi/hermes/configs/platform.xml:system/etc/permissions/platform.xml

# ANT
PRODUCT_PACKAGES += \
	libantradio \
	antradio_app \
	ANT_RAM_CODE_E1.BIN \
	ANT_RAM_CODE_E2.BIN \
	AntHalService \
	com.dsi.ant.antradio_library

# ANT Permissions
PRODUCT_COPY_FILES += \
	external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

