########################################################
# GAPPS apps
GAPPS_VARIANT := pico
PRODUCT_PACKAGES += \
                    GoogleTTS \
                    GoogleHome \
                    CalendarGooglePrebuilt \
                    LatinImeGoogle \
                    Chrome

ifneq ($(WITH_DEXPREOPT), yes)

#PRODUCT_PACKAGES += \
#                    YouTube
#                    Maps \
#                    PrebuiltGmail \
#                    Newsstand \
#                    Music2 \
#                    Drive \
#                    TranslatePrebuilt
endif

#                    PrebuiltDeskClockGoogle \
#                    WebViewGoogle \
#                    GoogleEarth \

$(call inherit-product-if-exists, vendor/google/build/opengapps-packages.mk)

#PRODUCT_PACKAGES += \
#        Superuser
#	busybox
#	su \

REMOVE_APP := \
	QuickSearchBox \
	PicoTts \
	Browser \
	LatinIME \
	Email \
	Calendar \
	MtkQuickSearchBox \
	MtkCalendar \
	MtkBrowser \
        SetupWizard \

#	DeskClock \
#        webview \

# NOT WORK YET
PRODUCT_PACKAGES := $(filter-out $(REMOVE_APP),$(PRODUCT_PACKAGES))

