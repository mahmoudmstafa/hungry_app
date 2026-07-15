// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemModelAdapter extends TypeAdapter<CartItemModel> {
  @override
  final typeId = 5;

  @override
  CartItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItemModel(
      userId: fields[0] as String,
      productId: fields[1] as String,
      name: fields[2] as String,
      image: fields[3] as String,
      basePrice: (fields[4] as num).toDouble(),
      toppings: (fields[5] as List).cast<ToppingModel>(),
      sideOptions: (fields[6] as List).cast<SideOptionsModel>(),
      totalPrice: (fields[7] as num).toDouble(),
      quantity: (fields[8] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, CartItemModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.basePrice)
      ..writeByte(5)
      ..write(obj.toppings)
      ..writeByte(6)
      ..write(obj.sideOptions)
      ..writeByte(7)
      ..write(obj.totalPrice)
      ..writeByte(8)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
