package discord.rpc;

public class DiscordRpc {

    private static final String TAG = "DiscordRpc";

    public static void init(String clientId) {
        System.out.println(TAG + ": init called with clientId: " + clientId);
    }

    public static void setTimestamp(double timestamp) {
        System.out.println(TAG + ": setTimestamp called with: " + timestamp);
    }

    public static void clearTimestamp() {
        System.out.println(TAG + ": clearTimestamp called");
    }

    public static void setDetails(String details) {
        System.out.println(TAG + ": setDetails called with: " + details);
    }

    public static void setState(String state) {
        System.out.println(TAG + ": setState called with: " + state);
    }

    public static void setLargeImage(String key, String text) {
        System.out.println(TAG + ": setLargeImage called with key: " + key + ", text: " + text);
    }

    public static void setSmallImage(String key, String text) {
        System.out.println(TAG + ": setSmallImage called with key: " + key + ", text: " + text);
    }

    public static void setButton1(String label, String url) {
        System.out.println(TAG + ": setButton1 called with label: " + label + ", url: " + url);
    }

    public static void setButton2(String label, String url) {
        System.out.println(TAG + ": setButton2 called with label: " + label + ", url: " + url);
    }

    public static void update() {
        System.out.println(TAG + ": update called");
    }
}
