LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

support_library_root_dir := frameworks/support
# Defining src and res dir
LOCAL_SRC_FILES := $(call all-java-files-under, app/src/main/java)
LOCAL_RESOURCE_DIR := $(addprefix $(LOCAL_PATH)/, app/src/main/res) \
    $(support_library_root_dir)/v7/appcompat/res

# Defining Manifest file
LOCAL_MANIFEST_FILE := app/src/main/AndroidManifest.xml

# AAPT FLAGS
# auto add overlay=overwrite repeating res
LOCAL_AAPT_FLAGS += \
    --auto-add-overlay \
    --extra-packages android.support.v7.appcompat \
    --extra-packages android.support.constraint

# we need v7/v4 libs
LOCAL_STATIC_JAVA_LIBRARIES := android-support-v7-appcompat android-support-v4

# jar libs
LOCAL_STATIC_JAVA_LIBRARIES += constraint-layout-solver

# aar libs
LOCAL_STATIC_JAVA_AAR_LIBRARIES := constraint-layout

# App Name
LOCAL_PACKAGE_NAME := Test

# build the app
include $(BUILD_PACKAGE)

include $(CLEAR_VARS)

# define build jar dep
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := constraint-layout-solver:app/src/main/libs/constraint-layout-solver-1.0.2.jar
# define build aar dep
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES += constraint-layout:app/src/main/libs/constraint-layout-1.0.2.aar

include $(BUILD_MULTI_PREBUILT)

include $(call all-makefiles-under,$(LOCAL_PATH))
