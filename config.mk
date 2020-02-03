ifeq ($(TARGET_GAPPS_ARCH),)
$(error "GAPPS: TARGET_GAPPS_ARCH is undefined")
endif

ifneq ($(TARGET_GAPPS_ARCH),arm)
ifneq ($(TARGET_GAPPS_ARCH),arm64)
$(error "GAPPS: Only arm and arm64 are allowed")
endif
endif

$(call inherit-product, vendor/gapps/common-blobs.mk)

# Include package overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/gapps/overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/gapps/overlay/common/

# framework
PRODUCT_PACKAGES += \
    com.google.android.maps

ifeq ($(IS_PHONE),true)
PRODUCT_PACKAGES += \
    com.google.android.dialer.support
endif

# app
ifeq ($(IS_PHONE),true)
PRODUCT_PACKAGES += \
    PrebuiltBugle
endif

ifeq ($(TARGET_INCLUDE_STOCK_ARCORE),true)
PRODUCT_PACKAGES += \
    arcore
endif

# System app
PRODUCT_PACKAGES += \
    GoogleExtShared \
    GooglePrintRecommendationService

# System priv-app
PRODUCT_PACKAGES += \
    GoogleDocumentsUIPrebuilt \
    GoogleExtServicesPrebuilt \
    GooglePermissionControllerPrebuilt

# Product app
PRODUCT_PACKAGES += \
    CalculatorGooglePrebuilt \
    CalendarGooglePrebuilt \
    Chrome \
    Gmail \
    GoogleContacts \
    GoogleContactsSyncAdapter \
    GoogleTTS \
    LatinIMEGooglePrebuilt \
    LocationHistoryPrebuilt \
    MarkupGoogle \
    Photos \
    PrebuiltDeskClockGoogle \
    SoundPickerPrebuilt \
    talkback \
    WebViewGoogle

# Product priv-app
PRODUCT_PACKAGES += \
    AndroidMigratePrebuilt \
    CarrierServices \
    ConfigUpdater \
    ConnMetrics \
    GoogleDialer \
    GoogleFeedback \
    GoogleOneTimeInitializer \
    GooglePartnerSetup \
    GoogleServicesFramework \
    Phonesky \
    PixelSetupWizard \
    PrebuiltGmsCoreQt \
    SetupWizardPrebuilt \
    TipsPrebuilt \
    TurboPrebuilt \
    Velvet \
    WallpaperPickerGoogleRelease \
    WellbeingPrebuilt

ifeq ($(IS_PHONE),true)
PRODUCT_PACKAGES += \
    GoogleDialer
endif

# Recorder
ifneq ($(TARGET_SUPPORTS_GOOGLE_RECORDER), false)
PRODUCT_PACKAGES += \
    NgaResources \
    RecorderPrebuilt
endif
