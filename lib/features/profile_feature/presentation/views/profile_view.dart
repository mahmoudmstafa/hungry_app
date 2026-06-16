import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/profile_view_body.dart';

import '../../../../core/widgets/custom_scaffold.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const String id = 'ProfileView';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: kPrimaryColor,
      child: ProfileViewBody(),
    );
  }
}