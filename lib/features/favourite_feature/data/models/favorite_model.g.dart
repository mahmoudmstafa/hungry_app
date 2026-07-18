// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteModelAdapter extends TypeAdapter<FavouriteModel> {
  @override
  final typeId = 9;

  @override
  FavouriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteModel(
      id: fields[0] as String,
      title: fields[1] as String,
      desc: fields[2] as String,
      productImage: fields[3] as String,
      price: (fields[4] as num).toDouble(),
      rate: fields[5] as num,
      isFavourite: fields[6] as bool,
      categoryId: fields[7] as String,
      userId: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.productImage)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.rate)
      ..writeByte(6)
      ..write(obj.isFavourite)
      ..writeByte(7)
      ..write(obj.categoryId)
      ..writeByte(8)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
