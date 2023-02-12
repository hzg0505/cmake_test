INCLUDE_DIRECTORIES(/usr/local/include/hello)
### LINK_DIRECTORIES(/usr/local/lib)
ADD_EXECUTABLE(hello main.cpp)

TARGET_LINK_LIBRARIES(hello libhello.a)
