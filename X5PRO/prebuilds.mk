########################################################
# GAPPS apps
GAPPS_VARIANT := pico
PRODUCT_PACKAGES += \
                    GoogleTTS \
                    GoogleHome \
                    PrebuiltDeskClockGoogle \
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

#                    WebViewGoogle \
#                    GoogleEarth \

$(call inherit-product-if-exists, vendor/google/build/opengapps-packages.mk)

#PRODUCT_PACKAGES += \
#	busybox
#	su \

REMOVE_APP = \
	QuickSearchBox \
	PicoTts \
	DeskClock \
	Browser \
	LatinIME \
	Email \
	Calendar \
	DeskClock \
	MtkQuickSearchBox \
	MtkCalendar \
	MtkBrowser \
        SetupWizard \

#        webview \

# NOT WORK YET
PRODUCT_PACKAGES := $(filter-out $(REMOVE_APP),$(PRODUCT_PACKAGES))

