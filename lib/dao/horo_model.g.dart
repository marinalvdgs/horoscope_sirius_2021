// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HoroHiveModelAdapter extends TypeAdapter<HoroHiveModel> {
  @override
  final int typeId = 0;

  @override
  HoroHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HoroHiveModel(
      id: fields[0] as int,
      yesterday: fields[1] as String,
      today: fields[2] as String,
      tomorrow: fields[3] as String,
      tomorrow02: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HoroHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.yesterday)
      ..writeByte(2)
      ..write(obj.today)
      ..writeByte(3)
      ..write(obj.tomorrow)
      ..writeByte(4)
      ..write(obj.tomorrow02);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HoroHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
