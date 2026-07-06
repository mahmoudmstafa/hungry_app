// import 'package:hungry_app/core/utils/use_case.dart';
// import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';
// import 'package:hungry_app/features/aut_feature/domain/repos/auth_repo.dart';
// import 'package:hungry_app/features/aut_feature/domain/use_cases/params/update_user_param.dart';
//
// class UpdateProfileUseCase
//     implements UseCase<void, UpdateUserParam> {
//   final AuthRepo repository;
//
//   UpdateProfileUseCase(this.repository);
//
//   @override
//   Future<void> call(UpdateUserParam params) async {
//     return await repository.updateProfile(
//         name: params.name, photo: params.photo);
//   }
// }