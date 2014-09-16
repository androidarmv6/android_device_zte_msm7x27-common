#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Overlay
DEVICE_PACKAGE_OVERLAYS := device/zte/msm7x27-common/overlay

# Inherit qcom common
$(call inherit-product, device/qcom/msm7x27/msm7x27.mk)

# GPS
PRODUCT_PACKAGES += \
    librpc 

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27

# Misc 
PRODUCT_PACKAGES += \
    lights.msm7x27 \
    sensors.msm7x27 \
    power.msm7x27 \
    hwcomposer.msm7x27

# FM Radio
# PRODUCT_PACKAGES += \
#    libfmradio.si4708 \
#    Effem

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm7x27 \
    audio_policy.msm7x27 \
    audio.usb.default

# Bluetooh
PRODUCT_PACKAGES += \
    brcm_patchram_plus

# FM Radio
# PRODUCT_COPY_FILES += \
#        frameworks/native/data/etc/com.stericsson.hardware.fm.receiver.xml:system/etc/permissions/com.stericsson.hardware.fm.receiver.xml

# Prebuilt
PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*,device/zte/skate/prebuilt/system,system)

# KSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ksm.default=1

# Development & ADB authentication settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=0

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.checkjni=0 \
    dalvik.vm.debug.alloc=0 \
    dalvik.vm.dexopt-data-only=1

# Disable strict mode
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

# Inherit hdpi 512
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi