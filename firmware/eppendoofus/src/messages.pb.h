// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: messages.proto

#ifndef GOOGLE_PROTOBUF_INCLUDED_messages_2eproto
#define GOOGLE_PROTOBUF_INCLUDED_messages_2eproto

#include <limits>
#include <string>

#include <google/protobuf/port_def.inc>
#if PROTOBUF_VERSION < 3012000
#error This file was generated by a newer version of protoc which is
#error incompatible with your Protocol Buffer headers. Please update
#error your headers.
#endif
#if 3012003 < PROTOBUF_MIN_PROTOC_VERSION
#error This file was generated by an older version of protoc which is
#error incompatible with your Protocol Buffer headers. Please
#error regenerate this file with a newer version of protoc.
#endif

#include <google/protobuf/port_undef.inc>
#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/arena.h>
#include <google/protobuf/arenastring.h>
#include <google/protobuf/generated_message_table_driven.h>
#include <google/protobuf/generated_message_util.h>
#include <google/protobuf/inlined_string_field.h>
#include <google/protobuf/metadata_lite.h>
#include <google/protobuf/message_lite.h>
#include <google/protobuf/repeated_field.h>  // IWYU pragma: export
#include <google/protobuf/extension_set.h>  // IWYU pragma: export
// @@protoc_insertion_point(includes)
#include <google/protobuf/port_def.inc>
#define PROTOBUF_INTERNAL_EXPORT_messages_2eproto
PROTOBUF_NAMESPACE_OPEN
namespace internal {
class AnyMetadata;
}  // namespace internal
PROTOBUF_NAMESPACE_CLOSE

// Internal implementation detail -- do not use these members.
struct TableStruct_messages_2eproto {
  static const ::PROTOBUF_NAMESPACE_ID::internal::ParseTableField entries[]
    PROTOBUF_SECTION_VARIABLE(protodesc_cold);
  static const ::PROTOBUF_NAMESPACE_ID::internal::AuxiliaryParseTableField aux[]
    PROTOBUF_SECTION_VARIABLE(protodesc_cold);
  static const ::PROTOBUF_NAMESPACE_ID::internal::ParseTable schema[1]
    PROTOBUF_SECTION_VARIABLE(protodesc_cold);
  static const ::PROTOBUF_NAMESPACE_ID::internal::FieldMetadata field_metadata[];
  static const ::PROTOBUF_NAMESPACE_ID::internal::SerializationTable serialization_table[];
  static const ::PROTOBUF_NAMESPACE_ID::uint32 offsets[];
};
class VCO_set;
class VCO_setDefaultTypeInternal;
extern VCO_setDefaultTypeInternal _VCO_set_default_instance_;
PROTOBUF_NAMESPACE_OPEN
template<> ::VCO_set* Arena::CreateMaybeMessage<::VCO_set>(Arena*);
PROTOBUF_NAMESPACE_CLOSE

// ===================================================================

