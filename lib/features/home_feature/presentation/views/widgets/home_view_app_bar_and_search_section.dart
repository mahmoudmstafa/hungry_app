import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'home_header_delegete.dart';

class HomeViewAppBarAndSearchSection extends StatelessWidget {
  const HomeViewAppBarAndSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = context.read<AuthCubit>().user;

        return SliverPersistentHeader(
          pinned: true,
          delegate: HomeHeaderDelegate(
            user: user,
          ),
        );
      },
    );
  }
}

