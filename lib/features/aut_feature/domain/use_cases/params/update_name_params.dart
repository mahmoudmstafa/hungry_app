import 'dart:io';


class UpdateNameParams {
  final String name;
  final File? photo;

  const UpdateNameParams({
    required this.name,
    this.photo,
  });
}
