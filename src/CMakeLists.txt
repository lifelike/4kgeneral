add_executable (../../general4c
  G.c)

set(CMAKE_C_FLAGS "-std=c99")

include(FindPkgConfig)
pkg_search_module(SDL2 REQUIRED sdl2)
include_directories(${SDL2_INCLUDE_DIRS})
target_link_libraries(../../general4c ${SDL2_LIBRARIES})
