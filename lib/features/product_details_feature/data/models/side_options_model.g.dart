// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'side_options_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SideOptionsModelAdapter extends TypeAdapter<SideOptionsModel> {
  @override
  final typeId = 7;

  @override
  SideOptionsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SideOptionsModel(
      name: fields[1] as String,
      price: fields[3] as num,
      image: fields[2] as String,
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SideOptionsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SideOptionsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
