package discord.rpc;

import android.util.Log;

public class DiscordRpc {

    private static final String TAG = "DiscordRpc";

    public static void init(String clientId) {
        Log.d(TAG, "init called with clientId: " + clientId);
        // TODO: Initialize Discord RPC SDK here
    }

    public static void setTimestamp(double timestamp) {
        Log.d(TAG, "setTimestamp called with: " + timestamp);
        // TODO: Set timestamp in Discord presence
    }

    public static void clearTimestamp() {
        Log.d(TAG, "clearTimestamp called");
        // TODO: Clear timestamp in Discord presence
    }

    public static void setDetails(String details) {
        Log.d(TAG, "setDetails called with: " + details);
        // TODO: Set details in Discord presence
    }

    public static void setState(String state) {
        Log.d(TAG, "setState called with: " + state);
        // TODO: Set state in Discord presence
    }

    public static void setLargeImage(String key, String text) {
        Log.d(TAG, "setLargeImage called with key: " + key + ", text: " + text);
        // TODO: Set large image key and text
    }

    public static void setSmallImage(String key, String text) {
        Log.d(TAG, "setSmallImage called with key: " + key + ", text: " + text);
        // TODO: Set small image key and text
    }

    public static void setButton1(String label, String url) {
        Log.d(TAG, "setButton1 called with label: " + label + ", url: " + url);
        // TODO: Set button 1 in Discord presence
    }

    public static void setButton2(String label, String url) {
        Log.d(TAG, "setButton2 called with label: " + label + ", url: " + url);
        // TODO: Set button 2 in Discord presence
    }

    public static void update() {
        Log.d(TAG, "update called");
        // TODO: Push updates to Discord
    }
}
