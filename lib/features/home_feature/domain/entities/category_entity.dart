class CategoryEntity {
  final String id;
  final String name;
  final String image;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
  });

  List<Object?> get props => [id, name, image];
}
