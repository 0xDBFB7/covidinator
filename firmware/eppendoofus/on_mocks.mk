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
#TC_FILES := $(COREPATH)/WString.c
#TCPP_FILES := $(COREPATH)/WString.cpp

CPP_FILES := $(wildcard src/*.cpp)

CPP_FILES := $(filter-out src/main.cpp, $(CPP_FILES))
CPP_FILES += $(wildcard test_mocks/*.cpp)
CPP_FILES += $(wildcard src/*.cc)

C_FILES := $(wildcard Unity/src/*.c)

LC_FILES := $(wildcard $(LIBRARYPATH)/*/*.c)
LCPP_FILES := $(wildcard $(LIBRARYPATH)/*/*.cpp)
L_INC := $(foreach lib,$(filter %/, $(wildcard $(LIBRARYPATH)/*/)), -I$(lib))


SOURCES := $(CPP_FILES:.cpp=.o) $(TCPP_FILES:.cpp=.o) $(C_FILES:.c=.o) $(LC_FILES:.c=.o) $(LCPP_FILES:.cpp=.o)
OBJS := $(foreach src,$(SOURCES), $(BUILDDIR)/$(src))

all: $(TARGET) proto

build: $(TARGET)


proto:
	$(PROTOBUF_PATH)/bin/protoc --python_out=host/ src/messages.proto
	$(PROTOBUF_C_PATH)/bin/protoc-c -I=src/ --c_out=src/ src/messages.proto


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
