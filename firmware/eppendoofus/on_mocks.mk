# The name of your project (used to name the compiled .hex file)
TARGET = $(notdir $(CURDIR))

# path location for Teensy 3 core
COREPATH = /home/arthurdent/Programs/arduino-1.8.12-linux64/arduino-1.8.12/hardware/teensy/avr/cores/teensy3/

PROTOBUF_PATH = libraries/protobuf/protobuf-host/
PROTOBUF_C_PATH = libraries/protobuf-c/protobuf-host/

LIBRARYPATH = libraries


#https://github.com/apmorton/teensy-template

CPPFLAGS = -Wall -Werror -g -Os -ffunction-sections -fdata-sections -Isrc -Itest_mocks -IUnity/src/ -DMOCK_INCLUDES -fsingle-precision-constant
CPPFLAGS += -I$(LIBRARYPATH)/SerialTransfer/src/ -DUNITY_INCLUDE_CONFIG_H -I$(PROTOBUF_PATH)/include/ -I$(PROTOBUF_C_PATH)/include/ -I$(COREPATH)

# compiler options for C++ only
CXXFLAGS =   -std=gnu++0x -Wno-c++14-compat

# compiler options for C only
CFLAGS =


# linker options
LDFLAGS = -Os -Wl,--gc-sections

LIBS = -lm -lstdc++

# names for the compiler programs
CXX = g++
CC = gcc

BUILDDIR = $(abspath $(CURDIR)/build)

# the cores/ folder already includes an example main.c file. we want to ignore that.
TCPP_FILES := $(filter-out $(COREPATH)/main.cpp, $(TCPP_FILES))

CPP_FILES := $(wildcard src/*.cpp)

CPP_FILES := $(filter-out src/main.cpp, $(CPP_FILES))
CPP_FILES += $(wildcard test_mocks/*.cpp)
CPP_FILES += $(wildcard src/*.cc)

C_FILES := $(wildcard Unity/src/*.c)

SOURCES := $(CPP_FILES:.cpp=.o) $(CPP_FILES:.cc=.o) $(TCPP_FILES:.cpp=.o) $(C_FILES:.c=.o)
OBJS := $(foreach src,$(SOURCES), $(BUILDDIR)/$(src))

all: $(TARGET) proto

build: $(TARGET)


proto:
	protoc --python_out=host/ src/messages.proto
	protoc -I=src/ --cpp_out=src/ src/messages.proto
	rename src/messages.pb.cc src/messages.pb.cpp # would otherwise have to add a bunch of extra boilerplate to the makefile


$(BUILDDIR)/%.o: %.cpp
	@echo -e "[CXX]\t$<"
	@mkdir -p "$(dir $@)"
	@$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(L_INC) -o "$@" -c "$<"

$(TARGET): $(OBJS) $(LDSCRIPT)
	@echo -e "[LD]\t$@"
	@$(CC) $(LDFLAGS) -o "$@" $(OBJS) $(LIBS)

$(BUILDDIR)/%.o: %.c
	@echo -e "[CC]\t$<"
	@mkdir -p "$(dir $@)"
	@$(CC) $(CPPFLAGS) $(CFLAGS) $(L_INC) -o "$@" -c "$<"


# compiler generated dependency info
-include $(OBJS:.o=.d)

clean:
	@echo Cleaning...
	@rm -rf "$(BUILDDIR)"
	@rm -f "$(TARGET)"
