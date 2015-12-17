package com.segment.cordova;

import android.util.Log;
import android.provider.Settings.Secure;

import org.apache.cordova.BuildConfig;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;

public class IdentifiersPlugin extends CordovaPlugin {
  public String advertisingIdentifier()
    {
        String android_id = Secure.getString(cordova.getActivity().getContentResolver(), Secure.ANDROID_ID);

        return android_id;
    }
}
