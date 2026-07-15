import 'package:hive_ce/hive.dart';
part 'side_options_model.g.dart';
@HiveType(typeId: 7)
class SideOptionsModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final num price;

  SideOptionsModel({
    required this.name,
    required this.price,
    required this.image,
    required this.id,
  });

  factory SideOptionsModel.fromJson(Map<String, dynamic> json) {
    return SideOptionsModel(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      id: json['_id'],
    );
  }
}
