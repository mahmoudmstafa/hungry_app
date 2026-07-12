class ProductEntity {
  final String id;




  final String productImage, title, desc;

  final double price;
  final bool isFavourite;

  final num rate;

  ProductEntity({
    required this.productImage,
    required this.title,
    required this.desc,
    required this.price,
    required this.isFavourite,
    required this.rate,
    required this.id,
  });
}

