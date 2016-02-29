
include $(LOCAL_PATH)/full_X5PRO.mk

ifeq ($(TARGET_BUILD_VARIANT), eng)
KERNEL_DEFCONFIG ?= X5PRO_6735m_35u_i_m_debug_defconfig
else
KERNEL_DEFCONFIG ?= X5PRO_6735m_35u_i_m_defconfig
endif

