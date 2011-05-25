# Generic cyanogenmod product
PRODUCT_NAME := cyanogen
PRODUCT_BRAND := cyanogen
PRODUCT_DEVICE := generic

PRODUCT_PACKAGES += ADWLauncher

ifdef CYANOGEN_NIGHTLY
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=cyanogenmodnightly
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=madcrow
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# CyanogenMod specific product packages
PRODUCT_PACKAGES += \
    AndroidTerm \
    FileManager \
    CMParts \
    CMStats \
    CMUpdateNotify \
    DSPManager \
    libcyanogen-dsp \
    Pacman

# Extra tools in CyanogenMod
PRODUCT_PACKAGES += \
    openvpn

# Common CM overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/common

# T-Mobile theme engine
include vendor/cyanogen/products/themes_common.mk

PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/cyanogen/prebuilt/common/bin/modelid_cfg.sh:system/bin/modelid_cfg.sh \
    vendor/cyanogen/prebuilt/common/bin/verify_cache_partition_size.sh:system/bin/verify_cache_partition_size.sh \
    vendor/cyanogen/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/cyanogen/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/cyanogen/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/cyanogen/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/cyanogen/prebuilt/common/etc/profile:system/etc/profile \
    vendor/cyanogen/prebuilt/common/etc/init.d/06mountdl:system/etc/init.d/06mountdl \
    vendor/cyanogen/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/cyanogen/prebuilt/common/bin/sysinit:system/bin/sysinit

PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Always run in insecure mode, enables root on user build variants
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

PRODUCT_COPY_FILES += \
    vendor/cyanogen/google/system/app/FOTAKill.apk:system/app/FOTAKill.apk \
    vendor/cyanogen/google/system/app/GenieWidget.apk:system/app/GenieWidget.apk \
    vendor/cyanogen/google/system/app/Gmail.apk:system/app/Gmail.apk \
    vendor/cyanogen/google/system/app/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
    vendor/cyanogen/google/system/app/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
    vendor/cyanogen/google/system/app/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
    vendor/cyanogen/google/system/app/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
    vendor/cyanogen/google/system/app/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
    vendor/cyanogen/google/system/app/GoogleQuickSearchBox.apk:system/app/GoogleQuickSearchBox.apk \
    vendor/cyanogen/google/system/app/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
    vendor/cyanogen/google/system/app/LatinImeTutorial.apk:system/app/LatinImeTutorial.apk \
    vendor/cyanogen/google/system/app/MarketUpdater.apk:system/app/MarketUpdater.apk \
    vendor/cyanogen/google/system/app/MediaUploader.apk:system/app/MediaUploader.apk \
    vendor/cyanogen/google/system/app/NetworkLocation.apk:system/app/NetworkLocation.apk \
    vendor/cyanogen/google/system/app/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
    vendor/cyanogen/google/system/app/SetupWizard.apk:system/app/SetupWizard.apk \
    vendor/cyanogen/google/system/app/Talk.apk:system/app/Talk.apk \
    vendor/cyanogen/google/system/app/Vending.apk:system/app/Vending.apk \
    vendor/cyanogen/google/system/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    vendor/cyanogen/google/system/etc/permissions/features.xml:system/etc/permissions/features.xml \
    vendor/cyanogen/google/system/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar

ifdef CYANOGEN_WITH_GOOGLE
    PRODUCT_COPY_FILES += \
        vendor/cyanogen/proprietary/CarHomeGoogle.apk:./system/app/CarHomeGoogle.apk \
        vendor/cyanogen/proprietary/CarHomeLauncher.apk:./system/app/CarHomeLauncher.apk \
        vendor/cyanogen/proprietary/Facebook.apk:./system/app/Facebook.apk \
        vendor/cyanogen/proprietary/GenieWidget.apk:./system/app/GenieWidget.apk \
        vendor/cyanogen/proprietary/Gmail.apk:./system/app/Gmail.apk \
        vendor/cyanogen/proprietary/GoogleBackupTransport.apk:./system/app/GoogleBackupTransport.apk \
        vendor/cyanogen/proprietary/GoogleCalendarSyncAdapter.apk:./system/app/GoogleCalendarSyncAdapter.apk \
        vendor/cyanogen/proprietary/GoogleContactsSyncAdapter.apk:./system/app/GoogleContactsSyncAdapter.apk \
        vendor/cyanogen/proprietary/GoogleFeedback.apk:./system/app/GoogleFeedback.apk \
        vendor/cyanogen/proprietary/GooglePartnerSetup.apk:./system/app/GooglePartnerSetup.apk \
        vendor/cyanogen/proprietary/GoogleQuickSearchBox.apk:./system/app/GoogleQuickSearchBox.apk \
        vendor/cyanogen/proprietary/GoogleServicesFramework.apk:./system/app/GoogleServicesFramework.apk \
        vendor/cyanogen/proprietary/HtcCopyright.apk:./system/app/HtcCopyright.apk \
        vendor/cyanogen/proprietary/HtcEmailPolicy.apk:./system/app/HtcEmailPolicy.apk \
        vendor/cyanogen/proprietary/HtcSettings.apk:./system/app/HtcSettings.apk \
        vendor/cyanogen/proprietary/LatinImeTutorial.apk:./system/app/LatinImeTutorial.apk \
        vendor/cyanogen/proprietary/Maps.apk:./system/app/Maps.apk \
        vendor/cyanogen/proprietary/MarketUpdater.apk:./system/app/MarketUpdater.apk \
        vendor/cyanogen/proprietary/MediaUploader.apk:./system/app/MediaUploader.apk \
        vendor/cyanogen/proprietary/NetworkLocation.apk:./system/app/NetworkLocation.apk \
        vendor/cyanogen/proprietary/OneTimeInitializer.apk:./system/app/OneTimeInitializer.apk \
        vendor/cyanogen/proprietary/PassionQuickOffice.apk:./system/app/PassionQuickOffice.apk \
        vendor/cyanogen/proprietary/SetupWizard.apk:./system/app/SetupWizard.apk \
        vendor/cyanogen/proprietary/Street.apk:./system/app/Street.apk \
        vendor/cyanogen/proprietary/Talk.apk:./system/app/Talk.apk \
        vendor/cyanogen/proprietary/Twitter.apk:./system/app/Twitter.apk \
        vendor/cyanogen/proprietary/Vending.apk:./system/app/Vending.apk \
        vendor/cyanogen/proprietary/VoiceSearch.apk:./system/app/VoiceSearch.apk \
        vendor/cyanogen/proprietary/YouTube.apk:./system/app/YouTube.apk \
        vendor/cyanogen/proprietary/googlevoice.apk:./system/app/googlevoice.apk \
        vendor/cyanogen/proprietary/kickback.apk:./system/app/kickback.apk \
        vendor/cyanogen/proprietary/soundback.apk:./system/app/soundback.apk \
        vendor/cyanogen/proprietary/talkback.apk:./system/app/talkback.apk \
        vendor/cyanogen/proprietary/com.google.android.maps.xml:./system/etc/permissions/com.google.android.maps.xml \
        vendor/cyanogen/proprietary/features.xml:./system/etc/permissions/features.xml \
        vendor/cyanogen/proprietary/com.google.android.maps.jar:./system/framework/com.google.android.maps.jar \
        vendor/cyanogen/proprietary/libspeech.so:./system/lib/libspeech.so
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif
