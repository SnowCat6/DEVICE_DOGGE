# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Set target and base project for flavor build
MTK_TARGET_PROJECT := $(subst full_,,$(TARGET_PRODUCT))
#MTK_BASE_PROJECT := $(MTK_TARGET_PROJECT)
MTK_BASE_PROJECT := X5PRO
MTK_PROJECT_FOLDER := $(LOCAL_PATH)
MTK_TARGET_PROJECT_FOLDER := $(LOCAL_PATH)

# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(LOCAL_PATH)/device.mk)

include $(LOCAL_PATH)/ProjectConfig.mk
# set locales & aapt config.
PRODUCT_LOCALES := en_US zh_CN zh_TW es_ES pt_BR ru_RU fr_FR de_DE tr_TR vi_VN ms_MY in_ID th_TH it_IT ar_EG hi_IN bn_IN ur_PK fa_IR pt_PT nl_NL el_GR hu_HU tl_PH ro_RO cs_CZ ko_KR km_KH iw_IL my_MM pl_PL es_US bg_BG hr_HR lv_LV lt_LT sk_SK uk_UA de_AT da_DK fi_FI nb_NO sv_SE en_GB hy_AM zh_HK et_EE ja_JP kk_KZ sr_RS sl_SI ca_ES

# Set those variables here to overwrite the inherited values.
#PRODUCT_NAME := full_X5PRO
#PRODUCT_DEVICE := X5PRO
#PRODUCT_MODEL := X5pro
TARGET_DEVICE := hct6735m_35gu_m0
PRODUCT_POLICY := android.policy_phone
PRODUCT_BRAND := DOOGEE
PRODUCT_MANUFACTURER := DOOGEE
BUILD_FINGERPRINT := DOOGEE/full_hct6735m_35gu_m0/hct6735m_35gu_m0:6.0/MRA58K/1479782221:user/test-keys
PRIVATE_BUILD_DESC := "full_hct6735m_35gu_m0-user" "6.0" "MRA58K" "1479782221" "test-keys"
TARGET_OTA_ASSERT_DEVICE := X5pro
PRODUCT_DEFAULT_LOCALE := ru_RU

ifeq ($(TARGET_BUILD_VARIANT), eng)
KERNEL_DEFCONFIG ?= X5PRO_6735m_defconfig
else
KERNEL_DEFCONFIG ?= X5PRO_6735m_defconfig
endif
#PRELOADER_TARGET_PRODUCT ?= X5PRO
#LK_PROJECT ?= X5PRO
#TRUSTY_PROJECT ?= X5PRO
#A-GO
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackageGo.mk)

include $(LOCAL_PATH)/twrp.mk

