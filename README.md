# Cordova Plugin - Identifiers

## Description
This plugin is used to get native device identifiers.

### iOS
`idfa` - [Reference](https://developer.apple.com/library/ios/documentation/AdSupport/Reference/ASIdentifierManager_Ref/#//apple_ref/occ/instp/ASIdentifierManager/advertisingIdentifier)

`idfv` - [Reference](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDevice_Class/index.html#//apple_ref/occ/instp/UIDevice/identifierForVendor)

### Android
`ad_id` - [Reference](https://support.google.com/googleplay/android-developer/answer/6048248?hl=en)

`android_id` - [Reference](http://developer.android.com/reference/android/provider/Settings.Secure.html#ANDROID_ID)

## How it works
After installation, plugin adds `window.identifiers` object, that has a function `getDeviceValues`, which returns a hash of values.

Example:
```
window.identifiers.getDeviceValues(function(values) {
  console.log(values);
});
```

This code would print into console an object containing `idfa` and `idfv` values for iOS device or `ad_id` and `android_id` for Android device.
