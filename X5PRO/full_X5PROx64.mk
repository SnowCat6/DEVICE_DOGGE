# Inherit for devices that support 64-bit primary and 32-bit secondary zygote startup script
MTK_K64_SUPPORT := yes
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_NAME := full_X5PROx64
PRODUCT_DEVICE := X5PROx64
PRODUCT_MODEL := X5PROx64

include device/DOOGEE/X5PRO/full_X5PRO.mk

