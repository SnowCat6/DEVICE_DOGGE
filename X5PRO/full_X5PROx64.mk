# Inherit for devices that support 64-bit primary and 32-bit secondary zygote startup script
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

include $(LOCAL_PATH)/full_X5PRO.mk

ifeq ($(TARGET_BUILD_VARIANT), eng)
KERNEL_DEFCONFIG ?= X5PRO_6735m_65u_i_m_debug_defconfig
else
KERNEL_DEFCONFIG ?= X5PRO_6735m_65u_i_m_defconfig
endif

