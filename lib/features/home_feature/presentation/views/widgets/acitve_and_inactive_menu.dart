import 'package:flutter/material.dart';
import 'package:hungry_app/features/home_feature/domain/entities/category_entity.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';

class ActiveAndInActiveButtonMenu extends StatelessWidget {
  const ActiveAndInActiveButtonMenu({
    super.key,
    required this.isActive, required this.categoryEntity,
  });

  final bool isActive;

  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: categoryEntity.name ,
      textColor: isActive ? Colors.white : const Color(0xff6A6A6A),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      backgroundColor: isActive ? AppColors.kPrimaryColor : const Color(0xffF3F4F6),
    );
  }
}

