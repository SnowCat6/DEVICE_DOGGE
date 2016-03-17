########################################################
# GAPPS apps
GAPPS_VARIANT := pico
PRODUCT_PACKAGES += \
                    PrebuiltGmail \
                    GoogleTTS \
                    GoogleHome \
                    PrebuiltDeskClockGoogle \
                    CalendarGooglePrebuilt \
                    LatinImeGoogle \
                    Chrome \
                    Music2 \
                    Music2 \
                    Newsstand \
                    YouTube

PRODUCT_PACKAGES += \
                    Maps \
                    Drive \
                    TranslatePrebuilt

#                    WebViewGoogle \
#                    GoogleEarth \

$(call inherit-product-if-exists, vendor/google/build/opengapps-packages.mk)

# SUPERUSER
#PRODUCT_PACKAGES += \
#	su \
#	busybox

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

#        webview \

# NOT TESTED YET
PRODUCT_PACKAGES := $(filter-out $(REMOVE_APP),$(PRODUCT_PACKAGES))

