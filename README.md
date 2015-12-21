# Cordova Plugin - Identifiers

## Description
This plugin is used to get native device identifiers.

### iOS
`idfa`
`idfv`

### Android
`ad_id`
`android_id`

## How it works
After installation, plugin adds `window.identifiers` object, which has a function `getDeviceValues`, which returns a hash of values.

Example:
```
window.identifiers.getDeviceValues(function(values) {
  console.log(values);
});
```

This code would print into console an object containing `idfa` and `idfv` values for iOS device or `ad_id` and `android_id` for Android device.
