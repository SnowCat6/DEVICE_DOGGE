
include device/DOOGEE/$(MTK_TARGET_PROJECT)/ProjectConfig.mk

# PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/egl.cfg:$(TARGET_COPY_OUT_VENDOR)/lib/egl/egl.cfg:mtk
# PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/ueventd.mt6735.rc:root/ueventd.mt6735.rc

PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/factory_init.project.rc:root/factory_init.project.rc
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/init.project.rc:root/init.project.rc
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/meta_init.project.rc:root/meta_init.project.rc

ifeq ($(MTK_SMARTBOOK_SUPPORT),yes)
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/sbk-kpd.kl:system/usr/keylayout/sbk-kpd.kl:mtk \
                      device/DOOGEE/X5PRO/sbk-kpd.kcm:system/usr/keychars/sbk-kpd.kcm:mtk
endif

# Add FlashTool needed files
#PRODUCT_COPY_FILES += device/DOOGEE/$(MTK_TARGET_PROJECT)/EBR1:EBR1
#ifneq ($(wildcard device/DOOGEE/$(MTK_TARGET_PROJECT)/EBR2),)
#  PRODUCT_COPY_FILES += device/DOOGEE/$(MTK_TARGET_PROJECT)/EBR2:EBR2
#endif
#PRODUCT_COPY_FILES += device/DOOGEE/$(MTK_TARGET_PROJECT)/MBR:MBR
#PRODUCT_COPY_FILES += device/DOOGEE/$(MTK_TARGET_PROJECT)/MT6737M_Android_scatter.txt:MT6737M_Android_scatter.txt


# thermal.conf and thermal_eng.conf:with BCCT 
# thermal_NoBCCT.conf and thermal_eng_NoBCCT.conf:no BCCT 
# thermal policy no BCCT
ifeq ($(TARGET_BUILD_VARIANT),eng)
    PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/thermal_eng.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.conf:mtk
else
    PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/thermal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.conf:mtk
endif
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/ht120.mtc:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.ht120.mtc:mtk



# alps/vendor/mediatek/proprietary/external/GeoCoding/Android.mk

# alps/vendor/mediatek/proprietary/frameworks-ext/native/etc/Android.mk
# sensor related xml files for CTS
ifneq ($(strip $(CUSTOM_KERNEL_ACCELEROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_MAGNETOMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_ALSPS)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
else
  ifneq ($(strip $(CUSTOM_KERNEL_PS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  endif
  ifneq ($(strip $(CUSTOM_KERNEL_ALS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
  endif
endif

ifneq ($(strip $(CUSTOM_KERNEL_GYROSCOPE)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_BAROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml
endif

# touch related file for CTS
ifeq ($(strip $(CUSTOM_KERNEL_TOUCHPANEL)),generic)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
else
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
endif

# USB OTG
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# GPS relative file
ifeq ($(MTK_GPS_SUPPORT),yes)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml
endif

# alps/external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/Android.mk
# PRODUCT_COPY_FILES += external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/driver/open_nfc_driver.ko:$(TARGET_COPY_OUT_VENDOR)/lib/open_nfc_driver.ko:mtk

# alps/frameworks/av/media/libeffects/factory/Android.mk
PRODUCT_COPY_FILES += frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

# alps/mediatek/config/$project
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml



# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.service.acm.enable=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.mount.fs=EXT4

#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=128m
#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=256m

# meta tool
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.chip_ver=S01
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.platform=MT6737M

# set Telephony property - SIM count
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)
PRODUCT_PROPERTY_OVERRIDES += persist.radio.default.sim=0

# Audio Related Resource
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/X5PRO/factory/res/sound/testpattern1.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/testpattern1.wav:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/X5PRO/factory/res/sound/ringtone.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/ringtone.wav:mtk

# Keyboard layout
PRODUCT_COPY_FILES += device/mediatek/mt6735/ACCDET.kl:system/usr/keylayout/ACCDET.kl:mtk
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl:mtk

# Microphone
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml

# Camera
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# Audio Policy
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf:mtk

#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/X5PRO/factory/res/images/lcd_test_00.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_00.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/X5PRO/factory/res/images/lcd_test_01.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_01.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/X5PRO/factory/res/images/lcd_test_02.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_02.png:mtk

#media_codecs.xml for video codec support
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/media_codecs.xml:system/etc/media_codecs.xml:mtk
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/media_codecs_performance.xml:system/etc/media_codecs_performance.xml:mtk
ifneq ($(MTK_BASIC_PACKAGE), yes)
    ifeq ($(strip $(MTK_AUDIO_CODEC_SUPPORT_TABLET)), yes)
        PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/media_codecs_mediatek_audio_tablet.xml:system/etc/media_codecs_mediatek_audio.xml:mtk
    else
        PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/media_codecs_mediatek_audio_phone.xml:system/etc/media_codecs_mediatek_audio.xml:mtk
    endif
else
    PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/media_codecs_mediatek_audio_basic.xml:system/etc/media_codecs_mediatek_audio.xml:mtk
endif
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml:mtk
PRODUCT_COPY_FILES += device/DOOGEE/X5PRO/mtk_omx_core.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mtk_omx_core.cfg:mtk
PRODUCT_COPY_FILES += frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml
PRODUCT_COPY_FILES += frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# overlay has priorities. high <-> low.

DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/sd_in_ex_otg

DEVICE_PACKAGE_OVERLAYS += device/DOOGEE/X5PRO/overlay
ifdef OPTR_SPEC_SEG_DEF
  ifneq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
    OPTR := $(word 1,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SPEC := $(word 2,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SEG  := $(word 3,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/operator/$(OPTR)/$(SPEC)/$(SEG)
  endif
endif
ifneq (yes,$(strip $(MTK_TABLET_PLATFORM)))
  ifeq (480,$(strip $(LCM_WIDTH)))
    ifeq (854,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/FWVGA
    endif
  endif
  ifeq (540,$(strip $(LCM_WIDTH)))
    ifeq (960,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/qHD
    endif
  endif
endif
ifeq (yes,$(strip $(MTK_GMO_ROM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_rom
endif
ifeq (yes,$(strip $(MTK_GMO_RAM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_ram
endif
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/navbar

ifeq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
    PRODUCT_PACKAGES += DangerDash
endif

# inherit 6752 platform
$(call inherit-product, device/mediatek/mt6735/device.mk)

$(call inherit-product-if-exists, vendor/DOOGEE/libs/$(MTK_TARGET_PROJECT)/device-vendor.mk)

# setup dm-verity configs.
#PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/system
#$(call inherit-product, build/target/product/verity.mk)

include vendor/DOOGEE/prebuilds.mk
