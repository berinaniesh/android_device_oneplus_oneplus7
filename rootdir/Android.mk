LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := ueventd.oneplus.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := ueventd.oneplus.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
LOCAL_MODULE_STEM  := ueventd.rc
include $(BUILD_PREBUILT)
