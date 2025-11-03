cmake_minimum_required(VERSION 3.15)

project(doom LANGUAGES C)

# --------------------------------------------------------------------
# Configuration
# --------------------------------------------------------------------
set(CMAKE_C_STANDARD 99)

# Build type: Debug / Release
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

# --------------------------------------------------------------------
# Directories
# --------------------------------------------------------------------
# Source and include directories
set(SRC_DIR ${CMAKE_SOURCE_DIR}/linuxdoom-1.10)
set(INCLUDE_DIR ${CMAKE_SOURCE_DIR}/linuxdoom-1.10)

# Collect all .c or .cpp files automatically
file(GLOB_RECURSE SOURCES ${SRC_DIR}/*.c)

include_directories(${INCLUDE_DIR})

# --------------------------------------------------------------------
# Linker Flags
# --------------------------------------------------------------------
# Add custom linker flags if needed
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--as-needed")

# --------------------------------------------------------------------
# External Libraries
# --------------------------------------------------------------------
link_directories(/usr/X11R6/lib)

# Example manual linking:
set(LIBS Xext X11 nsl m)

# --------------------------------------------------------------------
# Targets
# --------------------------------------------------------------------
add_executable(${PROJECT_NAME} ${SOURCES})

# Link libraries (add or remove as needed)
target_link_libraries(${PROJECT_NAME}
    PRIVATE
        ${LIBS}
)

# Optional: set compile options per target
target_compile_options(${PROJECT_NAME}
    PRIVATE
      -g -Wall -DNORMALUNIX -DLINUX # -DUSEASM 
)

# Optional: specify include directories per target
target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${INCLUDE_DIR}
)

# --------------------------------------------------------------------
# Installation (optional)
# --------------------------------------------------------------------
# install(TARGETS ${PROJECT_NAME} DESTINATION bin)
# install(DIRECTORY ${INCLUDE_DIR}/ DESTINATION include)

