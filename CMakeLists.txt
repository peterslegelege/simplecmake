cmake_minimum_required(VERSION 3.21)

project(staticlib1 C)

add_library(staticlib1 STATIC src/fct1.c)
target_include_directories(staticlib1 PUBLIC src)

enable_testing()
add_subdirectory(test)