class VCO_set PROTOBUF_FINAL :
    public ::PROTOBUF_NAMESPACE_ID::MessageLite /* @@protoc_insertion_point(class_definition:VCO_set) */ {
 public:
  inline VCO_set() : VCO_set(nullptr) {};
  virtual ~VCO_set();

  VCO_set(const VCO_set& from);
  VCO_set(VCO_set&& from) noexcept
    : VCO_set() {
    *this = ::std::move(from);
  }

  inline VCO_set& operator=(const VCO_set& from) {
    CopyFrom(from);
    return *this;
  }
  inline VCO_set& operator=(VCO_set&& from) noexcept {
    if (GetArena() == from.GetArena()) {
      if (this != &from) InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }

  inline const std::string& unknown_fields() const {
    return _internal_metadata_.unknown_fields<std::string>(::PROTOBUF_NAMESPACE_ID::internal::GetEmptyString);
  }
  inline std::string* mutable_unknown_fields() {
    return _internal_metadata_.mutable_unknown_fields<std::string>();
  }

  static const VCO_set& default_instance();

  static void InitAsDefaultInstance();  // FOR INTERNAL USE ONLY
  static inline const VCO_set* internal_default_instance() {
    return reinterpret_cast<const VCO_set*>(
               &_VCO_set_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    0;

  friend void swap(VCO_set& a, VCO_set& b) {
    a.Swap(&b);
  }
  inline void Swap(VCO_set* other) {
    if (other == this) return;
    if (GetArena() == other->GetArena()) {
      InternalSwap(other);
    } else {
      ::PROTOBUF_NAMESPACE_ID::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(VCO_set* other) {
    if (other == this) return;
    GOOGLE_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  inline VCO_set* New() const final {
    return CreateMaybeMessage<VCO_set>(nullptr);
  }

  VCO_set* New(::PROTOBUF_NAMESPACE_ID::Arena* arena) const final {
    return CreateMaybeMessage<VCO_set>(arena);
  }
  void CheckTypeAndMergeFrom(const ::PROTOBUF_NAMESPACE_ID::MessageLite& from)
    final;
  void CopyFrom(const VCO_set& from);
  void MergeFrom(const VCO_set& from);
  PROTOBUF_ATTRIBUTE_REINITIALIZES void Clear() final;
  bool IsInitialized() const final;

  size_t ByteSizeLong() const final;
  const char* _InternalParse(const char* ptr, ::PROTOBUF_NAMESPACE_ID::internal::ParseContext* ctx) final;
  ::PROTOBUF_NAMESPACE_ID::uint8* _InternalSerialize(
      ::PROTOBUF_NAMESPACE_ID::uint8* target, ::PROTOBUF_NAMESPACE_ID::io::EpsCopyOutputStream* stream) const final;
  void DiscardUnknownFields();
  int GetCachedSize() const final { return _cached_size_.Get(); }

  private:
  inline void SharedCtor();
  inline void SharedDtor();
  void SetCachedSize(int size) const;
  void InternalSwap(VCO_set* other);
  friend class ::PROTOBUF_NAMESPACE_ID::internal::AnyMetadata;
  static ::PROTOBUF_NAMESPACE_ID::StringPiece FullMessageName() {
    return "VCO_set";
  }
  protected:
  explicit VCO_set(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  private:
  static void ArenaDtor(void* object);
  inline void RegisterArenaDtor(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  public:

  std::string GetTypeName() const final;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kNameFieldNumber = 1,
    kPowerFieldNumber = 2,
    kTuningVoltageFieldNumber = 3,
  };
  // required string name = 1;
  bool has_name() const;
  private:
  bool _internal_has_name() const;
  public:
  void clear_name();
  const std::string& name() const;
  void set_name(const std::string& value);
  void set_name(std::string&& value);
  void set_name(const char* value);
  void set_name(const char* value, size_t size);
  std::string* mutable_name();
  std::string* release_name();
  void set_allocated_name(std::string* name);
  private:
  const std::string& _internal_name() const;
  void _internal_set_name(const std::string& value);
  std::string* _internal_mutable_name();
  public:

  // required int32 power = 2;
  bool has_power() const;
  private:
  bool _internal_has_power() const;
  public:
  void clear_power();
  ::PROTOBUF_NAMESPACE_ID::int32 power() const;
  void set_power(::PROTOBUF_NAMESPACE_ID::int32 value);
  private:
  ::PROTOBUF_NAMESPACE_ID::int32 _internal_power() const;
  void _internal_set_power(::PROTOBUF_NAMESPACE_ID::int32 value);
  public:

  // required float tuning_voltage = 3;
  bool has_tuning_voltage() const;
  private:
  bool _internal_has_tuning_voltage() const;
  public:
  void clear_tuning_voltage();
  float tuning_voltage() const;
  void set_tuning_voltage(float value);
  private:
  float _internal_tuning_voltage() const;
  void _internal_set_tuning_voltage(float value);
  public:

  // @@protoc_insertion_point(class_scope:VCO_set)
 private:
  class _Internal;

  // helper for ByteSizeLong()
  size_t RequiredFieldsByteSizeFallback() const;

  template <typename T> friend class ::PROTOBUF_NAMESPACE_ID::Arena::InternalHelper;
  typedef void InternalArenaConstructable_;
  typedef void DestructorSkippable_;
  ::PROTOBUF_NAMESPACE_ID::internal::HasBits<1> _has_bits_;
  mutable ::PROTOBUF_NAMESPACE_ID::internal::CachedSize _cached_size_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr name_;
  ::PROTOBUF_NAMESPACE_ID::int32 power_;
  float tuning_voltage_;
  friend struct ::TableStruct_messages_2eproto;
};
// ===================================================================


// ===================================================================

#ifdef __GNUC__
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// VCO_set

// required string name = 1;
inline bool VCO_set::_internal_has_name() const {
  bool value = (_has_bits_[0] & 0x00000001u) != 0;
  return value;
}
inline bool VCO_set::has_name() const {
  return _internal_has_name();
}
inline void VCO_set::clear_name() {
  name_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  _has_bits_[0] &= ~0x00000001u;
}
inline const std::string& VCO_set::name() const {
  // @@protoc_insertion_point(field_get:VCO_set.name)
  return _internal_name();
}
inline void VCO_set::set_name(const std::string& value) {
  _internal_set_name(value);
  // @@protoc_insertion_point(field_set:VCO_set.name)
}
inline std::string* VCO_set::mutable_name() {
  // @@protoc_insertion_point(field_mutable:VCO_set.name)
  return _internal_mutable_name();
}
inline const std::string& VCO_set::_internal_name() const {
  return name_.Get();
}
inline void VCO_set::_internal_set_name(const std::string& value) {
  _has_bits_[0] |= 0x00000001u;
  name_.SetLite(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void VCO_set::set_name(std::string&& value) {
  _has_bits_[0] |= 0x00000001u;
  name_.SetLite(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:VCO_set.name)
}
inline void VCO_set::set_name(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  _has_bits_[0] |= 0x00000001u;
  name_.SetLite(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:VCO_set.name)
}
inline void VCO_set::set_name(const char* value,
    size_t size) {
  _has_bits_[0] |= 0x00000001u;
  name_.SetLite(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:VCO_set.name)
}
inline std::string* VCO_set::_internal_mutable_name() {
  _has_bits_[0] |= 0x00000001u;
  return name_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* VCO_set::release_name() {
  // @@protoc_insertion_point(field_release:VCO_set.name)
  if (!_internal_has_name()) {
    return nullptr;
  }
  _has_bits_[0] &= ~0x00000001u;
  return name_.ReleaseNonDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void VCO_set::set_allocated_name(std::string* name) {
  if (name != nullptr) {
    _has_bits_[0] |= 0x00000001u;
  } else {
    _has_bits_[0] &= ~0x00000001u;
  }
  name_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), name,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:VCO_set.name)
}

// required int32 power = 2;
inline bool VCO_set::_internal_has_power() const {
  bool value = (_has_bits_[0] & 0x00000002u) != 0;
  return value;
}
inline bool VCO_set::has_power() const {
  return _internal_has_power();
}
inline void VCO_set::clear_power() {
  power_ = 0;
  _has_bits_[0] &= ~0x00000002u;
}
inline ::PROTOBUF_NAMESPACE_ID::int32 VCO_set::_internal_power() const {
  return power_;
}
inline ::PROTOBUF_NAMESPACE_ID::int32 VCO_set::power() const {
  // @@protoc_insertion_point(field_get:VCO_set.power)
  return _internal_power();
}
inline void VCO_set::_internal_set_power(::PROTOBUF_NAMESPACE_ID::int32 value) {
  _has_bits_[0] |= 0x00000002u;
  power_ = value;
}
inline void VCO_set::set_power(::PROTOBUF_NAMESPACE_ID::int32 value) {
  _internal_set_power(value);
  // @@protoc_insertion_point(field_set:VCO_set.power)
}

// required float tuning_voltage = 3;
inline bool VCO_set::_internal_has_tuning_voltage() const {
  bool value = (_has_bits_[0] & 0x00000004u) != 0;
  return value;
}
inline bool VCO_set::has_tuning_voltage() const {
  return _internal_has_tuning_voltage();
}
inline void VCO_set::clear_tuning_voltage() {
  tuning_voltage_ = 0;
  _has_bits_[0] &= ~0x00000004u;
}
inline float VCO_set::_internal_tuning_voltage() const {
  return tuning_voltage_;
}
inline float VCO_set::tuning_voltage() const {
  // @@protoc_insertion_point(field_get:VCO_set.tuning_voltage)
  return _internal_tuning_voltage();
}
inline void VCO_set::_internal_set_tuning_voltage(float value) {
  _has_bits_[0] |= 0x00000004u;
  tuning_voltage_ = value;
}
inline void VCO_set::set_tuning_voltage(float value) {
  _internal_set_tuning_voltage(value);
  // @@protoc_insertion_point(field_set:VCO_set.tuning_voltage)
}

#ifdef __GNUC__
  #pragma GCC diagnostic pop
#endif  // __GNUC__

// @@protoc_insertion_point(namespace_scope)


// @@protoc_insertion_point(global_scope)

#include <google/protobuf/port_undef.inc>
#endif  // GOOGLE_PROTOBUF_INCLUDED_GOOGLE_PROTOBUF_INCLUDED_messages_2eproto
