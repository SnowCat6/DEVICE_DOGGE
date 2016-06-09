# Inherit for devices that support 64-bit primary and 32-bit secondary zygote startup script
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

MTK_K64_SUPPORT = yes
include $(LOCAL_PATH)/full_X5PROx32.mk

