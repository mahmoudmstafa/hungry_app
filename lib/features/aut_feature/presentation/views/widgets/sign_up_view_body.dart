import 'package:flutter/material.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/sign_up_form_section_bloc_listener.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/sign_up_header_section.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

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
                flex: 4,
                child: SignUpHeaderSection(),
              ),

              // form
              Expanded(
                flex: 6,
                child: SignUpFormSectionBlocListener(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
