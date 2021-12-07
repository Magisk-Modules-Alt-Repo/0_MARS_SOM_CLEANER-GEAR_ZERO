image_view mars.png

ui_print " "
ui_print "__________________________________________________"
ui_print " "
ui_print "   Do You want to remove: Booking Dot Com?"
ui_print "   This will remove the App from the System..."
ui_print "__________________________________________________"
ui_print " "
ui_print "→ Vol+ (Up) = Yes, Vol- (Down) = No"
ui_print " "
if $VKSEL; then
      echo "true"
  ui_print "- Removing Booking Dot Com..."
  rm -rf $MODPATH/system/app/com.booking
    else
      echo "false"
  ui_print "- Skipping this One..."
fi
ui_print " "
ui_print "__________________________________________________"
ui_print " "
ui_print "   Do You want to remove: Epic Games?"
ui_print "   This will remove the App from the System..."
ui_print "__________________________________________________"
ui_print " "
ui_print "→ Vol+ (Up) = Yes, Vol- (Down) = No"
ui_print " "
if $VKSEL; then
      echo "true"
  ui_print "- Removing Epic Games..."
  rm -rf $MODPATH/system/app/com.epicgames.portal
    else
      echo "false"
  ui_print "- Skipping this One..."
fi
ui_print " "
ui_print "__________________________________________________"
ui_print " "
ui_print "   Do You want to remove: Asphalt 9?"
ui_print "   This will remove the App from the System..."
ui_print "__________________________________________________"
ui_print " "
ui_print "→ Vol+ (Up) = Yes, Vol- (Down) = No"
ui_print " "
if $VKSEL; then
      echo "true"
  ui_print "- Removing Asphalt 9..."
  rm -rf $MODPATH/system/app/com.gameloft.android.anmp.glofta9hm
    else
      echo "false"
  ui_print "- Skipping this One..."
fi
ui_print " "
ui_print "__________________________________________________"
ui_print " "
ui_print "   Do You want to remove: Facebook?"
ui_print "   This will remove the App from the System..."
ui_print "__________________________________________________"
ui_print " "
ui_print "→ Vol+ (Up) = Yes, Vol- (Down) = No"
ui_print " "
if $VKSEL; then
      echo "true"
  ui_print "- Removing Facebook..."
  rm -rf $MODPATH/system/app/com.facebook.appmanager
  rm -rf $MODPATH/system/app/com.facebook.katana
  rm -rf $MODPATH/system/priv-app/com.facebook.services
  rm -rf $MODPATH/system/priv-app/com.facebook.system
    else
      echo "false"
  ui_print "- Skipping this One..."
fi
ui_print " "
ui_print "__________________________________________________"
ui_print " "
ui_print "   Do You want to remove: Netflix?"
ui_print "   This will remove the App from the System..."
ui_print "__________________________________________________"
ui_print " "
ui_print "→ Vol+ (Up) = Yes, Vol- (Down) = No"
ui_print " "
if $VKSEL; then
      echo "true"
  ui_print "- Removing Netflix..."
  rm -rf $MODPATH/system/app/com.netflix.mediaclient
    else
      echo "false"
  ui_print "- Skipping this One..."
fi
ui_print " "
ui_print "__________________________________________________"
ui_print " "
ui_print "   Do You want to remove: Sonys Photo App?"
ui_print "   This will remove the App from the System..."
ui_print "__________________________________________________"
ui_print " "
ui_print "→ Vol+ (Up) = Yes, Vol- (Down) = No"
ui_print " "
if $VKSEL; then
      echo "true"
  ui_print "- Removing Sonys Photo App..."
  rm -rf $MODPATH/system/priv-app/SemcAlbum-albumLive-release
  rm -rf $MODPATH/system/priv-app/SemcPhotoEditor
    else
      echo "false"
  ui_print "- Skipping this One..."
fi
ui_print " "
ui_print "__________________________________________________"
ui_print " "
ui_print "   Do You want to remove: Sonys Music App?"
ui_print "   This will remove the App from the System..."
ui_print "__________________________________________________"
ui_print " "
ui_print "→ Vol+ (Up) = Yes, Vol- (Down) = No"
ui_print " "
if $VKSEL; then
      echo "true"
  ui_print "- Removing Sonys Music App..."
  rm -rf $MODPATH/system/priv-app/SemcMusic
    else
      echo "false"
  ui_print "- Skipping this One..."
fi
ui_print " "
ui_print "__________________________________________________"
ui_print " "
ui_print "   Do You want to remove: Sonys Support App?"
ui_print "   This will remove the App from the System..."
ui_print "__________________________________________________"
ui_print " "
ui_print "→ Vol+ (Up) = Yes, Vol- (Down) = No"
ui_print " "
if $VKSEL; then
      echo "true"
  ui_print "- Removing Sonys Support App..."
  rm -rf $MODPATH/system/app/com.sonymobile.support
    else
      echo "false"
  ui_print "- Skipping this One..."
fi
ui_print " "
ui_print " "
ui_print "_____________________________________________"
ui_print " "
ui_print "   DO YOU WANT TO OPTIMIZE ALL YOUR APPS?"
ui_print "   WITH ~80 APPS IT WILL TAKE UP TO 10-15 MINUTES"
ui_print " "
ui_print "→ Vol+ (Up) = Yes, Vol- (Down) = No"
ui_print " "
if $VKSEL; then
      echo "true"
ui_print " - APP OPTIMIZATION..."
ui_print " -- PLEASE BE PATIENT..."
ui_print " --- THIS PROCESS CAN TAKE UP SOME TIME..."
ui_print " "
su -c cmd package bg-dexopt-job
ui_print " "
ui_print " FINISHED THE OPTIMIZATION"
ui_print " "
    else
      echo "false"
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
rm -rf $MODPATH/system/priv-app/UpdateCenter-release
rm -rf $MODPATH/system/product/app/Stk
rm -rf $MODPATH/system/priv-app/SomcUiccDetection
rm -rf $MODPATH/system/app/SomcXperiaServices
rm -rf $MODPATH/system/app/Stk
rm -rf $MODPATH/system/product/priv-app/StorageManager
rm -rf $MODPATH/system/app/DaxUI
rm -rf $MODPATH/system/app/daxService
rm -rf /data/magisk_backup_*
rm -rf /data/resource-cache/*
rm -rf /data/system/package_cache/*
rm -rf /data/vendor/wlan_logs
rm -rf /cache/*
rm -rf /data/dalvik-cache/*
}

cleanup

