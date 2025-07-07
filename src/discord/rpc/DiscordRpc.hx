package discord.rpc;

import openfl.Assets;

#if android
import lime.system.JNI;
#end

class DiscordRpc {
    // Presence data
    public static var clientID:String = "";
    public static var details:String = "";
    public static var state:String = "";

    public static var largeImageKey:String = "";
    public static var largeImageText:String = "";
    public static var smallImageKey:String = "";
    public static var smallImageText:String = "";

    public static var useSmallImageText:Bool = true;
    public static var useLargeImageText:Bool = true;
    public static var useTimestamp:Bool = true;

    public static var button1Label:String = "";
    public static var button1URL:String = "";
    public static var button2Label:String = "";
    public static var button2URL:String = "";

    /**
     * Loads Discord RPC config from a text file.
     * Expected keys:
     *  appID, largeImageKey, smallImageKey,
     *  UsesmallImageText, UselargeImageText,
     *  smallImageText, largeImageText,
     *  Usestimestamp
     */
    public static function loadConfig(path:String = "assets/data/discord_rpc_config.txt"):Void {
        var text = Assets.getText(path);
        var lines = text.split('\n');
        for (line in lines) {
            var parts = line.split('=');
            if (parts.length == 2) {
                var key = parts[0].trim();
                var value = parts[1].trim();
                switch (key) {
                    case "appID":
                        clientID = value;
                    case "largeImageKey":
                        largeImageKey = value;
                    case "smallImageKey":
                        smallImageKey = value;
                    case "UsesmallImageText":
                        useSmallImageText = (value.toLowerCase() == "true");
                    case "UselargeImageText":
                        useLargeImageText = (value.toLowerCase() == "true");
                    case "smallImageText":
                        smallImageText = value;
                    case "largeImageText":
                        largeImageText = value;
                    case "Usestimestamp":
                        useTimestamp = (value.toLowerCase() == "true");
                    default:
                        // Ignore unknown keys
                }
            }
        }
    }

    // Setter methods for text and buttons (set these directly in code)
    public static function setDetails(d:String):Void details = d;
    public static function setState(s:String):Void state = s;

    public static function setButton1(label:String, url:String):Void {
        button1Label = label;
        button1URL = url;
    }

    public static function setButton2(label:String, url:String):Void {
        button2Label = label;
        button2URL = url;
    }

    /**
     * Call this after setting all values to update Discord Rich Presence.
     */
    public static function rebuild():Void {
        #if android
        trace("[DiscordRpc] Rebuilding presence...");

        if (clientID == "") {
            trace("[DiscordRpc] Warning: clientID (appID) is empty!");
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

        if (button1Label != "" && button1URL != "")
            JNI.call("discord.rpc.DiscordRpc", "setButton1", ["java.lang.String", "java.lang.String"], button1Label, button1URL);

        if (button2Label != "" && button2URL != "")
            JNI.call("discord.rpc.DiscordRpc", "setButton2", ["java.lang.String", "java.lang.String"], button2Label, button2URL);

        JNI.call("discord.rpc.DiscordRpc", "update", []);
        #else
        trace("[DiscordRpc] Stub rebuild called (not Android).");
        #end
    }
}
