### The Eppendoofus


This is the firmware and host control software for the eppendoofus microwave-bio breadboard.

The d
s

the following types of messages are sent:

- Set VCO power
- ACK
-

a


Uses protobufs. Though I'm sure it exists, I couldn't find a simple
S.N.A.P protocol

Protobuf needs to be installed.
ARM_NONE_EABI doesn't like protobuf by default - no pthread! we therefore have to pass HAVE_PTHREAD=0

then we get an
google/protobuf/stubs/common.cc:50:2: error: #error "No suitable threading library available."
 #error "No suitable threading library available."
  ^~~~~
  https://groups.google.com/forum/#!topic/protobuf/WRA7uSZzC3c

Fortunately, pthread is only required in stubs/once.h; we just overwrite that, removing the relevant issues.
