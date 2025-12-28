add_executable(test_project
    test_project.c
)

target_link_libraries(test_project PRIVATE ToolsLib)

add_test(
    NAME Tools_basic_test
    COMMAND test_project
)
