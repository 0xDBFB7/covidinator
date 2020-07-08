#include "host_comms.hpp"

struct host_comms{
    SerialTransfer host_transfer;
    void init();
};

void host_comms::init(){
    
    host_transfer.begin(Serial1);
}



void send_message(){
  CMessage msg = CMESSAGE__INIT;  // CMessage (repeated int32)
  void *buf;                      // Buffer to store serialized data
  unsigned len,i;                 // Length of serialized data

  msg.n_c = argc - 1;                      // Save number of repeated int32
  // std::vector.data();
  msg.c = .data()     // Access msg.c[] as array
  len = cmessage__get_packed_size (&msg);  // This is calculated packing length
  buf = malloc (len);                      // Allocate required serialized buffer length
  cmessage__pack (&msg, buf);              // Pack the data

  fprintf(stderr,"Writing %d serialized bytes\n",len); // See the length of message
  fwrite (buf, len, 1, stdout);            // Write to stdout to allow direct command line piping

  return 0;
}

void receive_message(){

    if(myTransfer.available())
    {
      // use this variable to keep track of how many
      // bytes we've processed from the receive buffer
      uint16_t recSize = 0;

      ///////////////////////////////////////// Manually read the first two bytes in the rxBuff
      Serial.print((char)myTransfer.rxBuff[0]);
      Serial.print(' ');
      Serial.print(myTransfer.rxBuff[1]);
      Serial.print(" | ");
      recSize += 2;

      ///////////////////////////////////////// Automatically read the struct's bytes in the rxBuff
      recSize = myTransfer.rxObj(testStruct, recSize);
      Serial.print(testStruct.z);
      Serial.print(' ');
      Serial.println(testStruct.y);
    }
    else if(myTransfer.status < 0)
    {
      Serial.print("ERROR: ");

      if(myTransfer.status == -1)
        Serial.println(F("CRC_ERROR"));
      else if(myTransfer.status == -2)
        Serial.println(F("PAYLOAD_ERROR"));
      else if(myTransfer.status == -3)
        Serial.println(F("STOP_BYTE_ERROR"));
    }

  CMessage *msg;
  uint8_t buf[MAX_MSG_SIZE];
  unsigned i;
  size_t msg_len = read_buffer (MAX_MSG_SIZE, buf);

  msg = cmessage__unpack (NULL, msg_len, buf); // Deserialize the serialized input
  if (msg == NULL)
  { // Something failed
    fprintf(stderr, "error unpacking incoming message\n");
    return 1;
  }

  for (i = 0; i < msg->n_c; i++)
  { // Iterate through all repeated int32
    if (i > 0)
      printf (", ");
    printf ("%d", msg->c[i]);
  }
  printf ("\n");

  cmessage__free_unpacked(msg,NULL); // Free the message from unpack()
  return 0;
}
