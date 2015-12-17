package com.segment.cordova;

import android.util.Log;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.nfc.NfcAdapter;
import android.os.Build;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.provider.Settings.Secure;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class IdentifiersPlugin extends CordovaPlugin {
  public String advertisingIdentifier()
    {
        String android_id = Secure.getString(cordova.getActivity().getContentResolver(), Secure.ANDROID_ID);

        return android_id;
    }
}
