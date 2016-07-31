#!/bin/bash
cd frameworks/av
git reset --hard ; git clean -qfdx
git apply -v ../../device/xiaomi/hermes/patches/framework_av/0001-libmedia-stub-out-MTK-specific-bits-audio-working.patch
git apply -v ../../device/xiaomi/hermes/patches/framework_av/0002-camera.patch
git apply -v ../../device/xiaomi/hermes/patches/framework_av/0003-frameworks_av_fmradio_patch.patch
git apply -v ../../device/xiaomi/hermes/patches/framework_av/038d57b7b713edb1016d5dcc977459701949e487.patch
cd ../..
cd frameworks/base
git reset --hard ; git clean -qfdx
git apply -v ../../device/xiaomi/hermes/patches/framework_base/0001-location-support-GNSS-extension-presumably-from-MTK.patch
git apply -v ../../device/xiaomi/hermes/patches/framework_base/0002-location-add-some-logs-just-to-be-confident.patch
git apply -v ../../device/xiaomi/hermes/patches/framework_base/0003-location-style-fix.patch
git apply -v ../../device/xiaomi/hermes/patches/framework_base/0006-add-com.mediatek-for-build.patch
git apply -v ../../device/xiaomi/hermes/patches/framework_base/0007-Update-for-mtk.patch
git apply -v ../../device/xiaomi/hermes/patches/framework_base/0008-Fix_and_Optimizations.patch
git apply -v ../../device/xiaomi/hermes/patches/framework_base/Advanced_reboot_enabled_by_default_1_2.patch
git apply -v ../../device/xiaomi/hermes/patches/framework_base/GoogleCamera3_Workaround.patch
cd ../..
cd frameworks/opt/telephony
git reset --hard ; git clean -qfdx
git apply -v ../../../device/xiaomi/hermes/patches/framework_opt_telephony/0001-Update-for-mtk.patch
cd ../../..
cd packages/services/Telephony
git reset --hard ; git clean -qfdx
git apply -v ../../../device/xiaomi/hermes/patches/packages_services_Telpheony/0001-Update-for-mtk.patch
cd ../../..
cd system/core
git reset --hard ; git clean -qfdx
git apply -v ../../device/xiaomi/hermes/patches/system_core/0001-fix-boot-for-mtk.patch
git apply -v ../../device/xiaomi/hermes/patches/system_core/0002-Fix_and_Optimizations.patch
cd ../..
cd system/netd
git reset --hard ; git clean -qfdx
git apply -v ../../device/xiaomi/hermes/patches/system_netd/0001-hotpost-fix.patch
cd ../..
cd hardware/libhardware
git reset --hard ; git clean -qfdx
git apply -v ../../device/xiaomi/hermes/patches/hardware_libhardware/0001-fix-gps-light-audio.patch
cd ../..
cd hardware/libhardware_legacy
git reset --hard ; git clean -qfdx
git apply -v ../../device/xiaomi/hermes/patches/hardware_libhardware_legacy/0001-patch-for-mtk.patch
cd ../..
cd packages/apps/Settings
git reset --hard ; git clean -qfdx
git apply -v ../../../device/xiaomi/hermes/patches/packages_apps_Settings/0001-multisim.patch
git apply -v ../../../device/xiaomi/hermes/patches/packages_apps_Settings/Advanced_reboot_enabled_by_default_2_2.patch
cd ../../..
cd libcore
git reset --hard ; git clean -qfdx
git apply -v ../device/xiaomi/hermes/patches/libcore/73098e8a00487b055a569760a43fd6fde342d703.patch
cd -
cd external/bluetooth/bluedroid/
git reset --hard ; git clean -qfdx
git apply -v ../../../device/xiaomi/hermes/patches/external_bluetooth_bluedroid/932c01b05465fbf1ae3933efa915902b7f30aec9.patch
cd -
cd bionic
git reset --hard ; git clean -qfdx
git apply -v ../device/xiaomi/hermes/patches/bionic/36764b95ebffdd579870373ba2c8b7c59b28e6dc.patch
git apply -v ../device/xiaomi/hermes/patches/bionic/ceb12755ea7848c3473e861ecdd59d113752a5ca.patch
git apply -v ../device/xiaomi/hermes/patches/bionic/3027288433a30440156f80f6b653a4a4563d2051.patch
git apply -v ../device/xiaomi/hermes/patches/bionic/b30ee01616a34e2a7767f00ac47d31d0d8b4cb6e.patch
cd -
echo Patches Applied Successfully!

