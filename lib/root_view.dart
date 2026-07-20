import 'package:flutter/material.dart';

import '../../core/utils/constant.dart';
import 'core/widgets/root_controller.dart';
import 'features/cart_feature/presentation/views/cart_view.dart';
import 'features/favourite_feature/presentation/views/favourites_view.dart';
import 'features/home_feature/presentation/views/home_view.dart';
import 'features/checkout_and_order_history_feature/presentation/views/order_history_view.dart';
import 'features/profile_feature/presentation/views/profile_view.dart';
import 'package:get/get.dart';


class RootView extends StatelessWidget {
  const RootView({super.key});

  final List<Widget Function()> pages = const [
    _homePage,
    _cartPage,
    _favouritesPage,
    _orderHistoryPage,
    _profilePage,
  ];

  static Widget _homePage() => const HomeView();
  static Widget _cartPage() => const CartView();
  static Widget _favouritesPage() => const FavouritesView();
  static Widget _orderHistoryPage() => const OrderHistoryView();
  static Widget _profilePage() => const ProfileView();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RootController>();

    // بيزامن الـ Tab مع الـ arguments الجديدة كل مرة الصفحة تتفتح تاني،
    // حتى لو الـ Controller القديم لسه موجود ومتعملوش onInit تاني
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final int? requestedIndex = Get.arguments;
      if (requestedIndex != null &&
          requestedIndex != controller.currentIndex.value) {
        controller.changeTab(requestedIndex);
      }
    });

    return Obx(() {
      final isFavouritesPage = controller.currentIndex.value == 2;

      return Scaffold(
        backgroundColor: isFavouritesPage ? kSecondaryColor : Colors.white,
        body: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: controller.pageController,
          itemCount: pages.length,
          onPageChanged: controller.onPageChanged,
          itemBuilder: (context, index) {
            return pages[index]();
          },
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 5,
              left: 20,
              right: 20,
            ),
            height: 75,
            color: kPrimaryColor,
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: controller.currentIndex.value,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                onTap: controller.changeTab,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_rounded),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_restaurant_sharp),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}