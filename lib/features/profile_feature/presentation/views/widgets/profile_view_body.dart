import 'package:flutter/material.dart';

import 'package:hungry_app/core/widgets/custom_modal_progress_hud.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/profile_view_form.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/profile_view_header.dart';


class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomModalProgressHud(
      isLoading: isLoading,
      child: const Column(
        children: [
          // header
          Expanded(
            flex: 4,
            child: ProfileViewHeader(),
          ),

          // form
          Expanded(
            flex: 7,
            child: ProfileViewForm(),
          ),
        ],
      ),
    );
  }
}
