package cordova.plugin.startapp;

import android.content.Intent;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.LOG;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.net.URISyntaxException;

import static android.R.id.message;

/**
 * This class echoes a string called from JavaScript.
 */
public class StartApp extends CordovaPlugin {

    public static final String TAG = "startApp";
    public StartApp() { }
    private boolean NO_PARSE_INTENT_VALS = false;


    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("coolMethod")) {
            String message = args.getString(0);
            this.coolMethod(message, callbackContext);
            return true;
        } else if (action.equals("start")) {
            this.start(args, callbackContext);

            return  true;
        } else if (action.equals("go")) {
            this.start(args, callbackContext);
        } else if (action.equals("check")) {
            this.check(args, callbackContext);
        }
        return false;
    }

    private void coolMethod(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }

    /**
     * startApp
     */
    public void start(JSONArray args, CallbackContext callback) {
        LOG.i(TAG,"native call ali qrcode methold");

        if (args == null || args.length() == 0) {
            callback.error("args should not be null or empty");
            return;
        }

        try {
            Object params = args.get(0);

            if (params instanceof String) {

                Intent intent = null;
                try {
                    intent = Intent.parseUri(params.toString(), Intent.URI_INTENT_SCHEME);
                } catch (URISyntaxException e) {
                    e.printStackTrace();
                }
                webView.getContext().startActivity(intent);

                callback.success(message);

            }
        } catch (JSONException e) {
            callback.error("JSONException: " + e.getMessage());
            e.printStackTrace();
        }
        callback.error("Expected one non-empty string argument.");

    }


    /**
    * checkApp
    */
    public void check(JSONArray args, CallbackContext callback) {
        JSONObject params;

    }
}
