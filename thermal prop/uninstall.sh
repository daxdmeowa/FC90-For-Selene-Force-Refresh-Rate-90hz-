#!/system/bin/sh

settings delete system peak_refresh_rate
settings delete system min_refresh_rate
settings delete system user_refresh_rate
settings delete global peak_refresh_rate
settings delete global min_refresh_rate
settings delete secure miui_refresh_rate

pm enable com.miui.powerkeeper
pm enable com.miui.daemon

start thermal-engine 2>/dev/null
start mi_thermald 2>/dev/null