#!/system/bin/sh

settings put system peak_refresh_rate 90
settings put system min_refresh_rate 90
settings put system user_refresh_rate 90
settings put global peak_refresh_rate 90
settings put global min_refresh_rate 90
settings put secure miui_refresh_rate 90

settings put global low_power 0
settings put global smart_refresh_rate 0
settings put global dynamic_refresh_rate 0

pm disable-user --user 0 com.miui.powerkeeper
pm disable-user --user 0 com.miui.daemon

stop thermal-engine 2>/dev/null
stop mi_thermald 2>/dev/null
stop vendor.thermal-engine 2>/dev/null