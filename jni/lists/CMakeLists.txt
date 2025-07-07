cmake_minimum_required(VERSION 3.6)

project(discord_rpc)

add_library(discord_rpc SHARED
    ../jni/discord_rpc.cpp
    ../jni/discord_register.cpp
)

target_include_directories(discord_rpc PRIVATE ../include)

find_library(log-lib log)

target_link_libraries(discord_rpc ${log-lib})
