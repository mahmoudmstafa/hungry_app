import 'package:flutter/material.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/login_form_section_bloc_listener.dart';

import 'login_header_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // header
              Expanded(
                flex: 3,
                child: LoginHeaderSection(),
              ),

              // form
              Expanded(
                flex: 4,
                child: LoginFormSectionBlocListener(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
