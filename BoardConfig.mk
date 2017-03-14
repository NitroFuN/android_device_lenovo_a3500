# inherit from the proprietary version
-include vendor/lenovo/a3500/BoardConfigVendor.mk


# Board
TARGET_BOARD_PLATFORM := mt6582
TARGET_NO_BOOTLOADER := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a7
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7
DEVICE_RESOLUTION := 800x1280
BOARD_HAS_NO_SELECT_BUTTON := true

# make_ext4fs requires numbers in dec format
BOARD_BOOTIMAGE_PARTITION_SIZE := 6291456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 545259520
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 512

BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_BOOTLOADER_BOARD_NAME := a3500

TARGET_USERIMAGES_USE_EXT4:=true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_MKBOOTIMG := $(HOST_OUT_EXECUTABLES)/mtkbootimg$(HOST_EXECUTABLE_SUFFIX)
BOARD_CUSTOM_BOOTIMG_MK := device/lenovo/a3500/bootimg.mk
BOARD_MKBOOTIMG_ARGS := --mtk 1

# Flags
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# blob hacks Flags
# COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
# COMMON_GLOBAL_CFLAGS += -DMR1_AUDIO_BLOB
# COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB
# COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

TARGET_KMODULES := true

TARGET_PREBUILT_KERNEL := device/lenovo/a3500/kernel

# Assert
TARGET_OTA_ASSERT_DEVICE := a3500,a3500,lenovo a3500


#RECOVERY_VARIANT := twrp
RECOVERY_VARIANT := philz
#RECOVERY_VARIANT := carliv

ifneq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := device/lenovo/a3500/recovery/recovery.fstab
endif


# CARLIV
ifeq ($(RECOVERY_VARIANT),carliv)
BOARD_USE_CUSTOM_RECOVERY_FONT := \"font_10x18.h\"
VIBRATOR_TIMEOUT_FILE := /sys/devices/virtual/timed_output/vibrator/enable
BOARD_HAS_MTK := true
BOARD_NEEDS_MTK_GETSIZE := true
DEVICE_RESOLUTION := 800x1280
endif


# PHILZ
ifeq ($(RECOVERY_VARIANT),philz)
TARGET_COMMON_NAME := lenovo a3500
BOARD_USE_MTK_LAYOUT := true
BOARD_MTK_BOOT_LABEL := "/bootimg"
BOARD_USE_NTFS_3G := false
BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/gadget/lun%d/file"
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
endif

# TWRP
ifeq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := device/lenovo/a3500/recovery/twrp.fstab
TW_NO_EXFAT := true
TWHAVE_SELINUX := true
TW_THEME := portrait_mdpi
TW_NO_EXFAT_FUSE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
#TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/gadget/lun%d/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/musb-hdrc.0/gadget/lun%d/file"
TW_EXCLUDE_SUPERSU := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
DEVICE_RESOLUTION := 800x1280
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
endif


# Deodex
WITH_DEXPREOPT := false
DISABLE_DEXPREOPT := true

#Camera
USE_CAMERA_STUB := true
BOARD_USE_JPEG := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lenovo/a3500/bluetooth

# MTK hacks for hw
# TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
# NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
# TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
# VSYNC_EVENT_PHASE_OFFSET_NS := -5000000
# SF_VSYNC_EVENT_PHASE_OFFSET_NS := -5000000
# PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0

# EGL settings
BOARD_EGL_CFG := device/lenovo/a3500/rootdir/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# blob hacks
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# power
TARGET_POWERHAL_VARIANT := cm

#TARGET_PROVIDES_GRALLOC := true
#TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
#TARGET_ELECTRONBEAM_FRAMES := 6

#Graphics
#BOARD_USES_SKIAHWJPEG := true

#FIMG Acceleration
#BOARD_USES_FIMGAPI := true

#HWComposer
#BOARD_USES_HWCOMPOSER := true
#BOARD_USE_SYSFS_VSYNC_NOTIFICATION := true

#Enable WEBGL in WebKit
#ENABLE_WEBGL := true

#JIT / Optimizations
#JS_ENGINE := v8

# SELINUX
BOARD_SEPOLICY_DIRS := \
       device/lenovo/a3500/sepolicy

BOARD_SEPOLICY_UNION := \
       device.te \
       app.te \
       system.te \
       file_contexts

# RIL
BOARD_RIL_CLASS := ../../../device/lenovo/a3500/ril/

# WIFI
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P
