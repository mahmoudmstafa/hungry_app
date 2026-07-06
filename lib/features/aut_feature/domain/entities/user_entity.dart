



class UserEntity {
  final String firebaseUid;
  final String name;
  final String email;
  final String? photo;

  const UserEntity({
    required this.firebaseUid,
    required this.name,
    required this.email,
    this.photo,
  });
}