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

No go. needs lstdc++. Ultimately, just going to roll my own format.


We have to use Arduino's WString rather than std::string because of size limitations.

There has to be some packet-framing lib out there.
https://github.com/PowerBroker2/SerialTransfer - only 256 chars,


Have to remove #include "arduino.h" from SerialTransfer to mock

Now we have a real problem. We can't fit std::string on the teensy; but we can't include WString in the mocked build. So we'd either have to re-implement WString, or only use char*s, or give up on mocking.

I will do this last option.
