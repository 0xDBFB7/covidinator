#include "host_comms.hpp"



void parse_command(){
    
}


// //
// // unsigned char converted_bytes[4];
// //
// // float bytes_to_float(unsigned char b0, unsigned char b1, unsigned char b2, unsigned char b3){
// //     float output;
// //     *((unsigned char*)(&output) + 3) = b0;
// //     *((unsigned char*)(&output) + 2) = b1;
// //     *((unsigned char*)(&output) + 1) = b2;
// //     *((unsigned char*)(&output) + 0) = b3;
// //     return output;
// // }
// //
// // void float_to_bytes(float f){
// //   int length = sizeof(float);
// //   for(int i = 0; i < length; i++){
// //     converted_bytes[i] = ((unsigned char *)&f)[i];
// //   }
// // }
//
//
//
// struct host_comms{
//     SerialTransfer host_transfer;
//     void init();
// };
//
// void host_comms::init(){
//     host_serial.begin(comms);
// }
//
//
// void send_message(){
//     Type2 type2_msg;
//
//     MyOneofMessage msg = {PROTOBUF_C_MESSAGE_INIT(&my_oneof_message__descriptor), \
//     SECOND_POSSIBLE_TYPE, &type_2_msg};
//
//     CMessage msg = CMESSAGE__INIT;  // CMessage (repeated int32)
//                           // Buffer to store serialized data
//     unsigned len,i;                 // Length of serialized data
//
//     // msg.n_c = argc - 1;                      // Save number of repeated int32
//
//     len = cmessage__get_packed_size (&msg);  // This is calculated packing length
//     if(len > 254){
//         debug_print("error packing message\n");
//
//     }
//
//     cmessage__pack (&msg, host_transfer.txBuff);              // Pack the data
//
//     sendSize = host_transfer.txObj(testStruct, sendSize);
//
//     host_transfer.sendData(sendSize);
//
//     return 0;
// }
//
// void host_comms::recieve_message(){
//     message_type = host_transfer.rxBuff[0];
//     //avoids using pb's oneof
//
//     recSize = myTransfer.rxObj(testStruct, 1);
//
//     CMessage *msg;
//     uint8_t buf[MAX_MSG_SIZE];
//     unsigned i;
//     size_t msg_len = read_buffer (MAX_MSG_SIZE, buf);
//
//     msg = cmessage__unpack (NULL, msg_len, buf); // Deserialize the serialized input
//     if (msg == NULL){ // Something failed
//         debug_print("error unpacking incoming message\n");
//         return 1;
//     }
//
//     for (i = 0; i < msg->n_c; i++){ // Iterate through all repeated int32
//         if (i > 0) printf ("%d", msg->c[i]);
//     }
//
//     cmessage__free_unpacked(msg,NULL); // Free the message from unpack()
// }
//
// void host_comms::check_for_messages(){
//     if(host_transfer.available()){
//       uint16_t recSize = 0;
//
//       Serial.print(testStruct.z);
//       Serial.print(' ');
//       Serial.println(testStruct.y);
//     }
//     else if(myTransfer.status < 0)
//     {
//       debug_print("ERROR: ");
//       if(myTransfer.status == -1)
//         debug_print(F("CRC_ERROR"));
//       else if(myTransfer.status == -2)
//         debug_print(F("PAYLOAD_ERROR"));
//       else if(myTransfer.status == -3)
//         debug_print(F("STOP_BYTE_ERROR"));
//     }
// }
