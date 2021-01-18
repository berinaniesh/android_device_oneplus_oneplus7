# Copyright (C) 2021 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# APEX
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti.recovery

# Factory Reset Protection
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/config

PRODUCT_PACKAGES += \
    ueventd.oneplus.rc

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# FOD
PRODUCT_COPY_FILES += \
    vendor/pa/config/permissions/vendor.aospa.biometrics.fingerprint.inscreen.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/vendor.aospa.biometrics.fingerprint.inscreen.xml

PRODUCT_PACKAGES += \
    vendor.aospa.biometrics.fingerprint.inscreen@1.0-service \
    vendor.oneplus.fingerprint.extension@1.0 \
    vendor.oneplus.hardware.display@1.0

# Fstab
PRODUCT_PACKAGES += \
    fstab.qcom

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Init
PRODUCT_PACKAGES += \
    init.oneplus.haptics.rc

# Kernel
KERNEL_SD_LLVM_SUPPORT := true
TARGET_KERNEL_VERSION := 4.14

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0:64 \
    android.hardware.nfc@1.1:64 \
    android.hardware.nfc@1.2:64 \
    android.hardware.secure_element@1.0:64 \
    com.android.nfc_extras \
    Tag \
    vendor.nxp.nxpese@1.0:64 \
    vendor.nxp.nxpnfc@1.0:64

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/oneplus/oneplus7t \
    device/oneplus/common

# OnePlus
PRODUCT_PACKAGES += \
    oneplus-fwk.oneplus7t

PRODUCT_BOOT_JARS += \
    oneplus-fwk.oneplus7t

# Overlays
PRODUCT_PACKAGES += \
    AOSPAOnePlus7TFrameworks \
    AOSPAOnePlus7TSystemUI \
    NoInjection \
    OnePlus7TFrameworks \
    OnePlus7TSystemUI

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Platform
TARGET_BOARD_PLATFORM := msmnile

# QTI
TARGET_COMMON_QTI_COMPONENTS := \
    audio \
    av \
    bt \
    display \
    gps \
    init \
    media \
    overlay \
    perf \
    usb \
    vibrator \
    wfd \
    wlan

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

# Telephony
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    android.hardware.radio@1.4 \
    android.hardware.radio.config@1.2 \
    android.hardware.radio.deprecated@1.0 \
    libjson

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.dpm.feature=11

# Alert Slider
PRODUCT_PACKAGES += \
    TriStateHandler \
    tri-state-key_daemon

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Vendor
$(call inherit-product, vendor/oneplus/oneplus7t/oneplus7t-vendor.mk)
