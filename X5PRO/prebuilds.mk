########################################################
# GAPPS apps
GAPPS_VARIANT := pico
PRODUCT_PACKAGES += PrebuiltGmail \
                    GoogleTTS \
                    Maps \
                    Drive \
                    TranslatePrebuilt \
                    GoogleHome \
                    PrebuiltDeskClockGoogle \
                    CalendarGooglePrebuilt \
                    LatinImeGoogle \
                    Chrome \
                    Music2 \
                    Music2 \
                    Newsstand \
                    YouTube

#                    WebViewGoogle \
#                    GoogleEarth \

$(call inherit-product-if-exists, vendor/google/build/opengapps-packages.mk)

# SUPERUSER
PRODUCT_PACKAGES += \
	su \
	busybox

REMOVE_APP = \
	QuickSearchBox \
	PicoTts \
	DeskClock \
	Browser \
	LatinIME \
	Email \
	Calendar \
	DeskClock

#        webview \

# NOT TESTED YET
PRODUCT_PACKAGES := $(filter-out $(REMOVE_APP),$(PRODUCT_PACKAGES))

