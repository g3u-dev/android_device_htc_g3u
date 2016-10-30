PRELIBED := device/htc/g3u/myLibs
PREBUILT := device/htc/g3u/prebuilt
VENDORPB := vendor/htc/g3u/proprietary
FRAMEBSE := frameworks/base/data/etc
FRAMENAT := frameworks/native/data/etc

# Inherit Languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product-if-exists, vendor/htc/g3u/g3u-vendor.mk)

# stuff common to all HTC phones (doesn't exist)
#$(call inherit-product, device/htc/common/common.mk)

# Add missing kernel modules
PRODUCT_COPY_FILES += \
    $(PREBUILT)/system/lib/modules/moc_crypto.ko:system/lib/modules/moc_crypto.ko \
    $(PREBUILT)/system/lib/modules/moc_crypto.ko.sig.3.4.10:system/lib/modules/moc_crypto.ko.sig.3.4.10 \
    $(PREBUILT)/system/lib/modules/moc_platform_mod.ko:system/lib/modules/moc_platform_mod.ko \
    $(PREBUILT)/system/lib/modules/texfat.ko:system/lib/modules/texfat.ko  

# Add wifi kernel modules
PRODUCT_COPY_FILES += \
    $(PREBUILT)/system/lib/modules/ath6kl_sdio.ko:system/lib/modules/ath6kl_sdio.ko \
    $(PREBUILT)/system/lib/modules/cfg80211.ko:system/lib/modules/cfg80211.ko

# Add prebuild library config files
PRODUCT_COPY_FILES += \
    $(PRELIBED)/libaudio/audio_policy.conf:system/etc/audio_policy.conf

# Add prebuild audio library from htc pyramid
PRODUCT_COPY_FILES += \
	$(PREBUILT)/system/lib/libaudioalsa.so:system/lib/libaudioalsa.so \
	$(PREBUILT)/system/lib/libaudioalsa.so:obj/lib/libaudioalsa.so

# Ramdisk
PRODUCT_COPY_FILES += \
    $(PREBUILT)/ramdisk/sbin/sfc:root/sbin/sfc \
    $(PREBUILT)/ramdisk/bt_permission.sh:root/bt_permission.sh \
    $(PREBUILT)/ramdisk/cwkeys:root/cwkeys \
    $(PREBUILT)/ramdisk/fstab.g3u:root/fstab.g3u \
    $(PREBUILT)/ramdisk/init:root/init \
    $(PREBUILT)/ramdisk/init.qcom.rc:root/init.qcom.rc \
    $(PREBUILT)/ramdisk/init.qcom.sh:root/init.qcom.sh \
    $(PREBUILT)/ramdisk/init.rc:root/init.rc \
    $(PREBUILT)/ramdisk/init.target.rc:root/init.target.rc \
    $(PREBUILT)/ramdisk/init.usb.rc:root/init.usb.rc \
    $(PREBUILT)/ramdisk/ueventd.rc:root/ueventd.rc \
    $(PREBUILT)/ramdisk/ueventd.target.rc:root/ueventd.target.rc

# Recovery
PRODUCT_COPY_FILES += \
    $(PREBUILT)/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    $(PREBUILT)/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    $(PREBUILT)/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    $(PREBUILT)/recovery/sbin/power_test:recovery/root/sbin/power_test \
    $(PREBUILT)/recovery/sbin/rmt_storage:recovery/root/sbin/rmt_storage
# offmode_charging images (why? because!)
$(shell mkdir -p `pwd`/out/target/product/g3u/recovery/root/res && \
	cp -R $(PREBUILT)/recovery/res/* `pwd`/out/target/product/g3u/recovery/root/res/)

## Packages
# Video decoding
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm7627a \
    gralloc.msm7627a \
    hwcomposer.msm7627a \
    libtilerenderer \
    libQcomUI

# Audio
PRODUCT_PACKAGES += \
    libacoustic \
    audio.primary.msm7627a \
    audio_policy.msm7627a \
    audio.a2dp.default \
    libaudioutils

# Other
PRODUCT_PACKAGES += \
    dexpreopt \
    gps.default \
    lights.msm7627a \
    sensors.msm7627a \
    power.msm7627a \
    libhealthd.msm7627a

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpaper
PRODUCT_PACKAGES += \
    librs_jni \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers

PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Keylayout, keychars and idc
PRODUCT_COPY_FILES += \
    $(PREBUILT)/system/usr/idc/hsml_touchscreen.idc:system/usr/idc/hsml_touchscreen.idc \
    $(PREBUILT)/system/usr/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    $(PREBUILT)/system/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    $(PREBUILT)/system/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    $(PREBUILT)/system/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    $(PREBUILT)/system/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    $(PREBUILT)/system/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    $(PREBUILT)/system/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    $(PREBUILT)/system/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    $(PREBUILT)/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(PREBUILT)/system/usr/keylayout/device-keypad.kl:system/usr/keylayout/device-keypad.kl \
    $(PREBUILT)/system/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    $(PREBUILT)/system/usr/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    $(PREBUILT)/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(PREBUILT)/system/usr/keylayout/sr_touchscreen.kl:system/usr/keylayout/sr_touchscreen.kl \
    $(PREBUILT)/system/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    $(PREBUILT)/system/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    $(PREBUILT)/system/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    $(PREBUILT)/system/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    $(PREBUILT)/system/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    $(PREBUILT)/system/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    $(PREBUILT)/system/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    $(PREBUILT)/system/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    $(PREBUILT)/system/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl

# Vold
PRODUCT_COPY_FILES += \
    $(PREBUILT)/system/etc/vold.fstab:system/etc/vold.fstab

# Media_profiles
PRODUCT_COPY_FILES += \
   $(PREBUILT)/system/etc/media_profiles.xml:system/etc/media_profiles.xml

# Wifi
PRODUCT_COPY_FILES += \
    $(PREBUILT)/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(PREBUILT)/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Post Boot
PRODUCT_COPY_FILES += \
    $(PREBUILT)/system/etc/init.post_boot.sh:system/etc/init.post_boot.sh \
    $(PREBUILT)/system/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

# Device permissions
PRODUCT_COPY_FILES += \
    $(FRAMEBSE)/platform.xml:system/etc/permissions/platform.xml \
    $(FRAMENAT)/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    $(FRAMENAT)/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    $(FRAMENAT)/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    $(FRAMENAT)/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    $(FRAMENAT)/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    $(FRAMENAT)/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    $(FRAMENAT)/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    $(FRAMENAT)/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    $(FRAMENAT)/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    $(FRAMENAT)/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    $(FRAMENAT)/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    $(FRAMENAT)/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    $(FRAMENAT)/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    $(FRAMENAT)/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    $(FRAMENAT)/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    $(FRAMENAT)/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    $(FRAMENAT)/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    $(FRAMENAT)/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    persist.sys.usb.config=mtp \
    persist.service.adb.enable=1

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    ro.vendor.extension_library=/system/lib/libqc-opt.so
 
# HTC Audio (stock)
PRODUCT_PROPERTY_OVERRIDES += \
    htc.audio.alt.enable=1 \
    htc.audio.hac.enable=1 \
    htc.audio.global.state=0 \
    htc.audio.global.profile=0 \
    htc.audio.beats.state=1 \
    htc.audio.beats.config=1 \
    htc.audio.alc.enable=1 \
    htc.audio.swalt.enable=1 \
    htc.audio.7k.audiorecorder=1 \
    htc.audio.global.speaker=0

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.dexopt-data-only=1

# Inherit hdpi
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, build/target/product/full.mk)
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_g3u
PRODUCT_DEVICE := g3u
