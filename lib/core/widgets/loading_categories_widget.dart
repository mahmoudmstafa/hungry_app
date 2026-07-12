import 'package:flutter/material.dart';

import '../utils/constant.dart';
import 'custom_animation_loading_widget.dart';
import 'custom_button.dart';

class LoadingCategoriesWidget extends StatefulWidget {
  const LoadingCategoriesWidget({
    super.key,
  });

  @override
  State<LoadingCategoriesWidget> createState() =>
      _LoadingCategoriesWidgetState();
}

class _LoadingCategoriesWidgetState extends State<LoadingCategoriesWidget> {
  bool shouldShowWidget = false;

  @override
  void initState() {
    super.initState();

    // بنستنى وقت بسيط قبل ما نظهر شاشة التحميل
    Future.delayed(const Duration(seconds: 500), () {
      if (mounted) {
        setState(() {
          shouldShowWidget = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // لو الوقت لسه مخلصش، منعرضش أي حاجة خالص
    if (shouldShowWidget == false) {
      return const SizedBox.shrink();
    }

    return Center(
      child: CustomAnimationLoadingWidget(
        child: SizedBox(
          height: 50,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: CustomButton(
                  text: 'Loading ...',
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  backgroundColor: kSecondaryColor,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        ),
      ),
    );
  }
}