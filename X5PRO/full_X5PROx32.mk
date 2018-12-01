# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_NAME := full_X5PROx32
PRODUCT_DEVICE := X5PROx32
PRODUCT_MODEL := X5PROx32

include device/DOOGEE/X5PRO/full_X5PRO.mk

