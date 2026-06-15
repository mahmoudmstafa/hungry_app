import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/utils/assets.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/bottom_bar.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/food_card.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/app_bar_home_view.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/home_view_body.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/text_field_home_view.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'widgets/food_card_grid_view.dart';
import 'widgets/menu_buttons_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return HomeViewBody();
  }
}



