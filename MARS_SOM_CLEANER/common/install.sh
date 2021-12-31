image_view mars.png

ui_print " "
ui_print " "
ui_print " "
ui_print "   DO YOU WANT TO OPTIMIZE ALL YOUR APPS?"
ui_print "   WITH ~80 APPS IT WILL TAKE UP TO 10-15 MINUTES"
ui_print " "
ui_print "→ Vol+ (Up) = Yes, Vol- (Down) = No"
ui_print " "
if $VKSEL; then
      echo "Yes"
ui_print " - APP OPTIMIZATION..."
ui_print " -- PLEASE BE PATIENT..."
ui_print " --- THIS PROCESS CAN TAKE UP SOME TIME..."
ui_print " "
su -c cmd package bg-dexopt-job
ui_print " "
ui_print " FINISHED THE OPTIMIZATION"
ui_print " "
    else
      echo "No"
  ui_print "- Skipping this One..."
fi

ui_print "- ZIPALIGN APPS"
do_zipalign() {
  cp "$MODPATH/zipalign" /data/local/tmp >&2
chmod 775 /data/local/zipalign
for apk in "$MODPATH" 'system_ext/priv-app/*/*.apk' "$MODPATH" 'system/app/*/*.apk' "$MODPATH" 'system/priv-app/*/*.apk' "$MODPATH" 'system/product/priv-app/*/*.apk' "$MODPATH" 'system/product/app/*/*.apk'; do
   $zipalign -c -v 4 "$apk" 1>&2;
done;
}

zipalign

cleanup() {
ui_print "- CLEANUP"
rm -rf $MODPATH/system/product/app/Music2
rm -rf $MODPATH/system/product/app/Stk
rm -rf $MODPATH/system/app/Stk
rm -rf $MODPATH/system/product/priv-app/StorageManager
rm -rf /cache/*
rm -rf /data/cache/*
rm -rf /data/dalvik-cache/*
}

cleanup

