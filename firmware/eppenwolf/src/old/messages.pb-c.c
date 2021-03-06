/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: messages.proto */

/* Do not generate deprecated warnings for self */
#ifndef PROTOBUF_C__NO_DEPRECATED
#define PROTOBUF_C__NO_DEPRECATED
#endif

#include "messages.pb-c.h"
void   vco_set__init
                     (VCOSet         *message)
{
  static const VCOSet init_value = VCO_SET__INIT;
  *message = init_value;
}
size_t vco_set__get_packed_size
                     (const VCOSet *message)
{
  assert(message->base.descriptor == &vco_set__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t vco_set__pack
                     (const VCOSet *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &vco_set__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t vco_set__pack_to_buffer
                     (const VCOSet *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &vco_set__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
VCOSet *
       vco_set__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (VCOSet *)
     protobuf_c_message_unpack (&vco_set__descriptor,
                                allocator, len, data);
}
void   vco_set__free_unpacked
                     (VCOSet *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &vco_set__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   input_message__init
                     (InputMessage         *message)
{
  static const InputMessage init_value = INPUT_MESSAGE__INIT;
  *message = init_value;
}
size_t input_message__get_packed_size
                     (const InputMessage *message)
{
  assert(message->base.descriptor == &input_message__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t input_message__pack
                     (const InputMessage *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &input_message__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t input_message__pack_to_buffer
                     (const InputMessage *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &input_message__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
InputMessage *
       input_message__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (InputMessage *)
     protobuf_c_message_unpack (&input_message__descriptor,
                                allocator, len, data);
}
void   input_message__free_unpacked
                     (InputMessage *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &input_message__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
static const ProtobufCFieldDescriptor vco_set__field_descriptors[3] =
{
  {
    "name",
    1,
    PROTOBUF_C_LABEL_REQUIRED,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(VCOSet, name),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "power",
    2,
    PROTOBUF_C_LABEL_REQUIRED,
    PROTOBUF_C_TYPE_INT32,
    0,   /* quantifier_offset */
    offsetof(VCOSet, power),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "tuning_voltage",
    3,
    PROTOBUF_C_LABEL_REQUIRED,
    PROTOBUF_C_TYPE_FLOAT,
    0,   /* quantifier_offset */
    offsetof(VCOSet, tuning_voltage),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned vco_set__field_indices_by_name[] = {
  0,   /* field[0] = name */
  1,   /* field[1] = power */
  2,   /* field[2] = tuning_voltage */
};
static const ProtobufCIntRange vco_set__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 3 }
};
const ProtobufCMessageDescriptor vco_set__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "VCO_set",
  "VCOSet",
  "VCOSet",
  "",
  sizeof(VCOSet),
  3,
  vco_set__field_descriptors,
  vco_set__field_indices_by_name,
  1,  vco_set__number_ranges,
  (ProtobufCMessageInit) vco_set__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor input_message__field_descriptors[1] =
{
  {
    "msg1",
    1,
    PROTOBUF_C_LABEL_OPTIONAL,
    PROTOBUF_C_TYPE_MESSAGE,
    offsetof(InputMessage, message_case),
    offsetof(InputMessage, msg1),
    &vco_set__descriptor,
    NULL,
    0 | PROTOBUF_C_FIELD_FLAG_ONEOF,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned input_message__field_indices_by_name[] = {
  0,   /* field[0] = msg1 */
};
static const ProtobufCIntRange input_message__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 1 }
};
const ProtobufCMessageDescriptor input_message__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "input_message",
  "InputMessage",
  "InputMessage",
  "",
  sizeof(InputMessage),
  1,
  input_message__field_descriptors,
  input_message__field_indices_by_name,
  1,  input_message__number_ranges,
  (ProtobufCMessageInit) input_message__init,
  NULL,NULL,NULL    /* reserved[123] */
};
