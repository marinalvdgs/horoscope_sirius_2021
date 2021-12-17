// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HoroAdapter extends TypeAdapter<Horo> {
  @override
  final int typeId = 1;

  @override
  Horo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Horo(
      sign: fields[0] as String,
      yesterday: fields[1] as String,
      today: fields[2] as String,
      tomorrow: fields[3] as String,
      tomorrow02: fields[4] as String,
      date: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Horo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.sign)
      ..writeByte(1)
      ..write(obj.yesterday)
      ..writeByte(2)
      ..write(obj.today)
      ..writeByte(3)
      ..write(obj.tomorrow)
      ..writeByte(4)
      ..write(obj.tomorrow02)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HoroAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
