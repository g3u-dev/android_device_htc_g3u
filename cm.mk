# Inherit GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := g3u

# Set Resolution for BootAnimation
TARGET_BOOTANIMATION_NAME := vertical-480x800

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/g3u/g3u.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/g3u/overlay

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := g3u
PRODUCT_NAME := cm_g3u
PRODUCT_BRAND := htc
PRODUCT_MODEL := Desire 300 X515e
PRODUCT_MANUFACTURER := HTC

