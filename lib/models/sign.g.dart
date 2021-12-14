// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignAdapter extends TypeAdapter<Sign> {
  @override
  final int typeId = 5;

  @override
  Sign read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sign(
      name: fields[0] as String,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Sign obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
