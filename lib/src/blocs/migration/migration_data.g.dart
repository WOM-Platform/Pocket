// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MigrationDataAdapter extends TypeAdapter<MigrationData> {
  @override
  final int typeId = 0;

  @override
  MigrationData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MigrationData(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MigrationData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.registryUrl)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.deadline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MigrationDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
