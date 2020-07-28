// #include "host_comms.hpp"
//
// CmdMessenger cmdMessenger = CmdMessenger(Serial); //global! oh noes!
//
//
// void attachCommandCallbacks(){
//
//   cmdMessenger.attach(OnUnknownCommand);
//   cmdMessenger.attach(kVCO_set, VCO_set_cmd);
//   cmdMessenger.attach(kFloatAddition, OnFloatAddition);
// }
//
//
// void OnUnknownCommand()
// {
//   cmdMessenger.sendCmd(kError,"Command without attached callback");
// }
//
// // Callback function that responds that Arduino is ready (has booted up)
// void OnArduinoReady()
// {
//   cmdMessenger.sendCmd(kAcknowledge,"Arduino ready");
// }
//
//
// void VCO_set_cmd(){
//
// }
