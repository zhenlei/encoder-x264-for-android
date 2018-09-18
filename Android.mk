
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
  vendor/pinecone/hardware/graphic/libsoft/lib32 \
  system/core/include \
  system/core/libion/include

LOCAL_MULTILIB := 32

LOCAL_LDFLAGS := \
  -L$(LOCAL_PATH)/../../libsoft/lib32/ \
  -l:libx264.a

LOCAL_CFLAGS := $(PV_CFLAGS_MINUS_VISIBILITY) \
  -DMALI_ION=1 \
  -DBUILD_FOR_ANDROID=1 \
  -DCONFIG_CHECKSUM_BUFFERS=1

LOCAL_SHARED_LIBRARIES := libcutils liblog libhardware libsync libion

LOCAL_MODULE    := soft_encoder
LOCAL_SRC_FILES := simple_encoder.c

LOCAL_LDLIBS    := -llog

include $(BUILD_EXECUTABLE)
