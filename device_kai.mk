$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# This directory did not exist, adapted from grouper proprietary files
$(call inherit-product-if-exists, vendor/lenovo/kai/device-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lenovo/kai/overlay

LOCAL_PATH := device/lenovo/kai
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/lenovo/kai/fstab.kai:root/fstab.kai \
    device/lenovo/kai/init.kai.rc:root/init.kai.rc
    device/lenovo/A2109A/ueventd.kai.rc:root/ueventd.kai.rc 

# Kernel modules
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kernel-modules/baseband_usb_chr.ko:system/lib/modules/baseband_usb_chr.ko \
    device/lenovo/kai/kernel-modules/baseband-xmm-power2.ko:system/lib/modules/baseband-xmm-power2.ko \
    device/lenovo/kai/kernel-modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    device/lenovo/kai/kernel-modules/cfg80211.ko:system/lib/modules/cfg80211.ko \
    device/lenovo/kai/kernel-modules/inv_mpu_ak8975.ko:system/lib/modules/inv_mpu_ak8975.ko \
    device/lenovo/kai/kernel-modules/inv_mpu_ak89xx.ko:system/lib/modules/inv_mpu_ak89xx.ko \
    device/lenovo/kai/kernel-modules/inv_mpu_kxtf9.ko:system/lib/modules/inv_mpu_kxtf9.ko \
    device/lenovo/kai/kernel-modules/lib80211.ko:system/lib/modules/lib80211.ko \
    device/lenovo/kai/kernel-modules/mac80211.ko:system/lib/modules/mac80211.ko \
    device/lenovo/kai/kernel-modules/mpu3050.ko:system/lib/modules/mpu3050.ko \
    device/lenovo/kai/kernel-modules/mpu6050b1.ko:system/lib/modules/mpu6050b1.ko \
    device/lenovo/kai/kernel-modules/raw_ip_net.ko:system/lib/modules/raw_ip_net.ko \
    device/lenovo/kai/kernel-modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/lenovo/kai/kernel-modules/tcrypt.ko:system/lib/modules/tcrypt.ko 

# HW
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-blobs/hw/gralloc.tegra.so:system/lib/hw/gralloc.tegra3.so \
    device/lenovo/kai/kai-blobs/hw/hwcomposer.tegra.so:system/lib/hw/hwcomposer.tegra3.so \
    device/lenovo/kai/kai-blobs/hw/audio.primary.tegra.so:system/lib/hw/audio.primary.tegra.so \
    device/lenovo/kai/kai-blobs/hw/audio_policy.tegra.so:system/lib/hw/audio_policy.tegra.so \
    device/lenovo/kai/kai-blobs/hw/camera.tegra.so:system/lib/hw/camera.tegra.so \
    device/lenovo/kai/kai-blobs/hw/gps.tegra.so:system/lib/hw/gps.tegra.so \
    device/lenovo/kai/kai-blobs/hw/lights.kai.so:system/lib/hw/lights.kai.so \
    device/lenovo/kai/kai-blobs/hw/nfc.tegra.so:system/lib/hw/nfc.tegra.so \
    device/lenovo/kai/kai-blobs/hw/sensors.kai.so:system/lib/hw/sensors.kai.so \
    device/lenovo/kai/kai-blobs/hw/ts.default.so:system/lib/hw/ts.default.so

# HW deps unique to a2109a, not available as oss Android
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-blobs/libaudioavp.so:system/lib/libaudioavp.so \
    device/lenovo/kai/kai-blobs/libnvaudioservice.so:system/lib/libnvaudioservice.so \
    device/lenovo/kai/kai-blobs/libsensors.base.so:system/lib/libsensors.base.so \
    device/lenovo/kai/kai-blobs/libsensors.jsa1127.so:system/lib/libsensors.jsa1127.so \
    device/lenovo/kai/kai-blobs/libsensors.lis3dh.so:system/lib/libsensors.lis3dh.so 

# Some sensors and associated unique deps
PRODUCT_COPY_FILES += \
   device/lenovo/kai/kai-blobs/sensors/libsensors.isl29018.so:system/lib/libsensors.isl29018.so \
   device/lenovo/kai/kai-blobs/sensors/libsensors.isl29028.so:system/lib/libsensors.isl29028.so \
   device/lenovo/kai/kai-blobs/sensors/libsensors.mpl.so:system/lib/libsensors.mpl.so \
   device/lenovo/kai/kai-blobs/libmplmpu.so:system/lib/libmplmpu.so \
   device/lenovo/kai/kai-blobs/libakmd.so:system/lib/libakmd.so

# EGL
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-blobs/egl/libEGL_perfhud.so:system/lib/egl/libEGL_perfhud.so \
    device/lenovo/kai/kai-blobs/egl/libEGL_tegra.so:system/lib/egl/libEGL_tegra.so \
    device/lenovo/kai/kai-blobs/egl/libEGL_tegra_impl.so:system/lib/egl/libEGL_tegra_impl.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv1_CM_perfhud.so:system/lib/egl/libGLESv1_CM_perfhud.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv1_CM_tegra.so:system/lib/egl/libGLESv1_CM_tegra.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv1_CM_tegra_impl.so:system/lib/egl/libGLESv1_CM_tegra_impl.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv2_perfhud.so:system/lib/egl/libGLESv2_perfhud.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv2_tegra.so:system/lib/egl/libGLESv2_tegra.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv2_tegra_impl.so:system/lib/egl/libGLESv2_tegra_impl.so \
    device/lenovo/kai/kai-blobs/libnvrm.so:system/lib/libnvrm.so \
    device/lenovo/kai/kai-blobs/libnvrm_graphics.so:system/lib/libnvrm_graphics.so \
    device/lenovo/kai/kai-blobs/libnvcap_video.so:system/lib/libnvcap_video.so \
    device/lenovo/kai/kai-blobs/libnvomxadaptor.so:system/lib/libnvomxadaptor.so \
    device/lenovo/kai/kai-blobs/libnvglsi.so:system/lib/libnvglsi.so \
    device/lenovo/kai/kai-blobs/libnvos.so:system/lib/libnvos.so \
    device/lenovo/kai/kai-blobs/libnvddk_2d.so:system/lib/libnvddk_2d.so \
    device/lenovo/kai/kai-blobs/libnvwsi.so:system/lib/libnvwsi.so \
    device/lenovo/kai/kai-blobs/libardrv_dynamic.so:system/lib/libardrv_dynamic.so \
    device/lenovo/kai/kai-blobs/libcgdrv.so:system/lib/libcgdrv.so

# A2109A specific config files and firmware
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-confs/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc \
    device/lenovo/kai/kai-confs/nvcamera.conf:etc/nvcamera.conf \
    device/lenovo/kai/kai-confs/Bluetooth_00_06_66_42.kl:system/usr/keylayout/Bluetooth_00_06_66_42.kl \
    device/lenovo/kai/kai-confs/Vendor_044f_Product_d007.kl:system/usr/keylayout/Vendor_044f_Product_d007.kl \
    device/lenovo/kai/kai-confs/Vendor_046d_Product_c21d.kl:system/usr/keylayout/Vendor_046d_Product_c21d.kl \
    device/lenovo/kai/kai-confs/Vendor_046d_Product_c21e.kl:system/usr/keylayout/Vendor_046d_Product_c21e.kl \
    device/lenovo/kai/kai-confs/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
    device/lenovo/kai/kai-confs/Vendor_057e_Product_0306.kl:system/usr/keylayout/Vendor_057e_Product_0306.kl \
    device/lenovo/kai/kai-confs/Vendor_2378_Product_100a.kl:system/usr/keylayout/Vendor_2378_Product_100a.kl \
    device/lenovo/kai/kai-confs/:system/usr/keylayout/ \
    device/lenovo/kai/kai-confs/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    device/lenovo/kai/kai-blobs/firmware/fw_bcmdhd.bin:vendor/firmware/bcm4330/fw_bcmdhd.bin \
    device/lenovo/kai/kai-blobs/firmware/fw_bcmdhd_apsta.bin:vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin \
    device/lenovo/kai/kai-blobs/firmware/fw_bcmdhd_p2p.bin:vendor/firmware/bcm4330/fw_bcmdhd_p2p.bin \
    device/lenovo/kai/kai-blobs/firmware/mfg.bin:vendor/firmware/bcm4330/mfg.bin \

$(call inherit-product, build/target/product/full_base.mk)

# Build characteristics setting 
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only \
    ro.sf.lcd_density=160 \
    ro.sf.override_null_lcd_density = 1 \
    persist.sys.usb.config=mtp,adb

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := kai
PRODUCT_DEVICE := kai
PRODUCT_MODEL := Lenovo A2109A
