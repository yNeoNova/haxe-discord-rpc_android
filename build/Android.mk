LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := discord_rpc
LOCAL_SRC_FILES := ../jni/discord_rpc.cpp ../jni/discord_register.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../include

LOCAL_LDLIBS := -llog

include $(BUILD_SHARED_LIBRARY)
