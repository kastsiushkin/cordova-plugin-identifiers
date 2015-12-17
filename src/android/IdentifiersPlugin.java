package com.identifiers.cordova;

import java.util.TimeZone;

import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaInterface;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.provider.Settings;

public class IdentifiersPlugin extends CordovaPlugin {

  static String GET_IDFA = "getIDFA";

  public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

        if (action.equals(GET_IDFA)) {
            try {
                PluginResult res = getUuid();
                callbackContext.sendPluginResult(res);
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    public String getUuid() {
        String uuid = Settings.Secure.getString(this.cordova.getActivity().getContentResolver(), android.provider.Settings.Secure.ANDROID_ID);
        return uuid;
    }

}
