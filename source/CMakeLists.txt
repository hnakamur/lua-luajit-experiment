add_executable(hmacfile hmacfile.c)
target_compile_options(hmacfile PRIVATE -O2)
target_link_libraries(hmacfile crypto)
