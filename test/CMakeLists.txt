set(LINK_LIBS
    staticlib1
)

add_executable(testfct1 testfct1.c)
target_link_libraries(testfct1 PRIVATE staticlib1)

target_include_directories(testfct1 PRIVATE staticlib1)

add_test(NAME testfct1 COMMAND testfct1)
