package discord.rpc;

typedef Button = {
    var label:String;
    var url:String;
}

typedef Presence = {
    var details:String;
    var state:String;
    var largeImageKey:String;
    var largeImageText:String;
    var smallImageKey:String;
    var smallImageText:String;
    var useSmallImageText:Bool;
    var useLargeImageText:Bool;
    var button1:Button;
    var button2:Button;
    var useTimestamp:Bool;
}
