import 'package:flutter/material.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/sign_up_form_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/sign_up_header_section.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: SignUpHeaderSection(),
              ),
              Expanded(
                flex: 6,
                child: SignUpFormSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


