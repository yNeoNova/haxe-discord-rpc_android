#include "discord_register.h"
#include <jni.h>
#include <android/log.h>

#define LOG_TAG "DiscordRegister"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)

// Stub implementations

void Discord_Register(const char* applicationId, const char* command) {
    LOGI("Discord_Register called with appId: %s, command: %s", applicationId, command);
    // Register your app here
}

void Discord_RegisterSteamGame(const char* applicationId, const char* steamId) {
    LOGI("Discord_RegisterSteamGame called with appId: %s, steamId: %s", applicationId, steamId);
    // Register Steam game here
}
