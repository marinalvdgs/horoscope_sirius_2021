// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FullHoroHiveModelAdapter extends TypeAdapter<FullHoroHiveModel> {
  @override
  final int typeId = 0;

  @override
  FullHoroHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FullHoroHiveModel(
      sign: fields[0] as String,
      love: fields[1] as Horo,
      bisiness: fields[2] as Horo,
      common: fields[3] as Horo,
      health: fields[4] as Horo,
    );
  }

  @override
  void write(BinaryWriter writer, FullHoroHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.sign)
      ..writeByte(1)
      ..write(obj.love)
      ..writeByte(2)
      ..write(obj.bisiness)
      ..writeByte(3)
      ..write(obj.common)
      ..writeByte(4)
      ..write(obj.health);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FullHoroHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
