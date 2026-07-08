import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';

import '../../../../aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'custom_password_text_form_field_profile_view.dart';
import 'custom_text_form_field_profile_view.dart';

class TextFormFieldsProfileViewSection extends StatefulWidget {
  const TextFormFieldsProfileViewSection({
    super.key, this.onChangedName,
  });
  final ValueChanged<String>? onChangedName;
  @override
  State<TextFormFieldsProfileViewSection> createState() =>
      _TextFormFieldsProfileViewSectionState();
}

class _TextFormFieldsProfileViewSectionState
    extends State<TextFormFieldsProfileViewSection> {
  late UserEntity user = BlocProvider.of<AuthCubit>(context).user;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  // late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: user.name,
    );
    _emailController = TextEditingController(
      text: user.email,
    );
    // _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFieldProfileView(
          onChanged: widget.onChangedName ,
          controller: _nameController,
          hintText: 'Name',
        ),
        Gap(15),
        CustomTextFormFieldProfileView(
          enable: false,
          controller: _emailController,
          hintText: 'Email',
        ),
        Gap(15),
        // CustomTextFormFieldProfileView(
        //   hintText: 'Delivery address',
        // ),
        // Gap(15),
        // CustomPasswordTextFormFieldProfileView(
        //   controller: _passwordController,
        // ),
      ],
    );
  }
}
