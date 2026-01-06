#!/system/bin/sh

sleep 15

while true
do
    SCREEN=$(dumpsys power | grep "Display Power" | grep -o "ON\|OFF")

    if [ "$SCREEN" = "ON" ]; then
        settings put system peak_refresh_rate 90
        settings put system min_refresh_rate 90
        settings put system user_refresh_rate 90
        settings put global peak_refresh_rate 90
        settings put global min_refresh_rate 90
        settings put secure miui_refresh_rate 90

        killall surfaceflinger
        killall android.hardware.graphics.composer@2.4-service
        killall android.hardware.graphics.composer@2.3-service

        stop thermal-engine 2>/dev/null
        stop mi_thermald 2>/dev/null
    else
        settings put system peak_refresh_rate 60
        settings put system min_refresh_rate 60
        settings put system user_refresh_rate 60
    fi

    sleep 3
done