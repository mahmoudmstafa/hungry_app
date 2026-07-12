import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/assets.dart';
import '../../manager/cubits/search_products_cubit/search_products_cubit.dart';

class TextFieldHomeView extends StatefulWidget {
  const TextFieldHomeView({
    super.key,
  });

  @override
  State<TextFieldHomeView> createState() => _TextFieldHomeViewState();
}

class _TextFieldHomeViewState extends State<TextFieldHomeView> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: CustomTextFormField(
        controller: searchTextController,
        onChanged: (searchQuery) {
          context.read<SearchProductsCubit>().onSearchQueryChanged(
            searchQuery,
          );
        },
        cursorColor: kSecondaryColor,
        textStyle: TextStyle(
          color: kSecondaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        focusedBorderColor: kPrimaryColor,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            top: 14.0,
            bottom: 13,
            left: 25,
            right: 28,
          ),
          child: SvgPicture.asset(
            Assets.assets.images.search.path,
            width: 24,
          ),
        ),
        hintText: "Search",
        hintColor: kSecondaryColor,
        enabledBorderColor: Colors.white,
      ),
    );
  }
}