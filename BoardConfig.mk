# inherit from the proprietary version
-include vendor/samsung/aalto/BoardConfigVendor.mk

# Board properties
TARGET_BOARD_PLATFORM := omap3
TARGET_BOOTLOADER_BOARD_NAME := aalto
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIANT_FPU := neon
TARGET_CPU_VARIANT := cortex-a8

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_arm_CFLAGS := -O3 -fomit-frame-pointer -fstrict-aliasing -funswitch-loops \
                       -fmodulo-sched -fmodulo-sched-allow-regmoves
TARGET_thumb_CFLAGS := -mthumb \
                        -Os \
                        -fomit-frame-pointer \
                        -fstrict-aliasing

COMMON_GLOBAL_CFLAGS += -DOMAP_COMPAT -DOMAP_ENHANCEMENT -DTARGET_OMAP3

TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_PROVIDES_INIT_TARGET_RC := true

BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x81800000
BOARD_PAGE_SIZE := 4096
RAMDISK_OFFSET := 0x82800000

BOARD_CUSTOM_BOOTIMG_MK := device/samsung/aalto/mkbootimg.mk

# Prebuilt kernel (2.6.35.7)
TARGET_PREBUILT_KERNEL := device/samsung/aalto/kernel

# recovery
BOARD_HAS_NO_SELECT_BUTTON := true
# BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/aalto/recovery/recovery_keys.c
# BOARD_USES_BML_OVER_MTD := true
TARGET_RECOVERY_FSTAB := device/samsung/aalto/fstab.aalto
RECOVERY_FSTAB_VERSION := 2

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 528424960
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2113748992
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0/file"

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/aalto

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/aalto/bluetooth

# Egl
BOARD_EGL_CFG := device/samsung/aalto/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_DISABLE_TRIPLE_BUFFERING := false
COMMON_GLOBAL_CFLAGS += -DHAS_CONTEXT_PRIORITY
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true


# OMX Stuff
HARDWARE_OMX := true
TARGET_USE_OMX_RECOVERY := false
TARGET_USE_OMAP_COMPAT := true
BUILD_WITH_TI_AUDIO := 1
BUILD_PV_VIDEO_ENCODERS := 1

ifdef HARDWARE_OMX
OMX_JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
   hardware/ti/omx/system/src/openmax_il/omx_core/inc \
   hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
endif

# Touchscreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_AUDIO_LEGACY := false

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := si4709

# Camera
BOARD_CAMERA_LIBRARIES := libcamera

USES_TI_WL1271 := true
ifdef USES_TI_WL1271
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
WPA_SUPPLICANT_VERSION := VER_0_6_X
BOARD_WIFI_SKIP_CAPABILITIES := true
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
#BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WLAN_DEVICE := wl1271
BOARD_SOFTAP_DEVICE := wl1271
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME := "tiwlan_drv"
WIFI_FIRMWARE_LOADER := "wlan_loader"
COMMON_GLOBAL_CFLAGS += -DUSES_TI_WL1271
USES_TI_MAC80211 := true

AP_CONFIG_DRIVER_WILINK := true
BOARD_SOFTAP_DEVICE := wl1271
USES_TI_MAC80211 := true
WIFI_AP_DRIVER_MODULE_PATH := "/system/lib/modules/tiap_drv.ko"
WIFI_AP_DRIVER_MODULE_NAME := tiap_drv
WIFI_AP_FIRMWARE_LOADER := wlan_ap_loader
WIFI_AP_DRIVER_MODULE_ARG := ""
endif

TARGET_OTA_ASSERT_DEVICE := YP-GS1
