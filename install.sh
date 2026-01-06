#!/system/bin/sh

SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true

print_modname() {
ui_print " "
ui_print "██████╗  █████╗ ██╗  ██╗██████╗ "
ui_print "██╔══██╗██╔══██╗╚██╗██╔╝██╔══██╗"
ui_print "██║  ██║███████║ ╚███╔╝ ██║  ██║"
ui_print "██║  ██║██╔══██║ ██╔██╗ ██║  ██║"
ui_print "██████╔╝██║  ██║██╔╝ ██╗██████╔╝"
ui_print "╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ "
ui_print " "
ui_print "███╗   ███╗███████╗ ██████╗ ██╗    ██╗ █████╗ "
ui_print "████╗ ████║██╔════╝██╔═══██╗██║    ██║██╔══██╗"
ui_print "██╔████╔██║█████╗  ██║   ██║██║ █╗ ██║███████║"
ui_print "██║╚██╔╝██║██╔══╝  ██║   ██║██║███╗██║██╔══██║"
ui_print "██║ ╚═╝ ██║███████╗╚██████╔╝╚███╔███╔╝██║  ██║"
ui_print "╚═╝     ╚═╝╚══════╝ ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═╝"
ui_print " "
ui_print " ☠ FC90Meowa ☠ "
ui_print " Mode : Force 90hz "
ui_print " Build by : daxdMeowa "
ui_print " "
ui_print " License: Non-Commercial / All Rights Reserved "
ui_print " Use at your own risk "
}

loading() {
ui_print "- Flashing."
sleep 0.4
ui_print "- Flashing.."
sleep 0.4
ui_print "- Flashing..."
sleep 0.4
ui_print "- Injecting display service"
sleep 0.6
ui_print "- Killing thermal daemon"
sleep 0.6
}

on_install() {
ui_print ">> Initializing nightmare sequence"
sleep 1

loading
loading

ui_print ">> Extracting core files"
unzip -o "$ZIPFILE" 'system.prop' -d $MODPATH >&2
unzip -o "$ZIPFILE" 'service.sh' -d $MODPATH >&2
unzip -o "$ZIPFILE" 'post-fs-data.sh' -d $MODPATH >&2
unzip -o "$ZIPFILE" 'uninstall.sh' -d $MODPATH >&2

ui_print ">> Overriding MIUI rules"
sleep 1
ui_print ">> Thermal protection : DISABLED"
sleep 1
ui_print ">> 60Hz limiter : DESTROYED"
sleep 1
ui_print ">> 90Hz supremacy : ENABLED"

ui_print " "
ui_print " ☠ FLASH COMPLETE ☠ "
ui_print " Reboot Now!! "
ui_print " @daxd11 "
}

set_permissions() {
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755
set_perm $MODPATH/post-fs-data.sh 0 0 0755
set_perm $MODPATH/uninstall.sh 0 0 0755
}