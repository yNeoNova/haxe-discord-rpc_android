#ifndef DISCORD_RPC_H
#define DISCORD_RPC_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

typedef struct DiscordRichPresence {
    const char* state;
    const char* details;
    int64_t startTimestamp;
    int64_t endTimestamp;
    const char* largeImageKey;
    const char* largeImageText;
    const char* smallImageKey;
    const char* smallImageText;
    const char* partyId;
    int partySize;
    int partyMax;
    const char* matchSecret;
    const char* joinSecret;
    const char* spectateSecret;
    int8_t instance;
    const char* buttons[2];
} DiscordRichPresence;

void Discord_Initialize(const char* applicationId, void* handlers, int autoRegister, const char* optionalSteamId);
void Discord_Shutdown(void);
void Discord_RunCallbacks(void);
void Discord_UpdatePresence(const DiscordRichPresence* presence);
void Discord_ClearPresence(void);

#ifdef __cplusplus
}
#endif

#endif // DISCORD_RPC_H
