import 'package:flutter/material.dart';

import 'core/app_setup/app_pages.dart';
import 'core/constants/app_colors.dart';
import 'core/widgets/custom_bottom_navigation_bar.dart';
import 'core/widgets/root_controller.dart';
import 'package:get/get.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final List<Widget Function()> pages = const [
    AppPages.homePage,
    AppPages.cartPage,
    AppPages.favouritesPage,
    AppPages.orderHistoryPage,
    AppPages.profilePage,
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<RootController>().findArgumentsFromTab();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RootController>();
    return Obx(() {
      final isFavouritesPage = controller.currentIndex.value == 2;

      return Scaffold(
        backgroundColor: isFavouritesPage ? AppColors.kSecondaryColor : Colors.white,
        body: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: controller.pageController,
          itemCount: pages.length,
          onPageChanged: controller.onPageChanged,
          itemBuilder: (context, index) {
            return pages[index]();
          },
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          controller: controller,
        ),
      );
    });
  }
}
