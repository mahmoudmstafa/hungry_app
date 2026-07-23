import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/constants/app_photos.dart';
import 'package:hungry_app/core/widgets/profile_photo_widget.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../aut_feature/presentation/manager/cubits/auth_cubit.dart';

class AppBarHomeView extends StatelessWidget {
  const AppBarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          AppPhotos.kLogo,
          color: AppColors.kPrimaryColor,
          width: 180,
        ),
        ProfilePhotoWidgetWithoutAdd(
          photo: BlocProvider.of<AuthCubit>(context).user.photo,
          width: 60,
          height: 60,
        ),
      ],
    );
  }
}
