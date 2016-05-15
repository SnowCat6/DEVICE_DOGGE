########################################################
# GAPPS apps
GAPPS_VARIANT := pico
GAPPS_FORCE_PACKAGE_OVERRIDES := true
#GAPPS_FORCE_MATCHING_DPI := true
#DONT_DEXPREOPT_PREBUILTS := true

PRODUCT_PACKAGES += \
                    GoogleTTS \
                    GoogleHome \
                    CalendarGooglePrebuilt \
                    LatinImeGoogle \
                    Chrome \
                    Music2 \
                    Velvet

ifneq ($(WITH_DEXPREOPT), yes)

#PRODUCT_PACKAGES += \
#                    Music2 \
#                    YouTube
#                    Maps \
#                    PrebuiltGmail \
#                    Newsstand \
#                    Drive \
#                    TranslatePrebuilt
endif

PRODUCT_PACKAGES += \
	busybox

#	QuickSearchBox \
#	PicoTts \
#	Browser \
#	LatinIME \
#	Email \
#	Calendar \
#	MtkQuickSearchBox \
#	MtkCalendar \
#	MtkBrowser \
#       SetupWizard \
#       webview \
#	music

$(call inherit-product-if-exists, vendor/google/build/opengapps-packages.mk)

