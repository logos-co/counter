cmake_minimum_required(VERSION 3.14)
project(CounterPlugin LANGUAGES CXX)

if(DEFINED ENV{LOGOS_MODULE_BUILDER_ROOT})
    include($ENV{LOGOS_MODULE_BUILDER_ROOT}/cmake/LogosModule.cmake)
else()
    message(FATAL_ERROR "LogosModule.cmake not found. Set LOGOS_MODULE_BUILDER_ROOT.")
endif()

logos_module(
    NAME counter
    REP_FILE src/counter.rep
    SOURCES
        src/counter_interface.h
        src/counter_plugin.h
        src/counter_plugin.cpp
        src/CounterBackend.h
        src/CounterBackend.cpp
)
