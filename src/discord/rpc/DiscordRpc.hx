package discord.rpc;

import openfl.Assets;

#if android
import lime.system.JNI;
#end

class DiscordRpc {
    // Presence values loaded from file
    public static var clientID:String = "";
    public static var largeImageKey:String = "";
    public static var largeImageText:String = "";
    public static var smallImageKey:String = "";
    public static var smallImageText:String = "";

    public static var useSmallImageText:Bool = true;
    public static var useLargeImageText:Bool = true;
    public static var useTimestamp:Bool = true;

    // Values defined manually
    public static var details:String = "";
    public static var state:String = "";
    public static var button1Label:String = "";
    public static var button1URL:String = "";
    public static var button2Label:String = "";
    public static var button2URL:String = "";

    /**
     * Loads Discord RPC configuration from text file.
     * Must be located at: assets/data/discord_data.txt
     */
    public static function loadConfig(path:String = "assets/data/discord_data.txt"):Void {
        var text = Assets.getText(path);
        var lines = text.split('\n');

        for (line in lines) {
            var parts = line.split('=');
            if (parts.length != 2) continue;

            var key = parts[0].trim();
            var value = parts[1].trim();

            switch (key) {
                case "appID": clientID = value;
                case "largeImageKey": largeImageKey = value;
                case "smallImageKey": smallImageKey = value;
                case "UsesmallImageText": useSmallImageText = (value == "true");
                case "UselargeImageText": useLargeImageText = (value == "true");
                case "smallImageText": smallImageText = value;
                case "largeImageText": largeImageText = value;
                case "Usestimestamp": useTimestamp = (value == "true");
                default:
                    // Unknown keys are ignored
            }
        }
    }

    // Set main rich presence text
    public static function setDetails(text:String):Void {
        details = text;
    }

    public static function setState(text:String):Void {
        state = text;
    }

    // Set custom buttons
    public static function setButton1(label:String, url:String):Void {
        button1Label = label;
        button1URL = url;
    }

    public static function setButton2(label:String, url:String):Void {
        button2Label = label;
        button2URL = url;
    }

    // Send all configured data to Discord
    public static function rebuild():Void {
        #if android
        trace("[DiscordRpc] Rebuilding presence...");

        if (clientID == "") {
            trace("[DiscordRpc] Warning: appID is empty!");
            return;
        }

        JNI.call("discord.rpc.DiscordRpc", "init", ["java.lang.String"], clientID);

        if (useTimestamp) {
            var timestamp = Date.now().getTime() / 1000;
            JNI.call("discord.rpc.DiscordRpc", "setTimestamp", ["double"], timestamp);
        } else {
            JNI.call("discord.rpc.DiscordRpc", "clearTimestamp", []);
        }

        JNI.call("discord.rpc.DiscordRpc", "setDetails", ["java.lang.String"], details);
        JNI.call("discord.rpc.DiscordRpc", "setState", ["java.lang.String"], state);

        JNI.call("discord.rpc.DiscordRpc", "setLargeImage", ["java.lang.String", "java.lang.String"],
            largeImageKey,
            useLargeImageText ? largeImageText : ""
        );

        JNI.call("discord.rpc.DiscordRpc", "setSmallImage", ["java.lang.String", "java.lang.String"],
            smallImageKey,
            useSmallImageText ? smallImageText : ""
        );

        if (button1Label != "" && button1URL != "") {
            JNI.call("discord.rpc.DiscordRpc", "setButton1", ["java.lang.String", "java.lang.String"], button1Label, button1URL);
        }

        if (button2Label != "" && button2URL != "") {
            JNI.call("discord.rpc.DiscordRpc", "setButton2", ["java.lang.String", "java.lang.String"], button2Label, button2URL);
        }

        JNI.call("discord.rpc.DiscordRpc", "update", []);
        #else
        trace("[DiscordRpc] Stub: Not running on Android.");
        #end
    }
}
