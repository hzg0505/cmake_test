# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.25.2/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.25.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/hzg/test/cmake/shiyan6

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/hzg/test/cmake/shiyan6/build

# Include any dependencies generated for this target.
include bin/CMakeFiles/hello_static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include bin/CMakeFiles/hello_static.dir/compiler_depend.make

# Include the progress variables for this target.
include bin/CMakeFiles/hello_static.dir/progress.make

# Include the compile flags for this target's objects.
include bin/CMakeFiles/hello_static.dir/flags.make

bin/CMakeFiles/hello_static.dir/hello.o: bin/CMakeFiles/hello_static.dir/flags.make
bin/CMakeFiles/hello_static.dir/hello.o: /Users/hzg/test/cmake/shiyan6/lib/hello.cpp
bin/CMakeFiles/hello_static.dir/hello.o: bin/CMakeFiles/hello_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/hzg/test/cmake/shiyan6/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object bin/CMakeFiles/hello_static.dir/hello.o"
	cd /Users/hzg/test/cmake/shiyan6/build/bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/CMakeFiles/hello_static.dir/hello.o -MF CMakeFiles/hello_static.dir/hello.o.d -o CMakeFiles/hello_static.dir/hello.o -c /Users/hzg/test/cmake/shiyan6/lib/hello.cpp

bin/CMakeFiles/hello_static.dir/hello.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hello_static.dir/hello.i"
	cd /Users/hzg/test/cmake/shiyan6/build/bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/hzg/test/cmake/shiyan6/lib/hello.cpp > CMakeFiles/hello_static.dir/hello.i

bin/CMakeFiles/hello_static.dir/hello.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hello_static.dir/hello.s"
	cd /Users/hzg/test/cmake/shiyan6/build/bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/hzg/test/cmake/shiyan6/lib/hello.cpp -o CMakeFiles/hello_static.dir/hello.s

# Object files for target hello_static
hello_static_OBJECTS = \
"CMakeFiles/hello_static.dir/hello.o"

# External object files for target hello_static
hello_static_EXTERNAL_OBJECTS =

bin/libhello.a: bin/CMakeFiles/hello_static.dir/hello.o
bin/libhello.a: bin/CMakeFiles/hello_static.dir/build.make
bin/libhello.a: bin/CMakeFiles/hello_static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/hzg/test/cmake/shiyan6/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libhello.a"
	cd /Users/hzg/test/cmake/shiyan6/build/bin && $(CMAKE_COMMAND) -P CMakeFiles/hello_static.dir/cmake_clean_target.cmake
	cd /Users/hzg/test/cmake/shiyan6/build/bin && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hello_static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
bin/CMakeFiles/hello_static.dir/build: bin/libhello.a
.PHONY : bin/CMakeFiles/hello_static.dir/build

bin/CMakeFiles/hello_static.dir/clean:
	cd /Users/hzg/test/cmake/shiyan6/build/bin && $(CMAKE_COMMAND) -P CMakeFiles/hello_static.dir/cmake_clean.cmake
.PHONY : bin/CMakeFiles/hello_static.dir/clean

bin/CMakeFiles/hello_static.dir/depend:
	cd /Users/hzg/test/cmake/shiyan6/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/hzg/test/cmake/shiyan6 /Users/hzg/test/cmake/shiyan6/lib /Users/hzg/test/cmake/shiyan6/build /Users/hzg/test/cmake/shiyan6/build/bin /Users/hzg/test/cmake/shiyan6/build/bin/CMakeFiles/hello_static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bin/CMakeFiles/hello_static.dir/depend

