import 'package:hive_ce/hive.dart';
part 'toppings_model.g.dart';
@HiveType(typeId: 6)
class ToppingModel extends HiveObject {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final num price;

  ToppingModel({
    required this.name,
    required this.price,
    required this.image,
    required this.id,
  });

  factory ToppingModel.fromJson(Map<String, dynamic> json) {
    return ToppingModel(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      id: json['_id'],
    );
  }
}
