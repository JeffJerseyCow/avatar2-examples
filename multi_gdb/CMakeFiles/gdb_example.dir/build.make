# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/chris/code/python/avatar2-examples/multi_gdb

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/chris/code/python/avatar2-examples/multi_gdb

# Include any dependencies generated for this target.
include CMakeFiles/gdb_example.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/gdb_example.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gdb_example.dir/flags.make

CMakeFiles/gdb_example.dir/gdb_example.c.o: CMakeFiles/gdb_example.dir/flags.make
CMakeFiles/gdb_example.dir/gdb_example.c.o: gdb_example.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/chris/code/python/avatar2-examples/multi_gdb/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/gdb_example.dir/gdb_example.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/gdb_example.dir/gdb_example.c.o   -c /home/chris/code/python/avatar2-examples/multi_gdb/gdb_example.c

CMakeFiles/gdb_example.dir/gdb_example.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gdb_example.dir/gdb_example.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/chris/code/python/avatar2-examples/multi_gdb/gdb_example.c > CMakeFiles/gdb_example.dir/gdb_example.c.i

CMakeFiles/gdb_example.dir/gdb_example.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gdb_example.dir/gdb_example.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/chris/code/python/avatar2-examples/multi_gdb/gdb_example.c -o CMakeFiles/gdb_example.dir/gdb_example.c.s

CMakeFiles/gdb_example.dir/gdb_example.c.o.requires:

.PHONY : CMakeFiles/gdb_example.dir/gdb_example.c.o.requires

CMakeFiles/gdb_example.dir/gdb_example.c.o.provides: CMakeFiles/gdb_example.dir/gdb_example.c.o.requires
	$(MAKE) -f CMakeFiles/gdb_example.dir/build.make CMakeFiles/gdb_example.dir/gdb_example.c.o.provides.build
.PHONY : CMakeFiles/gdb_example.dir/gdb_example.c.o.provides

CMakeFiles/gdb_example.dir/gdb_example.c.o.provides.build: CMakeFiles/gdb_example.dir/gdb_example.c.o


# Object files for target gdb_example
gdb_example_OBJECTS = \
"CMakeFiles/gdb_example.dir/gdb_example.c.o"

# External object files for target gdb_example
gdb_example_EXTERNAL_OBJECTS =

gdb_example: CMakeFiles/gdb_example.dir/gdb_example.c.o
gdb_example: CMakeFiles/gdb_example.dir/build.make
gdb_example: CMakeFiles/gdb_example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/chris/code/python/avatar2-examples/multi_gdb/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable gdb_example"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gdb_example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gdb_example.dir/build: gdb_example

.PHONY : CMakeFiles/gdb_example.dir/build

CMakeFiles/gdb_example.dir/requires: CMakeFiles/gdb_example.dir/gdb_example.c.o.requires

.PHONY : CMakeFiles/gdb_example.dir/requires

CMakeFiles/gdb_example.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gdb_example.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gdb_example.dir/clean

CMakeFiles/gdb_example.dir/depend:
	cd /home/chris/code/python/avatar2-examples/multi_gdb && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/chris/code/python/avatar2-examples/multi_gdb /home/chris/code/python/avatar2-examples/multi_gdb /home/chris/code/python/avatar2-examples/multi_gdb /home/chris/code/python/avatar2-examples/multi_gdb /home/chris/code/python/avatar2-examples/multi_gdb/CMakeFiles/gdb_example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gdb_example.dir/depend
