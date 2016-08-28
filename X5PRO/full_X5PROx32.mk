# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Detect android compile version
ifneq (, $(filter 5.%, $(PLATFORM_VERSION)))
THIS_ANDROID_VERSION :=5x
THIS_BUILD_VERSION=R1.32
LINUX_KERNEL_VERSION = kernel-3.10
endif
ifneq (, $(filter 6.%, $(PLATFORM_VERSION)))
THIS_ANDROID_VERSION :=6x
THIS_BUILD_VERSION=R2.133
LINUX_KERNEL_VERSION = kernel-3.18
endif
ifneq (, $(filter 7.%, $(PLATFORM_VERSION)))
THIS_ANDROID_VERSION :=7x
THIS_BUILD_VERSION=N0-PRE.A
LINUX_KERNEL_VERSION = kernel-3.18
endif

ifeq (yes,$(MTK_K64_SUPPORT))
MTK_BUILD_VERNO = DOOGEE-X5pro-Android$(PLATFORM_VERSION)-$(THIS_BUILD_VERSION)x64
else
MTK_BUILD_VERNO = DOOGEE-X5pro-Android$(PLATFORM_VERSION)-$(THIS_BUILD_VERSION)x32
endif

# Set target and base project for flavor build
MTK_TARGET_PROJECT := $(subst full_,,$(TARGET_PRODUCT))
MTK_BASE_PROJECT := X5PRO
#$(MTK_TARGET_PROJECT)
MTK_PROJECT_FOLDER := $(shell find device/* -maxdepth 1 -name $(MTK_BASE_PROJECT))
MTK_TARGET_PROJECT_FOLDER := $(shell find device/* -maxdepth 1 -name $(MTK_TARGET_PROJECT))

# Common device
include device/DOOGEE/$(MTK_TARGET_PROJECT)/ProjectConfig.mk
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_MANUFACTURER := DOOGEE
PRODUCT_BRAND := SnowCatPDA
PRODUCT_NAME := $(TARGET_PRODUCT)
PRODUCT_DEVICE := X5PRO
PRODUCT_MODEL := X5PRO
PRODUCT_POLICY := android.policy_phone
PRODUCT_LOCALES := en_US zh_CN zh_TW es_ES pt_BR ru_RU fr_FR de_DE tr_TR vi_VN ms_MY in_ID th_TH it_IT ar_EG hi_IN bn_IN ur_PK fa_IR pt_PT nl_NL el_GR hu_HU tl_PH ro_RO cs_CZ ko_KR km_KH iw_IL my_MM pl_PL es_US bg_BG hr_HR lv_LV lt_LT sk_SK uk_UA de_AT da_DK fi_FI nb_NO sv_SE en_GB hy_AM zh_HK et_EE ja_JP kk_KZ sr_RS sl_SI ca_ES

#PRELOADER_TARGET_PRODUCT ?= X5PRO_6735m
#LK_PROJECT ?= X5PRO_6735m
#TRUSTY_PROJECT ?= X5PRO_6735m
KERNEL_DEFCONFIG ?= X5PRO_6735m_defconfig

# overlay has priorities. high <-> low.
DEVICE_PACKAGE_OVERLAYS += device/DOOGEE/$(MTK_BASE_PROJECT)/overlay
DEVICE_PACKAGE_OVERLAYS += device/DOOGEE/$(MTK_TARGET_PROJECT)/overlay

ifeq ($(MTK_GMO_ROM_OPTIMIZE),yes)
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_ram
endif

