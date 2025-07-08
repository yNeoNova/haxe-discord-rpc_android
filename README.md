# Haxe Discord RPC Android Port
An Haxelib Android library written in [C++](https://isocpp.org/), [Java](https://www.java.com/en/) and [Haxe](https://haxe.org/download/version/4.3.6/)

# Installation
In your `hmm.json` paste this content:
`used haxe modular manager` [v3.1.0](https://lib.haxe.org/p/hmm/)
```json
{
  "dependencies": [
    {
      "name": "haxe-discord-rpc_android",
      "type": "git",
      "dir": null,
      "ref": "master",
      "url": "https://github.com/yNeoNova/haxe-discord-rpc_android"
    }
  ]
}
```
and setup this at your `Project.xml`:
```xml
<haxelib name="haxe-discord-rpc_android" if="android" />
```

# Usage
Create the dir `assets/data/discord_data.txt` and paste this:
```text
appID=your_application_id_here
largeImageKey=largeImage
smallImageKey=smallimage
UsesmallImageText=true
UselargeImageText=true
smallImageText=StringOutput
largeImageText=StringOutput
Usestimestamp=true
```
Or, download and upload this file:
https://github.com/yNeoNova/haxe-discord-rpc_android/blob/main/assets/data/discord_data.txt

# Code Example
```Haxe
import discord.rpc.DiscordRpc;

class Main {
    static function main() {
        // Load config from the .txt
        DiscordRpc.loadConfig();

        // Set presence info
        DiscordRpc.setDetails("Playing Level 3");
        DiscordRpc.setState("Fighting the boss");

        DiscordRpc.setButton1("Join Game", "https://example.com/join");
        DiscordRpc.setButton2("Watch Stream", "https://example.com/stream");

        // Rebuild and send presence
        DiscordRpc.rebuild();
    }
}
```
---
# Notes:
As said earlier:
> Library only for Android
> Supported ABIs: armeabi-v7a, arm64-v8a, x86 and x86_64

# License
This library is made under MIT license, please read [it](https://github.com/yNeoNova/haxe-discord-rpc_android/blob/main/LICENSE) to know what you can or can NOT do with this lib
---
Build with Love, Leo.
