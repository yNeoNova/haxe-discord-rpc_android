#ifndef DISCORD_REGISTER_H
#define DISCORD_REGISTER_H

#ifdef __cplusplus
extern "C" {
#endif

void Discord_Register(const char* applicationId, const char* command);
void Discord_RegisterSteamGame(const char* applicationId, const char* steamId);

#ifdef __cplusplus
}
#endif

#endif // DISCORD_REGISTER_H
