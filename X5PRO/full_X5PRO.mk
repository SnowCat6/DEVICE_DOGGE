# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

ifeq (5.1, $(PLATFORM_VERSION))
THIS_ANDROID_VERSION :=5x
endif
ifeq (6.0, $(PLATFORM_VERSION))
THIS_ANDROID_VERSION :=6x
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

ifeq ($(TARGET_BUILD_VARIANT), eng)
KERNEL_DEBUG := _debug
endif

KERNEL_DEFCONFIG ?= X5PRO_6735m$(KERNEL_DEBUG)_defconfig

ifeq (5x, $(THIS_ANDROID_VERSION))
LINUX_KERNEL_VERSION = kernel-3.10
endif
ifeq (6x, $(THIS_ANDROID_VERSION))
LINUX_KERNEL_VERSION = kernel-3.18
endif

# overlay has priorities. high <-> low.
DEVICE_PACKAGE_OVERLAYS += device/DOOGEE/$(MTK_BASE_PROJECT)/overlay
DEVICE_PACKAGE_OVERLAYS += device/DOOGEE/$(MTK_TARGET_PROJECT)/overlay

