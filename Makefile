MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKEFILE_DIR := $(dir $(mkfile_path))
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
ENTRY = Driver/main.cpp

SRC_DIR := $(ROOT_DIR)/Lib
OBJ_DIR := $(ROOT_DIR)/bin
SRC_FILES := $(wildcard $(SRC_DIR)/*/*.cpp)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES))
LDFLAGS := 
CPPFLAGS := 
CXXFLAGS := 

main.exe: $(OBJ_FILES)
	g++ $(LDFLAGS) -o $@ $^ -I$(SRC_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir $@
	echo $(OBJ_DIR)
	g++ $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $<