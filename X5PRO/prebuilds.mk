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

#PRODUCT_PACKAGES += 

#                    GoogleEarth \

$(call inherit-product-if-exists, vendor/google/build/opengapps-packages.mk)


REMOVE_APP = QuickSearchBox \
	PicoTts \
	DeskClock \
	Browser

PRODUCT_PACKAGES := $(filter-out $(REMOVE_APP),$(PRODUCT_PACKAGES))
